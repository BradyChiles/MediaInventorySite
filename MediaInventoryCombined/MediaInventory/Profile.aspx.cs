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
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (Session["userName"] == null) //kick user out if session doesn't exist
            {
                Response.Redirect("Login.aspx");
            }
            currentName.Text = Session["userID"].ToString();
            currentName.ReadOnly = true;*/
        }

        protected bool isUserNameTaken()
        {
            bool check = false;
            //Creating connection object
            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["UserDataConnectionString"].ConnectionString);
            //Opening connection string
            conn.Open();
            //Creating SQL command and storing it in a variable
            String userExists = "select count(*) from userData where userName=@userName";
            //Creating command object
            MySqlCommand com = new MySqlCommand(userExists, conn);
            com.Parameters.AddWithValue("@userID", newName.Text);
            //Converting result to an int to see if user already exists
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            if (temp == 1)
            {
                check = true;
            }
            //Close Connection
            conn.Close();
            return check;
        }

        protected void updProfile_Click(object sender, EventArgs e)
        {
            //Creating connection object
            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["inventoryConnectionString"].ConnectionString);
            bool flag = true; //true tell falsy
            //Opening connection string
            conn.Open();

            //updating username if passes checks
            if (!newName.Text.Equals("") && !newName.Text.Equals(Session["userID"]))
            {
                if (!isUserNameTaken())
                {
                    //Creating SQL command and storing it in a variable
                    String updateData = "UPDATE users SET userID = @userID WHERE userID = @userIDSess";
                    //Creating command object
                    MySqlCommand com = new MySqlCommand(updateData, conn);
                    //Adding data from fields to the database
                    com.Parameters.AddWithValue("userID", newName.Text);
                    com.Parameters.AddWithValue("usernIDSess", Session["userID"]);
                    com.ExecuteNonQuery();
                    Session["userID"] = newName.Text;
                    currentName.Text = newName.Text;
                }
                else
                {
                    userNameTaken.Text = "Username is already taken. Please try another.";
                    flag = false;
                }
            }

            //updating password if passes checks
            if (!newPassword.Text.Equals(""))
            {
                //Creating SQL command and storing it in a variable
                String updateData = "UPDATE users SET password = @password WHERE userID = @usernameSess";
                //Creating command object
                MySqlCommand com = new MySqlCommand(updateData, conn);
                //Adding data from fields to the database
                com.Parameters.AddWithValue("password", newPassword.Text);
                com.Parameters.AddWithValue("userIDSess", Session["userID"]);
                com.ExecuteNonQuery();
            }
            conn.Close();

            //is everything good?
            if (!(newName.Text.Equals("") && newPassword.Text.Equals("")) && flag)
            {
                updateStatusPanel.CssClass = "disBlock panel panel-success";
                updateStatusHead.CssClass = "disBlock panel-heading";
                updateStatusHead.Text = "Your username and/or password has been updated successfully!";
                newName.Text = "";
                confirmName.Text = "";
                newPassword.Text = "";
                confirmPassword.Text = "";
            }
            else if (!flag) //display error message
            {
                updateStatusPanel.CssClass = "disBlock panel panel-danger";
                updateStatusHead.CssClass = "disBlock panel-heading";
                updateStatusHead.Text = "An error occured. Please check below for errors.";
            }
        }

        protected void logOutBtn_Click(object sender, EventArgs e) //log user out
        {
            Session.Remove("userID");
            Response.Redirect("Login.aspx");
        }
    }
}