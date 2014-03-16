namespace eZeroOne.eHorakelle.Models
{
    public class ImageModel
    {
        public int Id { get; set; }
        public int PropertyId { get; set; }
        public string ImageDescription { get; set; }
        public string ImagePath { get; set; }
        public bool DefaultImage { get; set; }
    }
}