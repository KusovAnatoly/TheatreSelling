using Avalonia.Controls;
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