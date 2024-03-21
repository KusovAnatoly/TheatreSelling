using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MsBox.Avalonia;
using MsBox.Avalonia.Enums;
using Npgsql;
using TheatreSelling.Models;

namespace TheatreSelling.ViewModels;

// Обязательно partial, чтобы работалы генераторы кода
public partial class MainWindowViewModel : ViewModelBase
{
    public MainWindowViewModel()
    {
        AddItemAsyncCommand = new AsyncRelayCommand(AddItem);
        Task.Run(LoadDataAsync);
    }
    
    public IAsyncRelayCommand  LoadDataAsyncRelayCommand { get; set; }

    private async Task LoadDataAsync()
    {
        var connectionString = "Host=localhost;Username=postgres;Password=q12345678;Database=theatre";

        await using var conn = new NpgsqlConnection(connectionString);
        
        await conn.OpenAsync();
            
        // Example 2: Execute a SQL command that returns results
        await using var cmd = new NpgsqlCommand("SELECT * FROM public.sex", conn);
        
        await using var reader = await cmd.ExecuteReaderAsync();
        
        var items = new List<Sex>();
        
        while (await reader.ReadAsync())
        {
            var data = new Sex
            {
                // Assuming Data class has properties corresponding to table columns
                SexId = reader.GetInt32(0),
                Name = reader.GetString(1),
                // Add more properties as needed
            };
            items.Add(data); // Add data to the list
        }
        Items = new (items);
    }
    
    [ObservableProperty]
    private string _text;
    
    [ObservableProperty]
    private Sex _newItem;
    
    [ObservableProperty]
    private ObservableCollection<Sex> _items = new ObservableCollection<Sex>();
    
    public IAsyncRelayCommand AddItemAsyncCommand { get; set; }
    
    private async Task AddItem()
    {
        string connectionString = "Host=localhost;Username=postgres;Password=q12345678;Database=theatre";
        
        await using var conn = new NpgsqlConnection(connectionString);
        {
            await conn.OpenAsync();
            await using var cmd = new NpgsqlCommand("INSERT INTO public.sex (name) VALUES (@text);", conn);
            cmd.Parameters.AddWithValue("text", Text);
            await cmd.ExecuteNonQueryAsync();
        }
        
        var box = MessageBoxManager
            .GetMessageBoxStandard("Caption", $"You added new item - {Text}",
                ButtonEnum.YesNo);

        var result = await box.ShowAsync();

        await LoadDataAsync();
    }
}