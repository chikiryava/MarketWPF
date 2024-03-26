using Microsoft.EntityFrameworkCore;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.IO;
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
using Zad5.Data;
using Zad5.Models;


namespace Zad5.VIews
{
    /// <summary>
    /// Логика взаимодействия для AddProductWindow.xaml
    /// </summary>
    public partial class AddProductWindow : Window
    {
        private Product currentProduct;
        private bool update = false;
        private string originalPathImage = null;
        public AddProductWindow()
        {
            InitializeComponent();
            currentProduct = new Product();
            DataContext = currentProduct;
            currentProduct.ProductPhoto = "нет";
            buttonAddOrUpdate.Content = "Добавить";
            TextBoxproductName.Focus();
            window.Title = "ООО Ткани - Добавление продукта";

        }
        public AddProductWindow(Product product, bool update)
        {
            InitializeComponent();
            currentProduct = product;
            this.update = update;
            DataContext = currentProduct;
            buttonAddOrUpdate.Content = "Изменить";
            TextBoxproductName.Focus();
            window.Title = "ООО Ткани - Изменение продукта";
        }
        private void loadWindow(object sender, RoutedEventArgs e)
        {
            using (var context = new WildBerriesContext())
            {
                unitComboBox.ItemsSource = context.ProductUnits.ToList();
                unitComboBox.DisplayMemberPath = "UnitName";
                categoriesComboBox.ItemsSource = context.ProductCategories.ToList();
                categoriesComboBox.DisplayMemberPath = "CategoriesName";
                suppliersComboBox.ItemsSource = context.ProductProviders.ToList();
                suppliersComboBox.DisplayMemberPath = "ProviderName";
                manufacturerComboBox.ItemsSource = context.ProductManufactures.ToList();
                manufacturerComboBox.DisplayMemberPath = "ManufacturerName";

                unitComboBox.SelectedItem = context.ProductUnits.FirstOrDefault(u => u.UnitId == currentProduct.ProductUnit);
                categoriesComboBox.SelectedItem = context.ProductCategories.FirstOrDefault(c => c.CategriesId == currentProduct.ProductCategoryId);
                suppliersComboBox.SelectedItem = context.ProductProviders.FirstOrDefault(p => p.ProviderId == currentProduct.ProductProviderId);
                manufacturerComboBox.SelectedItem = context.ProductManufactures.FirstOrDefault(m => m.ManufacturerId == currentProduct.ProductManufacturerId);
            }
        }
        private void updatePhoto(object sender, RoutedEventArgs e)
        {
            OpenFileDialog dialog = new OpenFileDialog
            {
                Filter = "Изображения (*.png;*.jpg)|*.png;*.jpg",
                Title = "Выбор изображения"
            };
            if (dialog.ShowDialog() == true)
            {
                if (!string.IsNullOrEmpty(originalPathImage) && originalPathImage != "")
                {
                    var oldImagePath = System.IO.Path.Combine(Environment.CurrentDirectory, "Images", originalPathImage);
                    if (File.Exists(oldImagePath))
                    {
                        File.Delete(oldImagePath);
                    }
                }
                var newPhotoName = System.IO.Path.GetRandomFileName() + ".png";
                var selectedPhoto = dialog.FileName;
                var newPhotoFullName = System.IO.Path.Combine(Environment.CurrentDirectory, "Images", newPhotoName);

                if (!IsImageSizeValid(selectedPhoto))
                {
                    MessageBox.Show("Пожалуйста, выберите другое изображение.");
                    return;
                }

                File.Copy(selectedPhoto, newPhotoFullName);
                currentProduct.ProductPhoto = newPhotoName;

                DataContext = null;
                DataContext = currentProduct;
            }
        }
        private bool IsImageSizeValid(string filePath)
        {
            var fileInfo = new FileInfo(filePath);
            return fileInfo.Length <= 2097152;
        }
        private void addUpdateProduct(object sender, RoutedEventArgs e)
        {
           
            var validationContext = new ValidationContext(currentProduct);
            
            var results = new List<System.ComponentModel.DataAnnotations.ValidationResult>();
           
            var isValid = Validator.TryValidateObject(currentProduct, validationContext, results, true);

           
            if (!isValid)
            {
                errorsLabel.Content = string.Empty;
               
                foreach (var error in results)
                {
                    errorsLabel.Content += error.ErrorMessage + "\r\n";
                }
                return;
            }

            using (var context = new WildBerriesContext())
            {
                if (update) // изменение
                {
                    context.Products.Update(currentProduct);
                }
                else
                {
                    context.Entry(currentProduct).State = EntityState.Added;
                }
                context.SaveChanges();
            }

            originalPathImage = currentProduct.ProductPhoto;
            Close();
        }

        private void ButtonCancel_OnClick(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
