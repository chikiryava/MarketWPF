using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Zad5.Models;

public partial class Product
{
    [Required(ErrorMessage = "Артикул товара является обязательным")]
    [RegularExpression("[A-Z0-9]{6}", ErrorMessage = "Введите только цифры и заглавные английские буквы (Кол-во символов 6)")]
    public string ProductArticleNumber { get; set; } = null!;

    [Required(ErrorMessage = "Название товара является обязательной")]
    [StringLength(200, MinimumLength = 2, ErrorMessage = "Введите от 2 до 200 символов")]
    public string ProductName { get; set; } = null!;

    [Required(ErrorMessage = "Описание товара является обязательным")]
    [StringLength(500, MinimumLength = 2, ErrorMessage = "Введите от 2 до 500 символов")]
    public string ProductDescription { get; set; } = null!;

    public int ProductCategoryId { get; set; }

    public int ProductManufacturerId { get; set; }

    [Required(ErrorMessage = "Стоимость товара является обязательной")]
    [Range(0, 1000000, ErrorMessage = "Введите стоимость товара в диапазоне от 0 до 1.000.000")]
    public int ProductCost { get; set; }

    public int ProductUnit { get; set; }

   
    public int ProductDiscountAmount { get; set; }

    [Required(ErrorMessage = "Количество товара является обязательным")]
    [Range(0, 10000, ErrorMessage = "Введите количество товара в диапазоне от 0 до 10.000")]
    public int ProductQuantityInStock { get; set; }

    public int ProductProviderId { get; set; }

    public string? ProductPhoto { get; set; }

    public virtual ICollection<OrderProduct> OrderProducts { get; set; } = new List<OrderProduct>();

    [Required(ErrorMessage = "Выберите категорию")]
    public virtual ProductCategory ProductCategory { get; set; } = null!;

    [Required(ErrorMessage = "Выберите производителя")]
    public virtual ProductManufacture ProductManufacturer { get; set; } = null!;

    [Required(ErrorMessage = "Выберите поставщика")]
    public virtual ProductProvider ProductProvider { get; set; } = null!;
    public virtual ProductUnit ProductUnitNavigation { get; set; } = null!;
}
