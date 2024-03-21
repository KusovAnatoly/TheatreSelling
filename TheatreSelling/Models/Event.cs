using System;

namespace TheatreSelling.Models;

public class Event
{
    public int EventId { get; set; }
    public DateTime Date { get; set; }
    public string Description { get; set; }
    public int HouseId { get; set; }
    public int PlayId { get; set; }
}