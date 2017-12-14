using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.ComponentModel;
using System.Configuration;


namespace MediaInventory
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public string ProcessDataItem(object myValue)
        {
            if (myValue == DBNull.Value)
            {
                return " ";
            }

            return myValue.ToString();
        }

        private string DatabaseErrorMessage(Exception ex)
        {
            string msg = $"<b>A database error has occurred:</b> {ex.Message}";
            if (ex.InnerException != null)
                msg += $"<br />Message: {ex.InnerException.Message}";
            return msg;
        }
    }
}