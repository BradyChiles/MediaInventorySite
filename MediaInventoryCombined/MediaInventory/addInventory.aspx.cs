using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace MediaInventory
{
    public partial class addInventory : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["inventoryconnectionstring"].ToString());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["item"] != null)
            {
                Item item = (Item)Session["item"];

                rdolstMedia.SelectedValue = item.MediaType;
                txtTitle.Text = item.Title;
                txtArtistAuthor.Text = item.ArtistAuthor;
                txtIsbn.Text = item.ISBN;

            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Item item = new Item();

            item.MediaType = rdolstMedia.SelectedValue;
            item.Title = txtTitle.Text;
            item.ArtistAuthor = txtArtistAuthor.Text;
            item.ISBN = txtIsbn.Text;

            /*if(fulImage.PostedFile.FileName != null)
            {
                string fileName = System.IO.Path.GetFileName(fulImage.PostedFile.FileName);
                fulImage.PostedFile.SaveAs(Server.MapPath("~/images/" + fileName));
                item.Image = fileName;
            }*/

            Session["item"] = item;

            Response.Redirect("Confirmation.aspx");
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            rdolstMedia.SelectedIndex = 0;
            txtTitle.Text = "";
            txtArtistAuthor.Text = "";
            txtIsbn.Text = "";
            fulImage.Attributes.Clear(); 
        }

        
    }
}