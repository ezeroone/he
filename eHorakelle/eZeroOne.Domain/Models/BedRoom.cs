using System.ComponentModel.DataAnnotations.Schema;

namespace eZeroOne.Domain
{
    public class BedRoom
    {
        public int Id { get; set; }

        public int BedId { get; set; }
        [ForeignKey("BedId")]
        public virtual Bed Bed { get; set; }
        public int RoomId { get; set; }
        [ForeignKey("RoomId")]
        public virtual Room Room { get; set; }
        public decimal Rate { get; set; }
    }
}