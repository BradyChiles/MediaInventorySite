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
    public partial class Login : System.Web.UI.Page
    {
        MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["inventoryconnectionstring"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            try {
                string userID = userNameBox.Text;
                string password = passwordBox.Text;
                con.Open();
                string sql = "SELECT * FROM Users "
                    + "WHERE userID = '" + userID
                    + "' and password ='" + password + "'";
                MySqlCommand cmd = new MySqlCommand(sql, con);
                MySqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    Session["userID"] = userID;
                    Response.Redirect("~/main.aspx");
                }
                else
                {
                    lblError.Text = "Username and/or Password is not correct.  Please try again.";
                }
                con.Close();
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}