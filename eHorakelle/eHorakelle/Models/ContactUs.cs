using System;
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
    public class GpsData
    {
        public int Id { get; set; }
        public string SensorData { get; set; }
        public DateTime DataTime { get; set; }
        public int VehicleId { get; set; }
        public decimal Lat { get; set; }
        public decimal Long { get; set; }
        public string DeviceName { get; set; }
        public bool IsActive { get; set; }
    }
}