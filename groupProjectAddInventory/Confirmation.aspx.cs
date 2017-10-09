using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
//using System.Web.UI.WebControls;

namespace groupProjectAddInventory
{
    public partial class Confirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            inventoryItem item = (inventoryItem)Session["item"];

            lblMedia.Text = item.MediaType;
            lblTitle.Text = item.Title;
            lblArtistAuthor.Text = item.ArtistAuthor;

            if (item.ISBN != "")
            {
                lblISBN.Text = item.ISBN;
            }else
            {
                lblISBN.Text = "None";
            }


            if (item.Image != null)
            {
                string image = "~/images/" + item.Image.ToString();
                imgImage.ImageUrl = image;
            }

        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            lblConfirmation.Text = "Inventory Item = Confirmed!";
        }
    }
}