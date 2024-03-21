namespace TheatreSelling.Models;

public class Play
{
    public int PlayId { get; set; }
    public int DirectorId { get; set; }
    public int ManagerId { get; set; }
    public int WriterId { get; set; }
    public string Author { get; set; }
    public string Cast { get; set; }
    public string Title { get; set; }
}