//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace eZeroOne.Domain
{
    using System;
    using System.Collections.Generic;
    
    public  class Transaction
    {
        public int Id { get; set; }
        public int InvoiceId { get; set; }
        public int ItemId { get; set; }
        public int Quantity { get; set; }
        public decimal Discount { get; set; }
        public decimal Tax { get; set; }
        public decimal Total { get; set; }
    }
}
