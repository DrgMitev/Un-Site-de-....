using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SiteInProgress.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            List<ImageGallery> all = new List<ImageGallery>();
            using (Entities dc = new Entities())
            {
                all = dc.ImageGalleries.ToList();
            }
            return View(all);

        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult Authorize()
        {
            return View();
        }
    }
}