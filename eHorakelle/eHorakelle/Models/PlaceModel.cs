using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace eZeroOne.eHorakelle.Models
{
    public class PlaceModel
    {
        public int Id { get; set; }
        public int PropertyId { get; set; }
         [Required]
        public string PlaceName { get; set; }
         [Required]
        public decimal Distance { get; set; }
         [Required]
         public decimal Latitude { get; set; }
         [Required]
         public decimal Longitude { get; set; }
         [Required]
        public string TimeTake { get; set; }
         
        public string TravelBy { get; set; }
        [Required]
        public int Travel { get; set; }
        public List<PlaceModel> Places { get; set; }
        public int PoiId { get; set; }

        public string Description { get; set; }
    }


    public class BedModel
    {
        public int Id { get; set; }
        [Required]
        public string BedName { get; set; }
        [Required]
        public decimal Rate { get; set; }
        [Required]
        public int Occupancy { get; set; }
        [Required]
        public int ChildOccupancy { get; set; }
        public List<BedModel> Beds { get; set; }
    }

    public class DiningRateModel
    {
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public decimal Rate { get; set; }
        [Required]
        public decimal ChildRate { get; set; }
        public List<DiningRateModel> DiningRates { get; set; }
    }

    public class TransportModel
    {
        public int Id { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public decimal Rate { get; set; }
        
        public List<TransportModel> Transports { get; set; }
    }

    public class BedRoomModel
    {
        public int Id { get; set; }
        [Required]
        public int RoomId { get; set; }
        [Required]
        public int BedId { get; set; }
        //[Required]
        public decimal Rate { get; set; }

        public bool IsAllowed { get; set; }
        public string Room { get; set; }
        public string Bed { get; set; }

        public List<BedRoomModel> BedRooms { get; set; }

    }
}