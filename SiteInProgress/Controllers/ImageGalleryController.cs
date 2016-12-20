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
           using(Entities dc = new Entities())
            {
                GalleryUploadView GV = new GalleryUploadView();
                GV.Categories = dc.Categories.ToList();
                GV.ImageGallery = new ImageGallery();

                return View(GV);


            }
            
        }

        [HttpPost]
        public ActionResult GalleryUpload(GalleryUploadView GV)
        {


            if (GV.ImageGallery.File == null)
            {
                ModelState.AddModelError("CustomError", "Please select picture");
            }
            if (GV.ImageGallery.File.ContentLength > (15 * 1024 * 1024))
            {
                ModelState.AddModelError("CustomError", "Picture size must be less than 15 MB");
                return View();
            }
            if (!(GV.ImageGallery.File.ContentType == "image/jpeg" || GV.ImageGallery.File.ContentType == "image/gif"|| GV.ImageGallery.File.ContentType == "image/img"|| GV.ImageGallery.File.ContentType == "image/raw"|| GV.ImageGallery.File.ContentType == "image/tif"))
            {
                ModelState.AddModelError("CustomError", "Picture type allowed : jpeg/gif/raw/tif");
                return View();
            }

            GV.ImageGallery.FileName = GV.ImageGallery.File.FileName;
            GV.ImageGallery.FileSize = GV.ImageGallery.File.ContentLength;
            if (User.Identity.GetUserId() != null)

            {
                GV.ImageGallery.UserID = User.Identity.GetUserId();
                

            }
            else
            {
               return Redirect("~/Account/Login");
            }
            GV.ImageGallery.DateOfPosting = DateTime.Now;

            byte[] data = new byte[GV.ImageGallery.File.ContentLength];
            GV.ImageGallery.File.InputStream.Read(data, 0, GV.ImageGallery.File.ContentLength);

            GV.ImageGallery.FileData = data;
            using (Entities dc = new Entities())
            {
                GV.Categories = dc.Categories.ToList();
                dc.ImageGalleries.Add(GV.ImageGallery);
                dc.SaveChanges();
                
            }
            ModelState.AddModelError("CustomError", "Uploading was fully successful!");
            return View(GV);
        }
        
        public ActionResult GalleryEdit(int id)
        {
            if (id <0)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            using(Entities dc = new Entities())
            {
                
                ImageGallery image = dc.ImageGalleries.Find(id);

                GalleryUploadView GV = new GalleryUploadView();
                GV.ImageGallery = image;
                GV.Categories = dc.Categories.ToList();
                return View(GV);
            }
            
        }

        [HttpPost]
        public ActionResult GalleryEdit(GalleryUploadView GV)
        {
            if (ModelState.IsValid)
            {
                if(GV.ImageGallery.UserID == User.Identity.GetUserId()|| User.IsInRole("admin"))
                using (Entities dc = new Entities())
                {
                    dc.Entry(GV.ImageGallery).State = EntityState.Modified;
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
