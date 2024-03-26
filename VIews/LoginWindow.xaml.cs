using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;
using Zad5.Data;
using Zad5.VIews;

namespace Zad5
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow :Window
    {
        private DispatcherTimer timer = new DispatcherTimer
        {
            Interval = TimeSpan.FromSeconds(1),
            IsEnabled = false
        };
        private int blockTime = 10;
        public MainWindow()
        {
            InitializeComponent();
            loginInput.Focus();
            timer.Tick += Timer_Tick;
        }

        private void Timer_Tick(object? sender, EventArgs e)
        {
            if (blockTime == 0)
            {
                unblockWindow();
                return;
            }

            loginButton.Content = blockTime.ToString();
            blockTime--;
        }

        private void login(object sender, RoutedEventArgs e)
        {
            var context = new WildBerriesContext();

            var user = context
                .Users
                .FirstOrDefault(u => u.UserLogin == loginInput.Text && (u.UserPassword == passwordInput.Password || u.UserPassword == passwordInputVisiible.Text));

            string currentCaptcha = captchaFirstBlock.Text + captchaSecondBlock.Text;
            if (captchaInput.Text.Trim() != currentCaptcha)
            {
                MessageBox.Show("Символы с картинки введены неверно! Окно будет заблокировано",
                    "Ошибка входа",
                    MessageBoxButton.OK,
                    MessageBoxImage.Warning);
                updateCaptcha();
                blockWindow();
                return;
            }
            if (user is null)
            {
                MessageBox.Show("Неверный логин или пароль. Проверьте введенные данные",
                "Ошибка входа",
                MessageBoxButton.OK,
                MessageBoxImage.Warning);
                updateCaptcha();
                return;
            }
            bool isAdmin = false;
            if (user.UserRole == 1)
                isAdmin = true;
            MessageBox.Show("Вход успешен");
            ProductWindow window = new ProductWindow(isAdmin);
            window.Show();
            Close();



        }
        private void updateCaptcha()
        {
            const string alphabet = "qwertyuiopasdfghjklzxcvbnm1234567890";

            var rng = new Random();

            captchaFirstBlock.Text = $"{alphabet[rng.Next(alphabet.Length)]}{alphabet[rng.Next(alphabet.Length)]}";
            captchaSecondBlock.Text = $"{alphabet[rng.Next(alphabet.Length)]}{alphabet[rng.Next(alphabet.Length)]}";
            captchaSecondBlock.Margin = new Thickness(0, rng.Next(-10, 10), rng.Next(-10, 10), 0);
            captchaContainer.Visibility = Visibility.Visible;
        }
        private void blockWindow()
        {
            IsEnabled = false;
            blockTime = 10;
            timer.Start();
        }

        private void unblockWindow()
        {
            timer.Stop();
            IsEnabled = true;
            loginButton.Content = "Вход в систему";
        }




        private void cbPasswordVisibility_Checked(object sender, RoutedEventArgs e)
        {
            passwordInput.Visibility = Visibility.Collapsed;
            passwordInputVisiible.Visibility = Visibility.Visible;
            tbVisiblePassword.Text = "Скрыть пароль";
            passwordInputVisiible.Text = passwordInput.Password;
        }

        private void cbPasswordVisibility_Unchecked(object sender, RoutedEventArgs e)
        {
            passwordInput.Visibility = Visibility.Visible;
            passwordInputVisiible.Visibility = Visibility.Collapsed;
            tbVisiblePassword.Text = "Показать пароль";
            passwordInput.Password = passwordInputVisiible.Text;
        }

        private void loginGuest(object sender, RoutedEventArgs e)
        {
            ProductWindow window = new ProductWindow(false);
            window.Show();
            Close();
        }
    }
}