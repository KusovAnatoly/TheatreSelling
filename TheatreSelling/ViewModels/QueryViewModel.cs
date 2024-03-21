using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MsBox.Avalonia;
using Npgsql;
using TheatreSelling.Models;

namespace TheatreSelling.ViewModels;

public partial class QueryViewModel : ViewModelBase
{
    private const string ConnectionString = "Host=localhost;Username=postgres;Password=q12345678;Database=theatre";

    [ObservableProperty]
    private object _data;
    
    public IAsyncRelayCommand LoadDataAsyncRelayCommand { get; set; }
    
    public QueryViewModel()
    {
        LoadDataAsyncRelayCommand = new AsyncRelayCommand<object>(LoadDataAsync);
    }
    

    private async Task LoadDataAsync(object parameter)
    {
        var temp = parameter.ToString();
        switch (temp)
        {
            case "building":
                await LoadBuilding();
                break;
            case "employee":
                await LoadEmployee();
                break;
            case "event":
                await LoadEvent();
                break;
            case "house":
                await LoadBuilding();
                break;
            case "house_details":
                await LoadBuilding();
                break;
            case "payment":
                await LoadBuilding();
                break;
            case "payment_type":
                await LoadBuilding();
                break;
            case "play":
                await LoadBuilding();
                break;
            case "position":
                await LoadBuilding();
                break;
            case "price_policy":
                await LoadBuilding();
                break;
            case "sex":
                await LoadBuilding();
                break;
            case "ticket":
                await LoadBuilding();
                break;
        }
    }

    private async Task LoadBuilding()
    {
        await using var conn = new NpgsqlConnection(ConnectionString);
        
        await conn.OpenAsync();
        
        await using var cmd = new NpgsqlCommand("SELECT * FROM public.building", conn);
        
        await using var reader = await cmd.ExecuteReaderAsync();
        
        var items = new List<Building>();
        
        while (await reader.ReadAsync())
        {
            var data = new Building()
            {
                BuildingId = reader.GetInt32(0),
                Title = reader.GetString(1),
                Address = reader.GetString(2),
                ManagerId = reader.GetInt32(3)
            };
            items.Add(data);
        }
        Data = items;
    }
    
    private async Task LoadEmployee()
    {
        await using var conn = new NpgsqlConnection(ConnectionString);
        
        await conn.OpenAsync();
        
        await using var cmd = new NpgsqlCommand("SELECT * FROM public.employee", conn);
        
        await using var reader = await cmd.ExecuteReaderAsync();
        
        var items = new List<Employee>();
        
        while (await reader.ReadAsync())
        {
            var data = new Employee()
            {
                EmployeeId = reader.GetInt32(0),
                FirstName = reader.GetString(1),
                MiddleName = reader.GetString(2),
                LastName = reader.GetString(3),
                SexId = reader.GetInt32(4),
                PositionId = reader.GetInt32(5),
                EmailAddress = reader.GetString(6),
                PhoneNumber = reader.GetString(7)
            };
            items.Add(data);
        }
        Data = items;
    }
    
    
    private async Task LoadEvent()
    {
        
        await using var conn = new NpgsqlConnection(ConnectionString);
        
        await conn.OpenAsync();
        
        await using var cmd = new NpgsqlCommand("SELECT * FROM public.event", conn);
        
        await using var reader = await cmd.ExecuteReaderAsync();
        
        var items = new List<Event>();
        
        while (await reader.ReadAsync())
        {
            var data = new Event()
            {
                EventId = reader.GetInt32(0),
                Date = reader.GetDateTime(1),
                Description = reader.GetString(2),
                HouseId = reader.GetInt32(3),
                PlayId = reader.GetInt32(4)
            };
            items.Add(data);
        }
        Data = items;
    }
}