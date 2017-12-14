using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;


//using System.Web.UI.WebControls;

namespace MediaInventory
{
    public partial class Confirmation : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["inventoryconnectionstring"].ToString());
    
        protected void Page_Load(object sender, EventArgs e)
        {
            Item item = (Item)Session["item"];

            lblMedia.Text = item.MediaType;
            lblTitle.Text = item.Title;
            lblArtistAuthor.Text = item.ArtistAuthor;

            if (item.ISBN != "")
            {
                lblISBN.Text = item.ISBN;
            }else
            {
                lblISBN.Text = "";
            }


            if (item.Image != null)
            {
                string image = "~/images/" + item.Image.ToString();
                imgImage.ImageUrl = image;
            }

        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            try
            {
                Item item = (Item)Session["item"];
                int itemID = 5;
                string userID = (string)Session["userID"];
                string mediaType = item.MediaType;
                string title = item.Title;
                string artistAuthor = item.ArtistAuthor;
                long isbn;

                if (item.ISBN != "")
                {
                    isbn = long.Parse(item.ISBN);
                }
                else
                {
                    isbn = 0;
                }


                if (item.Image != null)
                {
                    string image = "~/images/" + item.Image.ToString();
                }

                //Creating connection object
                MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["inventoryConnectionString"].ConnectionString);
                //Opening connection string
                conn.Open();
                //Creating SQL command and storing it in a variable
                String Insertdata = "INSERT into media (itemID, userID, media_type, title, artist, ISBN_UPC) values(@itemID, @userID, @media_type, @title, @artist, @ISBN_UPC)";
                //Creating command object
                MySqlCommand com = new MySqlCommand(Insertdata, conn);
               
                //Adding data from fields to the database
                com.Parameters.AddWithValue("@itemID", itemID);
                com.Parameters.AddWithValue("@userID", userID);
                com.Parameters.AddWithValue("@password", mediaType);
                com.Parameters.AddWithValue("@email", artistAuthor);
                com.Parameters.AddWithValue("@title", title);
                com.Parameters.AddWithValue("@ISBN_UPC", isbn);
                com.ExecuteNonQuery();
               
                Response.Redirect("Main.aspx");
                //Close connection
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btnModify_Click(object sender, EventArgs e)
        {
            Item item = new Item();

            item.MediaType = lblMedia.Text;
            item.Title = lblTitle.Text;
            item.ArtistAuthor = lblArtistAuthor.Text;
            item.ISBN = lblISBN.Text;

            /*if(fulImage.PostedFile.FileName != null)
            {
                string fileName = System.IO.Path.GetFileName(fulImage.PostedFile.FileName);
                fulImage.PostedFile.SaveAs(Server.MapPath("~/images/" + fileName));
                item.Image = fileName;
            }*/

            Session["item"] = item;

            Response.Redirect("addInventory.aspx");
        }
    }
}