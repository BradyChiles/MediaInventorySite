using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.ComponentModel;
using System.Configuration;

namespace Registration
{
    public partial class RegistrationPage : System.Web.UI.Page
    { 
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected bool userNameAvail()
        {
            bool check = false;
            MySqlConnection con = new MySqlConnection(ConfigurationManager.ConnectionStrings["inventoryConnectionString"].ConnectionString);
            con.Open();
            String userExists = "SELECT count(*) FROM users WHERE userID=@userID";
            MySqlCommand com = new MySqlCommand(userExists, con);
            com.Parameters.AddWithValue("@userID", txtUserID.Text);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            if (temp == 1)
            {
                check = true;
            }

            con.Close();
            return check;
        }
        protected void ObjectDataSource1_GetAffectedRows(object sender, ObjectDataSourceStatusEventArgs e)
        {
            e.AffectedRows = Convert.ToInt32(e.ReturnValue);
        }

        private string DataBaseErrorMessage(Exception ex)
        {
            string msg = $"<b>A database error has occurred:</b> {ex.Message}";
            if (ex.InnerException != null)
                msg += $"<br />Message: {ex.InnerException.Message}";
            return msg;
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DataBaseErrorMessage(e.Exception);
                e.ExceptionHandled = true;
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (userNameAvail())
            {
                updateStatusPanel.CssClass = "disBlock panel panel-danger";
                updateStatusHead.CssClass = "disBlock panel-heading";
                updateStatusHead.Text = "UserID is already taken. Please try again.";
            }
            else
            {
                try
                {
                    //Creating connection object
                    MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["inventoryConnectionString"].ConnectionString);
                    //Opening connection string
                    conn.Open();
                    //Creating SQL command and storing it in a variable
                    String Insertdata = "INSERT into users (userID,password,email) values(@userID,@password,@email)";
                    //Creating command object
                    MySqlCommand com = new MySqlCommand(Insertdata, conn);
                    //Adding data from fields to the database
                    com.Parameters.AddWithValue("@userID", txtUserID.Text);
                    com.Parameters.AddWithValue("@password", txtPassword.Text);
                    com.Parameters.AddWithValue("@email", txtEmail.Text);
                    com.ExecuteNonQuery();
                    Session.Add("addedUser", true);
                    Response.Redirect("Login.aspx");
                    //Close connection
                    conn.Close();

                }
                catch (Exception exc) //If there is an error respond "Invalid Data"
                {
                    updateStatusPanel.CssClass = "disBlock panel panel-danger";
                    updateStatusHead.CssClass = "disBlock panel-heading";
                    updateStatusHead.Text = "An error occured. " + exc.Message;
                }
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/login.aspx");
        }
    }
}