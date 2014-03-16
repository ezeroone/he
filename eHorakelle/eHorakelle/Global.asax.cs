using System;
using System.Configuration;
using System.Text;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Routing;
using Castle.MicroKernel.Registration;
using Castle.Windsor;
using eZeroOne.Domain;
using eZeroOne.MailService;
using eZeroOne.eHorakelle.App_Start;
using eZeroOne.eHorakelle.Controllers;
using eZeroOne.eHorakelle.Infrastructure;

namespace eZeroOne.eHorakelle
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801
    public class MvcApplication : System.Web.HttpApplication
    {
        //protected void Application_Start()
        //{
        //    AreaRegistration.RegisterAllAreas();

        //    WebApiConfig.Register(GlobalConfiguration.Configuration);
        //    FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
        //    RouteConfig.RegisterRoutes(RouteTable.Routes);
        //}
        protected void Application_Start()
        {
            //ModelBinders.Binders.Add(typeof(DateTime), new BaseController.DateTimeBinder());

            AreaRegistration.RegisterAllAreas();

            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            //ControllerBuilder.Current.SetControllerFactory(new eZeroOne.eResorts.NinjectControllerFactory());
            RouteConfig.RegisterRoutes(RouteTable.Routes);
           // BundleConfig.RegisterBundles(BundleTable.Bundles);


            WindsorWrapper();
        }


        protected void Application_EndRequest(object sender, EventArgs e)
        {
            //dispose of the datacontxt you created when the request began
            var dataContext = HttpContext.Current.Items[typeof(eHorakelleEntities)];
            if (dataContext != null && dataContext is IDisposable)
            {
                (dataContext as IDisposable).Dispose();
                HttpContext.Current.Items[typeof(eHorakelleEntities)] = null;
            }
        }
        private static void WindsorWrapper()
        {
            WindsorContainerWrapper.Container = new WindsorContainer();
            WindsorContainerWrapper.Container.Register(Component.For<eHorakelleEntities>().LifeStyle.PerWebRequest);

            WindsorContainerWrapper.Container.Install(new LoggerInstaller(),
                                                    new RepositoriesInstaller(),
                                                    new ControllersInstaller());

            var controllerFactory = new WindsorControllerFactory(WindsorContainerWrapper.Container.Kernel);
            ControllerBuilder.Current.SetControllerFactory(controllerFactory);

        }
        protected void Application_Error(object sender, EventArgs e)
        {
            // Code that runs when an un-handled error occurs
            Exception ex = Server.GetLastError();

            System.Threading.ThreadAbortException exception =
                   ex as System.Threading.ThreadAbortException;
            string requestUrl = HttpContext.Current.Request.RawUrl;
            if (!requestUrl.ToLower().Contains("favicon.ico"))
            {
                if (exception == null && ex != null)
                {
                    //Log or report only if this is not ThreadAbortException
                    try
                    {
                       
                        SendMail(ex);
                    }
                    catch { }
                }
            }
        }

        private void SendMail(Exception ex)
        {
            StringBuilder sbError = new StringBuilder();

            sbError.AppendLine(string.Format("An error occurred in '{0}' at {1}", Request.Url.AbsoluteUri, DateTime.UtcNow.ToString()));
            sbError.AppendLine();
            sbError.AppendLine(string.Format("Exception Message : {0} {1}", ex.Source, ex.Message));
            sbError.AppendLine();
            sbError.AppendLine(string.Format("Exception StackTrace : {0}", ex.StackTrace.ToString()));
            sbError.AppendLine();
            if (ex.InnerException != null)
            {
                sbError.AppendLine(string.Format("InnerException Message : {0}", ex.InnerException.Message));
                sbError.AppendLine();
                sbError.AppendLine(string.Format("InnerException StackTrace : {0}", ex.InnerException.StackTrace.ToString()));

                if (ex.InnerException.InnerException != null)
                {
                    sbError.AppendLine(string.Format("InnerException Message : {0}", ex.InnerException.InnerException.Message));
                    sbError.AppendLine();
                    sbError.AppendLine(string.Format("InnerException StackTrace : {0}", ex.InnerException.InnerException.StackTrace.ToString()));
                }
            }

            string emailBody = sbError.ToString().Replace(Environment.NewLine, "<br />");
            string emailSubject = HttpUtility.HtmlEncode(ex.Message);
            string toEmail = string.IsNullOrEmpty(ConfigurationManager.AppSettings["ErrorMail"]) ? "test.pawloyalty@gmail.com" : ConfigurationManager.AppSettings["ErrorMail"];
            string fromEmail = "info@pawloyalty.com";

            //EmailManager.SendEmail(fromEmail, toEmail, emailSubject, emailBody);
            //EmailService.SendActivationEmail(activationToken.EncryptedForm, model.Email, model.FirstName);

        }
        private void RedirectToErrorPage(object sender)
        {
            var error = Server.GetLastError();
            Response.TrySkipIisCustomErrors = true;
            var routeData = new RouteData();
            routeData.Values["Controller"] = "Errors";
            routeData.Values["Area"] = "";
            routeData.Values["Action"] = "Index";
            routeData.Values["Exception"] = error;

            if (error is HttpException)
            {
                switch (((HttpException)error).GetHttpCode())
                {
                    case 404:
                        routeData.Values["code"] = "404";
                        break;
                    default:
                        routeData.Values["code"] = "";
                        break;
                }
            }
            else
            {
                routeData.Values["code"] = "";
            }

            Response.Clear();
            Server.ClearError();

            IController controller = new ErrorsController();
            controller.Execute(new RequestContext(new HttpContextWrapper(((MvcApplication)sender).Context), routeData));

        }

    }
}