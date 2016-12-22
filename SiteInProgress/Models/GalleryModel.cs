using System;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using SiteInProgress.Models;
using System.Collections.Generic;

namespace SiteInProgress.Models
{
    public class GalleryUploadView
    {
        public ImageGallery ImageGallery { get; set; }
        public List<Category> Categories { get; set; }
   
    }
    public class GalleryUploadList
    {
        public List<ImageGallery> ImageGalleries { get; set; }
        public List<Category> Categories { get; set; }
    }
    public class GalleryViewList
    {
        public List<ImageGallery> ImageGalleries { get; set; }
        public Category Category { get; set; }
    }

}