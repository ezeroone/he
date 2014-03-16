namespace eZeroOne.Domain
{
    public class Bed
    {
        public int Id { get; set; }
        public string BedName { get; set; }
        public decimal Rate { get; set; }
        public int Occupancy { get; set; }
        public int ChildOccupancy { get; set; }
    }
}