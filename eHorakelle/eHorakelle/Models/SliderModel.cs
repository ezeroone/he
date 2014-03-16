using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace eZeroOne.eHorakelle.Models
{
    public class SliderModel
    {
        public int Id { get; set; }
        [Required]
        public string PlaceName { get; set; }
        [Required]
        public string Distance { get; set; }
        // [Required]
        public decimal Latitude { get; set; }
        //[Required]
        public decimal Longitude { get; set; }
        [Required]
        public string ImageName { get; set; }
        [Required]
        public string Location { get; set; }

        public string PlaceUrl { get; set; }
        public string ImageDescription { get; set; }
        public List<SliderModel> Sliders { get; set; }
        public int DisplayOrder { get; set; }

        
    }
}