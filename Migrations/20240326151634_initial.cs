using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Zad5.Migrations
{
    /// <inheritdoc />
    public partial class initial : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "OrderStatus",
                columns: table => new
                {
                    OrderStatusId = table.Column<int>(type: "int", nullable: false),
                    OrderStatusName = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_OrderStatus", x => x.OrderStatusId);
                });

            migrationBuilder.CreateTable(
                name: "PickupPoint",
                columns: table => new
                {
                    PickUpId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Index = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    City = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Adress = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PickupPoint", x => x.PickUpId);
                });

            migrationBuilder.CreateTable(
                name: "ProductCategories",
                columns: table => new
                {
                    CategriesId = table.Column<int>(type: "int", nullable: false),
                    CategoriesName = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductCategories", x => x.CategriesId);
                });

            migrationBuilder.CreateTable(
                name: "ProductManufactures",
                columns: table => new
                {
                    ManufacturerId = table.Column<int>(type: "int", nullable: false),
                    ManufacturerName = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductManufactures", x => x.ManufacturerId);
                });

            migrationBuilder.CreateTable(
                name: "ProductProviders",
                columns: table => new
                {
                    ProviderId = table.Column<int>(type: "int", nullable: false),
                    ProviderName = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductProviders", x => x.ProviderId);
                });

            migrationBuilder.CreateTable(
                name: "ProductUnits",
                columns: table => new
                {
                    UnitID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UnitName = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductUnits", x => x.UnitID);
                });

            migrationBuilder.CreateTable(
                name: "Role",
                columns: table => new
                {
                    RoleID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RoleName = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Role__8AFACE3AFABE96DE", x => x.RoleID);
                });

            migrationBuilder.CreateTable(
                name: "Product",
                columns: table => new
                {
                    ProductArticleNumber = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    ProductName = table.Column<string>(type: "nvarchar(200)", maxLength: 200, nullable: false),
                    ProductDescription = table.Column<string>(type: "nvarchar(500)", maxLength: 500, nullable: false),
                    ProductCategoryId = table.Column<int>(type: "int", nullable: false),
                    ProductManufacturerId = table.Column<int>(type: "int", nullable: false),
                    ProductCost = table.Column<int>(type: "int", nullable: false),
                    ProductUnit = table.Column<int>(type: "int", nullable: false),
                    ProductDiscountAmount = table.Column<int>(type: "int", nullable: false),
                    ProductQuantityInStock = table.Column<int>(type: "int", nullable: false),
                    ProductProviderId = table.Column<int>(type: "int", nullable: false),
                    ProductPhoto = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Product__2EA7DCD52E51452C", x => x.ProductArticleNumber);
                    table.ForeignKey(
                        name: "FK_Product_ProductCategories",
                        column: x => x.ProductCategoryId,
                        principalTable: "ProductCategories",
                        principalColumn: "CategriesId");
                    table.ForeignKey(
                        name: "FK_Product_ProductManufactures",
                        column: x => x.ProductManufacturerId,
                        principalTable: "ProductManufactures",
                        principalColumn: "ManufacturerId");
                    table.ForeignKey(
                        name: "FK_Product_ProductProviders",
                        column: x => x.ProductProviderId,
                        principalTable: "ProductProviders",
                        principalColumn: "ProviderId");
                    table.ForeignKey(
                        name: "FK_Product_ProductUnits",
                        column: x => x.ProductUnit,
                        principalTable: "ProductUnits",
                        principalColumn: "UnitID");
                });

            migrationBuilder.CreateTable(
                name: "User",
                columns: table => new
                {
                    UserID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserSurname = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    UserName = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    UserPatronymic = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    UserLogin = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    UserPassword = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    UserRole = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__User__1788CCACC2920DDA", x => x.UserID);
                    table.ForeignKey(
                        name: "FK__User__UserRole__3F466844",
                        column: x => x.UserRole,
                        principalTable: "Role",
                        principalColumn: "RoleID");
                });

            migrationBuilder.CreateTable(
                name: "Order",
                columns: table => new
                {
                    OrderId = table.Column<int>(type: "int", nullable: false),
                    OrderStatusId = table.Column<int>(type: "int", nullable: false),
                    OrderDeliveryDate = table.Column<DateTime>(type: "datetime", nullable: false),
                    OrderPickupPointId = table.Column<int>(type: "int", nullable: false),
                    ReceiptCode = table.Column<int>(type: "int", nullable: false),
                    OrderDate = table.Column<DateTime>(type: "datetime", nullable: false),
                    UserId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Order", x => x.OrderId);
                    table.ForeignKey(
                        name: "FK_Order_OrderStatus",
                        column: x => x.OrderStatusId,
                        principalTable: "OrderStatus",
                        principalColumn: "OrderStatusId");
                    table.ForeignKey(
                        name: "FK_Order_PickupPoint",
                        column: x => x.OrderPickupPointId,
                        principalTable: "PickupPoint",
                        principalColumn: "PickUpId");
                    table.ForeignKey(
                        name: "FK_Order_User",
                        column: x => x.UserId,
                        principalTable: "User",
                        principalColumn: "UserID");
                });

            migrationBuilder.CreateTable(
                name: "UserOrders",
                columns: table => new
                {
                    OrderId = table.Column<int>(type: "int", nullable: false),
                    UserId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserOrders", x => new { x.OrderId, x.UserId });
                    table.ForeignKey(
                        name: "FK_UserOrders_User",
                        column: x => x.UserId,
                        principalTable: "User",
                        principalColumn: "UserID");
                });

            migrationBuilder.CreateTable(
                name: "OrderProduct",
                columns: table => new
                {
                    OrderID = table.Column<int>(type: "int", nullable: false),
                    ProductArticleNumber = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false),
                    Amount = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__OrderPro__817A2662F17505A8", x => new { x.OrderID, x.ProductArticleNumber });
                    table.ForeignKey(
                        name: "FK_OrderProduct_Order",
                        column: x => x.OrderID,
                        principalTable: "Order",
                        principalColumn: "OrderId");
                    table.ForeignKey(
                        name: "FK__OrderProd__Produ__2E1BDC42",
                        column: x => x.ProductArticleNumber,
                        principalTable: "Product",
                        principalColumn: "ProductArticleNumber");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Order_OrderPickupPointId",
                table: "Order",
                column: "OrderPickupPointId");

            migrationBuilder.CreateIndex(
                name: "IX_Order_OrderStatusId",
                table: "Order",
                column: "OrderStatusId");

            migrationBuilder.CreateIndex(
                name: "IX_Order_UserId",
                table: "Order",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_OrderProduct_ProductArticleNumber",
                table: "OrderProduct",
                column: "ProductArticleNumber");

            migrationBuilder.CreateIndex(
                name: "IX_Product_ProductCategoryId",
                table: "Product",
                column: "ProductCategoryId");

            migrationBuilder.CreateIndex(
                name: "IX_Product_ProductManufacturerId",
                table: "Product",
                column: "ProductManufacturerId");

            migrationBuilder.CreateIndex(
                name: "IX_Product_ProductProviderId",
                table: "Product",
                column: "ProductProviderId");

            migrationBuilder.CreateIndex(
                name: "IX_Product_ProductUnit",
                table: "Product",
                column: "ProductUnit");

            migrationBuilder.CreateIndex(
                name: "IX_User_UserRole",
                table: "User",
                column: "UserRole");

            migrationBuilder.CreateIndex(
                name: "IX_UserOrders_UserId",
                table: "UserOrders",
                column: "UserId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "OrderProduct");

            migrationBuilder.DropTable(
                name: "UserOrders");

            migrationBuilder.DropTable(
                name: "Order");

            migrationBuilder.DropTable(
                name: "Product");

            migrationBuilder.DropTable(
                name: "OrderStatus");

            migrationBuilder.DropTable(
                name: "PickupPoint");

            migrationBuilder.DropTable(
                name: "User");

            migrationBuilder.DropTable(
                name: "ProductCategories");

            migrationBuilder.DropTable(
                name: "ProductManufactures");

            migrationBuilder.DropTable(
                name: "ProductProviders");

            migrationBuilder.DropTable(
                name: "ProductUnits");

            migrationBuilder.DropTable(
                name: "Role");
        }
    }
}
