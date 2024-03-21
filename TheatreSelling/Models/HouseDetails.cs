namespace TheatreSelling.Models;

public class HouseDetails
{
    public int HouseDetailsId { get; set; }
    public int HouseId { get; set; }
    public string AreaTitle { get; set; }
    public int NumberOfRows { get; set; }
    public int NumberOfPlaces { get; set; }
    public int PricePolicyId { get; set; }
}