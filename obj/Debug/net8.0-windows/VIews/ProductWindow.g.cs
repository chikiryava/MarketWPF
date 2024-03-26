﻿#pragma checksum "..\..\..\..\VIews\ProductWindow.xaml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "BA6F0DB53F1358B3AA7A2D634821C7AB64725253"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Controls.Ribbon;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;
using Zad5.VIews;


namespace Zad5.VIews {
    
    
    /// <summary>
    /// ProductWindow
    /// </summary>
    public partial class ProductWindow : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 17 "..\..\..\..\VIews\ProductWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock totalRecordsTextBlock;
        
        #line default
        #line hidden
        
        
        #line 19 "..\..\..\..\VIews\ProductWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox searchTextBox;
        
        #line default
        #line hidden
        
        
        #line 23 "..\..\..\..\VIews\ProductWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox filterComboBox;
        
        #line default
        #line hidden
        
        
        #line 31 "..\..\..\..\VIews\ProductWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox sortingComboBox;
        
        #line default
        #line hidden
        
        
        #line 38 "..\..\..\..\VIews\ProductWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button buttonAddProduct;
        
        #line default
        #line hidden
        
        
        #line 39 "..\..\..\..\VIews\ProductWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button buttonEditProduct;
        
        #line default
        #line hidden
        
        
        #line 40 "..\..\..\..\VIews\ProductWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button buttonDeleteProduct;
        
        #line default
        #line hidden
        
        
        #line 41 "..\..\..\..\VIews\ProductWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button buttonExit;
        
        #line default
        #line hidden
        
        
        #line 46 "..\..\..\..\VIews\ProductWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ListView productsListView;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "8.0.1.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/Zad5;component/views/productwindow.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\..\VIews\ProductWindow.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "8.0.1.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.totalRecordsTextBlock = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 2:
            this.searchTextBox = ((System.Windows.Controls.TextBox)(target));
            
            #line 19 "..\..\..\..\VIews\ProductWindow.xaml"
            this.searchTextBox.TextChanged += new System.Windows.Controls.TextChangedEventHandler(this.SearchTextBox_OnTextChanged);
            
            #line default
            #line hidden
            return;
            case 3:
            this.filterComboBox = ((System.Windows.Controls.ComboBox)(target));
            
            #line 23 "..\..\..\..\VIews\ProductWindow.xaml"
            this.filterComboBox.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.FilterComboBox_OnSelectionChanged);
            
            #line default
            #line hidden
            return;
            case 4:
            this.sortingComboBox = ((System.Windows.Controls.ComboBox)(target));
            
            #line 31 "..\..\..\..\VIews\ProductWindow.xaml"
            this.sortingComboBox.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.SortingComboBox_OnSelectionChanged);
            
            #line default
            #line hidden
            return;
            case 5:
            this.buttonAddProduct = ((System.Windows.Controls.Button)(target));
            
            #line 38 "..\..\..\..\VIews\ProductWindow.xaml"
            this.buttonAddProduct.Click += new System.Windows.RoutedEventHandler(this.ButtonAddProduct_OnClick);
            
            #line default
            #line hidden
            return;
            case 6:
            this.buttonEditProduct = ((System.Windows.Controls.Button)(target));
            
            #line 39 "..\..\..\..\VIews\ProductWindow.xaml"
            this.buttonEditProduct.Click += new System.Windows.RoutedEventHandler(this.updateProduct);
            
            #line default
            #line hidden
            return;
            case 7:
            this.buttonDeleteProduct = ((System.Windows.Controls.Button)(target));
            
            #line 40 "..\..\..\..\VIews\ProductWindow.xaml"
            this.buttonDeleteProduct.Click += new System.Windows.RoutedEventHandler(this.deleteProduct);
            
            #line default
            #line hidden
            return;
            case 8:
            this.buttonExit = ((System.Windows.Controls.Button)(target));
            
            #line 41 "..\..\..\..\VIews\ProductWindow.xaml"
            this.buttonExit.Click += new System.Windows.RoutedEventHandler(this.ButtonExit_OnClick);
            
            #line default
            #line hidden
            return;
            case 9:
            this.productsListView = ((System.Windows.Controls.ListView)(target));
            
            #line 46 "..\..\..\..\VIews\ProductWindow.xaml"
            this.productsListView.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.checkSelection);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

