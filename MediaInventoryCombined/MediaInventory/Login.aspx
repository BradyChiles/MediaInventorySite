<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MediaInventory.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Login Page</title>

    <link rel="stylesheet" type="text/css" href="content/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="content/StyleSheet.css" />

        <style type="text/css">  
            .auto-style1 {
                height: 33px;
            }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="center"><h1>Home Inventory Site Login</h1></div>
        <div class="container">
            <div class="center">
               <div class="vert">
                <table style="margin-left:auto; margin-right:auto;">
                    <tr>
                        <td class="auto-style1"><asp:Label ID="userNamelbl"  runat="server" Text="User Name"></asp:Label></td>
                        <td class="auto-style1"><asp:TextBox ID="userNameBox" CssClass="form-control" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="passwordlbl"  runat="server" Text="Password"></asp:Label></td>
                        <td><asp:TextBox ID="passwordBox" class="form-control" runat="server" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td colspan="2"><asp:Button ID="Button1" runat="server" CssClass="btn btn-primary btn-space" Text="Login" OnClick="loginButton_Click" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">Not yet a member? Click <a href="RegistrationPage.aspx">HERE</a> to register!</td>
                    </tr>
                    <tr>
                        <td colspan="2">Want to change your password? Click <a href="Profile.aspx">HERE</a></td>
                    </tr>
                    <tr>
                        <asp:label ID="lblError" runat="server"></asp:label>
                    </tr>
                </table>
                   </div>
            </div>
        </div>
    </form>
</body>
</html>