using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace eZeroOne.eHorakelle.Models
{
    public class ActivityModel
    {
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public string Description { get; set; }
        public int PropertyId { get; set; }
        [Required]
        public decimal Rate { get; set; }
        [Required]
        public decimal ChildRate { get; set; }
        
        public List<ActivityModel> Activities { get; set; }
    }
}