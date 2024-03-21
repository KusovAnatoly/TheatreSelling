using System.Threading.Tasks;
using CommunityToolkit.Mvvm.Input;
using TheatreSelling.Views;

namespace TheatreSelling.ViewModels;

// Обязательно partial, чтобы работалы генераторы кода
public partial class MainWindowViewModel : ViewModelBase
{
    [RelayCommand]
    private void OpenCrud()
    {
        var window = new CrudWindow();
        window.Show();
    }

    [RelayCommand]
    private void OpenQuery()
    {
        var window = new QueryWindow();
        window.Show();
    }
    
    private async Task AddItem()
    {
        // string connectionString = "Host=localhost;Username=postgres;Password=q12345678;Database=theatre";
        //
        // await using var conn = new NpgsqlConnection(connectionString);
        // {
        //     await conn.OpenAsync();
        //     await using var cmd = new NpgsqlCommand("INSERT INTO public.sex (name) VALUES (@text);", conn);
        //     cmd.Parameters.AddWithValue("text", Text);
        //     await cmd.ExecuteNonQueryAsync();
        // }
        //
        // var box = MessageBoxManager
        //     .GetMessageBoxStandard("Caption", $"You added new item - {Text}",
        //         ButtonEnum.YesNo);
        //
        // var result = await box.ShowAsync();

        
    }
}