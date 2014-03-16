using System;
using System.Collections.Generic;

namespace eZeroOne.Domain
{
    public class Room
    {
        public int Id { get; set; }
        public int PropertyId { get; set; }
        public int Occupancy { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public decimal DisplayPrice { get; set; }
        public decimal Squarefeet { get; set; }
        public decimal Discount { get; set; }
        public decimal Tax { get; set; }
        public bool IsActive { get; set; }
        public string VideoUrl { get; set; }

        public virtual List<BedRoom> BedRooms { get; set; }
        public virtual List<RoomImage> RoomImages { get; set; } 
    }
}