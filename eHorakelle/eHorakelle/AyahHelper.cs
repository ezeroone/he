﻿using System.Web.Mvc;
using AreYouAHuman;

namespace eZeroOne.eHorakelle
{
    public static class AyahHelper
    {
        public static MvcHtmlString AreYouaHuman(this HtmlHelper helper, string key)
        {
            var ayah = new AyahServiceIntegration();
            return MvcHtmlString.Create(ayah.GetPublisherHtml(key));
        } 
    }
}