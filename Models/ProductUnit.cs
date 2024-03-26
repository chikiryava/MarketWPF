using System;
using System.Collections.Generic;

namespace Zad5.Models;

public partial class ProductUnit
{
    public int UnitId { get; set; }

    public string UnitName { get; set; } = null!;

    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
}
