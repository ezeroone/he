using Castle.MicroKernel.Registration;
using Castle.MicroKernel.SubSystems.Configuration;
using Castle.Windsor;
using eZeroOne.Service.Property;
using eZeroOne.Service.Repository;


namespace eZeroOne.eHorakelle.Infrastructure
{
    public class RepositoriesInstaller : IWindsorInstaller
    {
        public void Install(IWindsorContainer container, IConfigurationStore store)
        {
         
            container.Register(Component.For(typeof(IRepository))
                                        .ImplementedBy((typeof(Repository)))
                                        .LifestylePerWebRequest());

            container.Register(Component.For(typeof(IProperties))
                                      .ImplementedBy((typeof(Properties)))
                                      .LifestylePerWebRequest());

            container.Register(Component.For<IUnitOfWork>()
                                        .ImplementedBy<UnitOfWork>()
                                        .LifestylePerWebRequest());


            
           
        }
    }
}