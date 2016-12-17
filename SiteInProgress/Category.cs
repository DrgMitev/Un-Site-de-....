using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Blog.Models
{
    public class Category
    {
        //private ICollection<Photo> photos;

        //public Category()
        //{
        //      this.photos = ...;
        //}

        [Key]
        public int Id { get; set; }

        [Required]
        [Index(IsUnique =true)]
        [StringLength(20)]
        public string Name { get; set; }

        //public virtual ICollection<Photo> photos { get; set; }
    }
}