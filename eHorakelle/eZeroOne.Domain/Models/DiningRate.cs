namespace eZeroOne.Domain
{
    public class DiningRate
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal Rate { get; set; }
        public decimal ChildRate { get; set; }
       
    }
}