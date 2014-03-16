using System.Collections.Generic;

namespace eZeroOne.eHorakelle.Models
{
    public class BookingViewModel
    {
        public int PropertyId { get; set; }
        public string UserName { get; set; }
        public int NoOfDays { get; set; }
        public string BookingFrom { get; set; }
        public string BookingTo { get; set; }

        public int Adult { get; set; }
        public int Children { get; set; }
        public int Child6Yrs { get; set; }

        public List<RoomModel> Rooms { get; set; }
    }


}