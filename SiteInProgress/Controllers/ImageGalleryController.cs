using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Data.Entity.Validation;
using System.Net;
using System.Data.Entity;

namespace SiteInProgress.Models
{
    public class ImageGalleryController : Controller
    {
        
        
        public ActionResult GalleryList()
        {
            List<ImageGallery> all = new List<ImageGallery>();
            using (Entities dc = new Entities())
            {
                all = dc.ImageGalleries.ToList();
            }
            return View(all);

        }
       
        public ActionResult GalleryUpload()
        {
            return View();
        }

        [HttpPost]
        public ActionResult GalleryUpload(ImageGallery IG)
        {


            if (IG.File == null)
            {
                ModelState.AddModelError("CustomError", "Please select picture");
            }
            if (IG.File.ContentLength > (15 * 1024 * 1024))
            {
                ModelState.AddModelError("CustomError", "Picture size must be less than 15 MB");
                return View();
            }
            if (!(IG.File.ContentType == "image/jpeg" || IG.File.ContentType == "image/gif"||IG.File.ContentType == "image/img"|| IG.File.ContentType == "image/raw"|| IG.File.ContentType == "image/tif"))
            {
                ModelState.AddModelError("CustomError", "Picture type allowed : jpeg/gif/raw/tif");
                return View();
            }

            IG.FileName = IG.File.FileName;
            IG.FileSize = IG.File.ContentLength;
            if (User.Identity.GetUserId() != null)

            {
                IG.UserID = User.Identity.GetUserId();

            }
            else
            {
               return Redirect("~/Account/Login");
            }
            IG.DateOfPosting = DateTime.Now;

            byte[] data = new byte[IG.File.ContentLength];
            IG.File.InputStream.Read(data, 0, IG.File.ContentLength);

            IG.FileData = data;
            using (Entities dc = new Entities())
            {
                dc.ImageGalleries.Add(IG);
                dc.SaveChanges();
            }
            ModelState.AddModelError("CustomError", "Uploading was fully successful!");
            return View(IG);
        }
        
        public ActionResult GalleryEdit(int id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            using(Entities dc = new Entities())
            {
                ImageGallery image = dc.ImageGalleries.Find(id);
                return View(image);
            }
            
        }

        [HttpPost]
        public ActionResult GalleryEdit(ImageGallery IG)
        {
            if (ModelState.IsValid)
            {
                if(IG.UserID == User.Identity.GetUserId()|| User.IsInRole("admin"))
                using (Entities dc = new Entities())
                {
                    dc.Entry(IG).State = EntityState.Modified;
                    dc.SaveChanges();
                    return RedirectToAction("GalleryList");
                }
                else
                {
                    return RedirectToAction("Authorize", "Home");
                }
            }
            
            return RedirectToAction("GalleryList");
        }
    }
}
