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
    
    public  class User
    {
        public int UserId { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public bool IsEmailActivated { get; set; }
        public bool Active { get; set; }
        public System.DateTime Created { get; set; }
        public int CompanyId { get; set; }
        public int RoleId { get; set; }
    }
}
