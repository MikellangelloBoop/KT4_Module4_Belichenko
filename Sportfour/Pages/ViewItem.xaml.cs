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
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Sportfour.Pages
{
        /// <summary>
        /// Логика взаимодействия для List.xaml
        /// </summary>
        public partial class ViewItem : Page
        {
            public ViewItem()
            {
                InitializeComponent();
                Init();
                ProductListView.ItemsSource = Data.SportEntities.GetContext().User.ToList();

            }

            public void Init()
            {
                ProductListView.ItemsSource = Data.SportEntities.GetContext().User.ToList();
                var RoleList = Data.SportEntities.GetContext().Role.ToList();
                RoleList.Insert(0, new Data.Role { Role1 = "Все Должности" });
                RoleCombo.ItemsSource = RoleList;
                RoleCombo.SelectedIndex = 0;

                CountOfLabel.Content = $"{Data.SportEntities.GetContext().User.Count()}/"
                     + $"{Data.SportEntities.GetContext().User.Count()}";
            }

            private void UpdateCountLabel()
            {
                int TotalCount = Data.SportEntities.GetContext().User.Count();
                int CurrentCount = _currentuser.Count();
                CountOfLabel.Content = $"{CurrentCount} / {TotalCount}";
            }
            public List<Data.User> _currentuser = Data.SportEntities.GetContext().User.ToList();

            public void Update()
            {
                _currentuser = Data.SportEntities.GetContext().User.ToList();

                _currentuser = (from user in Data.SportEntities.GetContext().User
                                where
                                user.Surname.ToLower().Contains(SearchBox.Text) ||
                                user.Name.ToLower().Contains(SearchBox.Text) ||
                                user.DateOfBirth.ToString().ToLower().Contains(SearchBox.Text) ||
                                user.Login.ToLower().Contains(SearchBox.Text) ||
                                user.Gender.Gender1.ToLower().Contains(SearchBox.Text) ||
                                user.Role.Role1.ToLower().Contains(SearchBox.Text)
                                select user).ToList();

                if (SortUpButton.IsChecked == true)
                {
                    _currentuser = _currentuser.OrderBy(x => x.DateOfBirth).ToList();
                }
                if (SortDownButton.IsChecked == true)
                {
                    _currentuser = _currentuser.OrderByDescending(x => x.DateOfBirth).ToList();
                }
                var selected = RoleCombo.SelectedItem as Data.Role;
                if (selected != null && selected.Role1 != "Все Должности")
                {
                    _currentuser = _currentuser.Where(d => d.Role.Id == selected.Id).ToList();
                }


                CountOfLabel.Content = $"{_currentuser.Count}/{Data.SportEntities.GetContext().User.Count()}";

                ProductListView.ItemsSource = _currentuser;
            }

            private void SearchBox_TextChanged(object sender, TextChangedEventArgs e)
            {
                Update();
            }
            private void SortUpButton_Checked(object sender, RoutedEventArgs e)
            {
                Update();
            }
            private void SortDownButton_Checked(object sender, RoutedEventArgs e)
            {
                Update();
            }
            private void RoleCombo_SelectionChanged(object sender, SelectionChangedEventArgs e)
            {
                Update();
            }

        private void EditButton_Click(object sender, RoutedEventArgs e)
        {
            Class.Manager.MainFrame.Navigate(new Pages.AddUser((sender as Button).DataContext as Data.User));
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            Class.Manager.MainFrame.Navigate(new Pages.AddUser(null));
        }

    }
    }

