using System.Collections.Generic;

namespace eZeroOne.eHorakelle.Models
{
    public class FeatureGroup
    {
        public int Id { get; set; }
        public string GroupName { get; set; }
        public List<Features> Features { get; set; }
    }
}