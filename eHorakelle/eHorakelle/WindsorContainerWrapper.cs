﻿using Castle.Windsor;

namespace eZeroOne.eHorakelle
{
    public static class WindsorContainerWrapper
    {
        // Fields...
        private static IWindsorContainer _Container;

        public static IWindsorContainer Container
        {
            get { return _Container; }
            set { _Container = value; }
        }
    }
}