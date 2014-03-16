using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace eZeroOne.eHorakelle.Models
{
    public class RoomModel
    {
        public int Id { get; set; }
        public int PropertyId { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        [DataType(DataType.MultilineText)]
        public string Description { get; set; }
        [Required]
        [DataType(DataType.Currency)]
        public decimal DisplayPrice { get; set; }
        //[Required]
        public int NoOfRooms { get; set; }
        // [Required]
        public decimal Squarefeet { get; set; }
        public decimal Discount { get; set; }
        public decimal Tax { get; set; }
       
        public string VideoUrl { get; set; }
        public string AddedBy { get; set; }
        public string DefaultImageUrl { get; set; }
        public decimal Occupancy { get; set; }
        public decimal ChildOccupancy { get; set; }
        public List<BedModel> Beds { get; set; } 
       
    }

    public class BookingRoomModel : BaseBooking
    {
        
        public decimal Occupancy { get; set; }
        public decimal ChildOccupancy { get; set; }
        public List<RoomModel> Rooms { get; set; }
        
    }

    public class DateWisePrice
    {
        public DateTime Date { get; set; }
        public decimal Rate { get; set; }
    }
    public class PriceBreakDown : TempBooking
    {
        public int RoomId { get; set; }
        public string Name { get; set; }
        public DateTime Date { get; set; }
        public decimal Rate { get; set; }
        public decimal RateForKid { get; set; }
    }

    public class TempBooking : BaseBooking
    {
        public string SessionId { get; set; }
       
        public List<string> Rooms { get; set; }
        public List<string> ExtraBeds { get; set; }
        public List<string> DiningsByDays { get; set; }
        public List<string> ActivitiesByDays { get; set; }
        public List<string> Transports { get; set; }

    }
    public class BaseBooking
    {
        public DateTime CheckIn { get; set; }
        public DateTime CheckOut { get; set; }
        public int Adult { get; set; }
        public int Children { get; set; }
        public int Below6Yrs { get; set; }
    }

    public class BookingFlowModel 
    {
        [Required]
        public string FirstName { get; set; }
        public string LastName { get; set; }
        [Required]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }
        [Required]
        [DataType(DataType.PhoneNumber)]
        public string Phone { get; set; }
        public string Adderss { get; set; }
        public string Passport { get; set; }
        public string City { get; set; }
        public string Street { get; set; }
        public string State { get; set; }
        public string ZipCode { get; set; }
        public string Country { get; set; }
        
        [DataType(DataType.MultilineText)]
        public string SpecialRequirement { get; set; }

        public string ItemDescription { get; set; }
        public decimal TotalAmount { get; set; }
        public decimal DiscountAmount { get; set; }

        public bool PayFull { get; set; }

        [Required]
        public int UserId { get; set; }

        public List<PriceBreakDown> PriceBreakDowns { get; set; }
    }


    public class DayWiseRate
    {
        public DateTime Date { get; set; }
        public decimal Rate { get; set; }
        public List<DayRate> Rooms { get; set; }
        public List<DayRate> Dinings { get; set; }
        public List<DayRate> Activities { get; set; }
        public List<DayRate> Transports { get; set; }
    }
    public class DayRate
    {
        public string Name { get; set; }
        public DateTime Date { get; set; }
        public decimal Rate { get; set; }
    }
}