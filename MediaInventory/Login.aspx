<%@ Page Language="C#" MasterPageFile="~/HomeInventory.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HomeInventorySite.Login" %>

    <asp:Content ID="contentLogin" ContentPlaceHolderID="mainPlaceHolder" runat="server">
        
        <form id="form1" runat="server">
            <div class="center"><h1>Home Inventory Site Login</h1></div>
            <div class="container">
                <div class="center">
                   <div class="vert">
                    <table style="margin-left:auto; margin-right:auto;">
                        <tr>
                            <td class="auto-style1"><asp:Label ID="userNamelbl"  runat="server" Text="User Name"></asp:Label></td>
                            <td class="auto-style1"><asp:TextBox ID="userNameBox" class="form-control" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="passwordlbl"  runat="server" Text="Password"></asp:Label></td>
                            <td><asp:TextBox ID="passwordBox" class="form-control" runat="server" ></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="2"><asp:Button ID="Button1" runat="server" class="btn btn-primary btn-space" Text="Login" OnClick="loginButton_Click" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">Not yet a member? Click <a href="Register.aspx">HERE</a> to register!</td>
                        </tr>
                        <tr>
                            <td colspan="2">Want to change your password? Click <a href="ProfilePage.aspx">HERE</a></td>
                        </tr>
                    </table>
                       </div>
                </div>
            </div>
        </form>
    </asp:Content>