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
    
    public  class PropertyImage
    {
        public int Id { get; set; }
        public int PropertyId { get; set; }
        public string ImageDescription { get; set; }
        public string ImagePath { get; set; }
        public Nullable<bool> DefaultImage { get; set; }
    }
}
