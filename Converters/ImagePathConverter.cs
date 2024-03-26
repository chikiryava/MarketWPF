using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

namespace Zad5.Converters
{
    public class ImagePathConverter: IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            var filename = value as string;

            string pathToPhoto = System.IO.Path.Combine(Environment.CurrentDirectory, "Images", filename);

            if (!File.Exists(pathToPhoto))
            {
                return System.IO.Path.Combine(Environment.CurrentDirectory, "Images", "defaultphoto.jpg");
            }
            return pathToPhoto;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
