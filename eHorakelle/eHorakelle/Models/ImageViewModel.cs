using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace eZeroOne.eHorakelle.Models
{
    public class ImageViewModel
    {
        public int Id { get; set; }
        [Required]
        public string ImageDescription { get; set; }
        public bool DefaultImage { get; set; }
        public List<ImageModel> ImageList { get; set; }

       
    }
}