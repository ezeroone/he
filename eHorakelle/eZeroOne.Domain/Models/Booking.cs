//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System.ComponentModel.DataAnnotations.Schema;

namespace eZeroOne.Domain
{
    using System;
    using System.Collections.Generic;
    
    public  class Booking
    {
        public int Id { get; set; }
        public int PropertyId { get; set; }
        public int CustomerId { get; set; }
        public int VisitorId { get; set; }
        public System.DateTime DateFrom { get; set; }
        public System.DateTime DateTo { get; set; }
        public decimal Amount { get; set; }
        public decimal Discount { get; set; }
        public decimal Tax { get; set; }

        public decimal PaidAmount { get; set; }
        public string BookingHtlmString { get; set; }

        //[ForeignKey("Invoice_Id")]
        public virtual Invoice Invoice { get; set; }
    }
}
