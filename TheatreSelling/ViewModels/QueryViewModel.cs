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
                await LoadHouse();
                break;
            case "house_details":
                await LoadHouseDetails();
                break;
            case "payment":
                await LoadPayment();
                break;
            case "payment_type":
                await LoadPaymentType();
                break;
            case "play":
                await LoadPlay();
                break;
            case "position":
                await LoadPosition();
                break;
            case "price_policy":
                await LoadPricePolicy();
                break;
            case "sex":
                await LoadSexes();
                break;
            case "ticket":
                await LoadTicket();
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
    
    private async Task LoadHouse()
    {
        await using var conn = new NpgsqlConnection(ConnectionString);
        
        await conn.OpenAsync();
        
        await using var cmd = new NpgsqlCommand("SELECT * FROM public.house", conn);
        
        await using var reader = await cmd.ExecuteReaderAsync();
        
        var items = new List<House>();
        
        while (await reader.ReadAsync())
        {
            var data = new House()
            {
                HouseId = reader.GetInt32(0),
                BuildingId = reader.GetInt32(1),
                Title = reader.GetString(2)
            };
            items.Add(data);
        }
        Data = items;
    }
    
    private async Task LoadHouseDetails()
    {
        await using var conn = new NpgsqlConnection(ConnectionString);
        
        await conn.OpenAsync();
        
        await using var cmd = new NpgsqlCommand("SELECT * FROM public.house_details", conn);
        
        await using var reader = await cmd.ExecuteReaderAsync();
        
        var items = new List<HouseDetails>();
        
        while (await reader.ReadAsync())
        {
            var data = new HouseDetails()
            {
                HouseDetailsId = reader.GetInt32(0),
                HouseId = reader.GetInt32(1),
                AreaTitle = reader.GetString(2),
                NumberOfRows = reader.GetInt32(3),
                NumberOfPlaces = reader.GetInt32(4),
                PricePolicyId = reader.GetInt32(5)
            };
            items.Add(data);
        }
        Data = items;
    }
    
    private async Task LoadPayment()
    {
        await using var conn = new NpgsqlConnection(ConnectionString);
        
        await conn.OpenAsync();
        
        await using var cmd = new NpgsqlCommand("SELECT * FROM public.payment", conn);
        
        await using var reader = await cmd.ExecuteReaderAsync();
        
        var items = new List<Payment>();
        
        while (await reader.ReadAsync())
        {
            var data = new Payment()
            {
                PaymentId = reader.GetInt32(0),
                Date = reader.GetDateTime(1),
                TicketId = reader.GetInt32(2),
                Amount = reader.GetDouble(3),
                PaymentTypeId = reader.GetInt32(4)
            };
            items.Add(data);
        }
        Data = items;
    }
    
    private async Task LoadPaymentType()
    {
        await using var conn = new NpgsqlConnection(ConnectionString);
        
        await conn.OpenAsync();
        
        await using var cmd = new NpgsqlCommand("SELECT * FROM public.payment_type", conn);
        
        await using var reader = await cmd.ExecuteReaderAsync();
        
        var items = new List<PaymentType>();
        
        while (await reader.ReadAsync())
        {
            var data = new PaymentType()
            {
                PaymentTypeId = reader.GetInt32(0),
                Name = reader.GetString(1),
            };
            items.Add(data);
        }
        Data = items;
    }
    
    private async Task LoadPlay()
    {
        await using var conn = new NpgsqlConnection(ConnectionString);
        
        await conn.OpenAsync();
        
        await using var cmd = new NpgsqlCommand("SELECT * FROM public.play", conn);
        
        await using var reader = await cmd.ExecuteReaderAsync();
        
        var items = new List<Play>();
        
        while (await reader.ReadAsync())
        {
            var data = new Play()
            {
                PlayId = reader.GetInt32(0),
                DirectorId = reader.GetInt32(1),
                ManagerId = reader.GetInt32(2),
                WriterId = reader.GetInt32(3),
                Author = reader.GetString(4),
                Cast = reader.GetString(5),
                Title = reader.GetString(6)
            };
            items.Add(data);
        }
        Data = items;
    }
    
    private async Task LoadPosition()
    {
        await using var conn = new NpgsqlConnection(ConnectionString);
        
        await conn.OpenAsync();
        
        await using var cmd = new NpgsqlCommand("SELECT * FROM public.position", conn);
        
        await using var reader = await cmd.ExecuteReaderAsync();
        
        var items = new List<Position>();
        
        while (await reader.ReadAsync())
        {
            var data = new Position()
            {
                PositionId = reader.GetInt32(0),
                Title = reader.GetString(1)
            };
            items.Add(data);
        }
        Data = items;
    }
    
    private async Task LoadPricePolicy()
    {
        await using var conn = new NpgsqlConnection(ConnectionString);
        
        await conn.OpenAsync();
        
        await using var cmd = new NpgsqlCommand("SELECT * FROM public.price_policy", conn);
        
        await using var reader = await cmd.ExecuteReaderAsync();
        
        var items = new List<PricePolicy>();
        
        while (await reader.ReadAsync())
        {
            var data = new PricePolicy()
            {
                PricePolicyId = reader.GetInt32(0),
                Title = reader.GetString(1),
                Price = reader.GetDouble(2)
            };
            items.Add(data);
        }
        Data = items;
    }
    
    private async Task LoadSexes()
    {
        await using var conn = new NpgsqlConnection(ConnectionString);
        
        await conn.OpenAsync();
        
        await using var cmd = new NpgsqlCommand("SELECT * FROM public.sex", conn);
        
        await using var reader = await cmd.ExecuteReaderAsync();
        
        var items = new List<Sex>();
        
        while (await reader.ReadAsync())
        {
            var data = new Sex()
            {
                SexId = reader.GetInt32(0),
                Name = reader.GetString(1)
            };
            items.Add(data);
        }
        Data = items;
    }
    
    private async Task LoadTicket()
    {
        await using var conn = new NpgsqlConnection(ConnectionString);
        
        await conn.OpenAsync();
        
        await using var cmd = new NpgsqlCommand("SELECT * FROM public.ticket", conn);
        
        await using var reader = await cmd.ExecuteReaderAsync();
        
        var items = new List<Ticket>();
        
        while (await reader.ReadAsync())
        {
            var data = new Ticket()
            {
                TicketId = reader.GetInt32(0),
                EventId = reader.GetInt32(1),
                CashierId = reader.GetInt32(2),
                CustomerId = reader.GetString(3),
                CustomerName = reader.GetString(4),
                CustomerEmail = reader.GetString(5),
                CustomerPhone = reader.GetString(6)
            };
            items.Add(data);
        }
        Data = items;
    }
}