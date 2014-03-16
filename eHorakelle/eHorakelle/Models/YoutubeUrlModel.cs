using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace eZeroOne.eHorakelle.Models
{
    public class YoutubeUrlModel
    {
        public int Id { get; set; }
        [Required]
        public string ImageName { get; set; }
        [Required]
        public string Url { get; set; }

        public List<YoutubeUrlModel> Urls { get; set; }



    }
}