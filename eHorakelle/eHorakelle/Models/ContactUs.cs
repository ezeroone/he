using System.ComponentModel.DataAnnotations;

namespace eZeroOne.eHorakelle.Models
{
    public class ContactUs
    {
        [Required]
        public string FirstName { get; set; }
        [Required]
        public string LastName { get; set; }
        [Required]
        public string Email { get; set; }
       
        public string ContactNumber { get; set; }
        [Required]
        public string Comments { get; set; }



    }
}