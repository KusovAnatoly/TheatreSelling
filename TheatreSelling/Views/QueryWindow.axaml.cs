using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using Avalonia;
using Avalonia.Controls;
using Avalonia.Interactivity;
using Avalonia.Markup.Xaml;
using Npgsql;
using TheatreSelling.Models;
using TheatreSelling.ViewModels;

namespace TheatreSelling.Views;

public partial class QueryWindow : Window
{
    public QueryWindow()
    {
        InitializeComponent();
        DataContext = new QueryViewModel();
    }
}