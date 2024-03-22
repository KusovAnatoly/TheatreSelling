namespace TheatreSelling.Models;

public class Ticket
{
    public int TicketId { get; set; }
    public int EventId { get; set; }
    public int CashierId { get; set; }
    public string CustomerId { get; set; }
    public string CustomerName { get; set; }
    public string CustomerEmail { get; set; }
    public string CustomerPhone { get; set; }
}