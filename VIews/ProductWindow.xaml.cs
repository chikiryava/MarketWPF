using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using Microsoft.EntityFrameworkCore;
using Zad5.Data;
using Zad5.Models;

namespace Zad5.VIews
{
    /// <summary>
    /// Логика взаимодействия для ProductWindow.xaml
    /// </summary>
    public partial class ProductWindow : Window
    {
        private int totalRecords = 0;


        public ProductWindow(bool userRole)
        {
            InitializeComponent();
            var context = new WildBerriesContext();
            productsListView.ItemsSource = LoadData();

            // производители
            var manufacturers = context.ProductManufactures.ToList();
            manufacturers.Insert(0, new ProductManufacture { ManufacturerId = 0, ManufacturerName = "Все производители" });
            filterComboBox.ItemsSource = manufacturers;

            filterComboBox.SelectedIndex = 0;
            sortingComboBox.SelectedIndex = 0;

            LoadTotalRecords();
            UpdateProductsList();

            if (!userRole)
            {
                buttonEditProduct.Visibility = Visibility.Hidden;
                buttonAddProduct.Visibility = Visibility.Hidden;
                buttonDeleteProduct.Visibility = Visibility.Hidden;
            }
        }
        private List<Product> LoadData()
        {
            using (var context = new WildBerriesContext())
            {
                var productList = context
                    .Products
                    .Include(p => p.ProductManufacturer)
                    .ToList();

                return productList;
            }
        }



        private void SearchTextBox_OnTextChanged(object sender, TextChangedEventArgs e) => UpdateProductsList();
        private void FilterComboBox_OnSelectionChanged(object sender, SelectionChangedEventArgs e) => UpdateProductsList();
        private void SortingComboBox_OnSelectionChanged(object sender, SelectionChangedEventArgs e) => UpdateProductsList();


        private void UpdateProductsList()
        {
            using (var context = new WildBerriesContext())
            {
                var productList = LoadData().AsQueryable();

                // Поиск 
                var searchQuery = searchTextBox.Text;
                if (!string.IsNullOrWhiteSpace(searchQuery))
                {
                    productList = productList.Where(p => p.ProductName.Contains(searchQuery));
                }

                // Фильтрация
                var selectedManufacturer = (ProductManufacture)filterComboBox.SelectedItem;
                if (selectedManufacturer != null && selectedManufacturer.ManufacturerId != 0)
                {
                    productList = productList.Where(p => p.ProductManufacturerId == selectedManufacturer.ManufacturerId);
                }

                // Сортировка
                switch (sortingComboBox.SelectedIndex)
                {
                    case 1:
                        productList = productList.OrderBy(p => p.ProductCost); // По возрастанию 
                        break;
                    case 2:
                        productList = productList.OrderByDescending(p => p.ProductCost); // По убыванию
                        break;
                }

                var filteredList = productList.ToList();
                productsListView.ItemsSource = filteredList;

                totalRecordsTextBlock.Text = $"Показано {filteredList.Count} из {totalRecords} записей";
            }
        }
        private void LoadTotalRecords()
        {
            using (var context = new WildBerriesContext())
            {
                totalRecords = context.Products.Count();
            }
        }


        private void ButtonExit_OnClick(object sender, RoutedEventArgs e)
        {
            var response = MessageBox.Show("Вы действительно хотите вернуться на стартовый экран?", "Вернуться",
                MessageBoxButton.YesNo, MessageBoxImage.Exclamation);
            if (response == MessageBoxResult.No)
            {

            }
            else
            {
                MainWindow mainWindow = new MainWindow();
                mainWindow.Show();
                this.Close();
            }
        }



        private void ButtonAddProduct_OnClick(object sender, RoutedEventArgs e)
        {
            AddProductWindow addProductWindow = new AddProductWindow();
            addProductWindow.ShowDialog();
            LoadTotalRecords();
            UpdateProductsList();
        }

        private void checkSelection(object sender, SelectionChangedEventArgs e)
        {
            bool hasSelectedItems = productsListView.SelectedItems.Count > 0;
            buttonEditProduct.IsEnabled = hasSelectedItems;
            buttonDeleteProduct.IsEnabled = hasSelectedItems;
        }

        private void updateProduct(object sender, RoutedEventArgs e)
        {
            Product? selectedProduct = productsListView.SelectedItem as Product;
            if (selectedProduct is not null)
            {
                var window = new AddProductWindow(selectedProduct, true);
                window.ShowDialog();
                UpdateProductsList();
            }
        }


        private void deleteProduct(object sender, RoutedEventArgs e)
        {
            Product? selectedProduct = productsListView.SelectedItem as Product;
            if (selectedProduct != null)
            {
                MessageBoxResult result = MessageBox.Show("Вы уверены, что хотите удалить продукт?", "Удаление продукта", MessageBoxButton.YesNo, MessageBoxImage.Question);
                if (result == MessageBoxResult.Yes)
                {
                    using (var context = new WildBerriesContext())
                    {
                        var productDelete = context.Products.FirstOrDefault(p => p.ProductArticleNumber == selectedProduct.ProductArticleNumber);
                        if (productDelete != null)
                        {
                            string productArticle = selectedProduct.ProductArticleNumber;
                            var sorted = context.OrderProducts.Include(p => p.Order).ToList();
                            if (sorted.Any(p => p.ProductArticleNumber == productArticle && p.Order.OrderStatusId == 1))
                            {
                                MessageBox.Show("Нельзя удалить продукт ", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                                return;
                            }
                            context.Products.Remove(productDelete);
                            context.SaveChanges();
                        }
                    }
                    LoadTotalRecords();
                    UpdateProductsList();
                }
            }
        }
    }
}
