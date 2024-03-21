using System;

namespace TheatreSelling.Models;

public class Payment
{
    public int PaymentId { get; set; }
    public DateTime Date { get; set; }
    public int TicketId { get; set; }
    public double Amount { get; set; }
    public int PaymentTypeId { get; set; }
}