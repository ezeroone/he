﻿using System;
using System.Collections.Generic;

namespace eZeroOne.Service.Visitors
{
    public interface IVisitorService
    {
        eZeroOne.Domain.Visitor GetVisitor(int userId);
        eZeroOne.Domain.Visitor GetVisitorbyUser(int visitorId);
        eZeroOne.Domain.Visitor SaveVisitor(eZeroOne.Domain.Visitor visitor);
               
        void SaveEmailNotifications(Guid id, int empId,int ? groupId, int?companyId,int userId);
        void UpdateEmailNotifications(Guid id, int empId);
        
        bool UpdateEmailNotifications(Guid id, int empId, string fromAdd, string toAdd, string subject, string body,
                                      string userName, string password, int port);
       
       
        bool DeleteNotifications(Guid id);
        List<Guid> GetEmailNotificationsIds();
    }
}
