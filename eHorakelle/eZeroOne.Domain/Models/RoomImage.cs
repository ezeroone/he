using System;
using System.ComponentModel.DataAnnotations.Schema;

namespace eZeroOne.Domain
{
    public class RoomImage
    {
        public int Id { get; set; }
        public int RoomId { get; set; }
        [ForeignKey("RoomId")]
        public virtual Room Room { get; set; }
        public string ImageDescription { get; set; }
        public string ImagePath { get; set; }
        public Nullable<bool> DefaultImage { get; set; }
    }
}