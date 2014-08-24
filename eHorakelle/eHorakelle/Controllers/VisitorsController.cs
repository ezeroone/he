using System.Security;
using System.Web.Mvc;

namespace eZeroOne.eHorakelle.Controllers
{
    [assembly: AllowPartiallyTrustedCallers]
    public class VisitorsController : Controller
    {
        //
        // GET: /Visitors/

        public ActionResult Index()
        {
            return View();
        }

    }
}
