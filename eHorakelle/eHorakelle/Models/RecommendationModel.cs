using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace eZeroOne.eHorakelle.Models
{
    public class RecommendationModel
    {
        public int Id { get; set; }
        
        [Required]
        public string Name { get; set; }
        [Required]
        public string PhotoUrl { get; set; }
        [Required]
        public string Profession { get; set; }
        [Required]
        public string Email { get; set; }
        [Required]
        public string Comments { get; set; }

        public List<RecommendationModel> RecommendationList { get; set; }
    }
}