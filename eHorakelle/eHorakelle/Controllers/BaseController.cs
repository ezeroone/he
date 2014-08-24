using System;
using System.Globalization;
using System.Security;
using System.Web.Mvc;

namespace eZeroOne.eHorakelle.Controllers
{
    [assembly: AllowPartiallyTrustedCallers]
    public class BaseController : Controller
    {
        public class DateTimeBinder : IModelBinder
        {
            public object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
            {
                var uiCulture = System.Configuration.ConfigurationManager.AppSettings["UICulture"].ToString(CultureInfo.InvariantCulture);
                var value = bindingContext.ValueProvider.GetValue(bindingContext.ModelName);
                var date = value.ConvertTo(typeof(DateTime), CultureInfo.GetCultureInfo(uiCulture));

                return date;
            }
        }

    }
}
