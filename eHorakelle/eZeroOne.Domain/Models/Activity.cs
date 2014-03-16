using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace eZeroOne.Domain
{
    public class Activity
    {
        public int Id { get; set; }
        public int PropertyId { get; set; }
        public string Name { get; set; }
        [ForeignKey("PropertyId")]
        public virtual Property Property { get; set; }
        public string Description { get; set; }
        [Display(Name="Adult Rate")]
        public decimal Rate { get; set; }
        [Display(Name = "Rate for Children")]
        public decimal ChildRate { get; set; }
       
    }
}