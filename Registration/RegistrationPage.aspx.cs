using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Registration
{
    public partial class RegistrationPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (IsValid)
            { 
                //grab user input from the txt boxes to store later
                string userName = txtUserName.Text;
                string passWord = txtPassword.Text;
                string emailAddress = txtEmail.Text;
                lblConfirmationMessage.Text = "You have been succesfully added as a new user.";
            }
        }
    }
}