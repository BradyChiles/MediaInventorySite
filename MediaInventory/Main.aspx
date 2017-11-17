<%@ Page Language="C#" MasterPageFile="~/HomeInventory.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="media_inventory.Main" %>

    <asp:Content ID="contentMain" ContentPlaceHolderID="mainPlaceHolder" runat="server">
        
        <form id="form1" runat="server">

             <!-- Temporary Table to illustrate future database view -->
            <table>
                <tr>
                    <td>ID</td>
                    <td>Title</td>
                    <td>Artist/Author</td>
                    <td>ISBN</td>
                    <td>Image</td>
                </tr>
                <tr>
                    <td class="border"><asp:TextBox ID="txtID" runat="server" Width="100px"></asp:TextBox></td>
                    <td><asp:TextBox ID="txtTitle" runat="server" Width="200px"></asp:TextBox></td>
                    <td><asp:TextBox ID="txtArtist" runat="server" Width="100px"></asp:TextBox></td>
                    <td><asp:TextBox ID="txtISBN" runat="server" Width="100px"></asp:TextBox></td>
                    <td><asp:TextBox ID="txtImg" runat="server" Width="100px"></asp:TextBox></td>
                </tr>

                <tr>
                    <td><asp:TextBox ID="TextBox1" runat="server" Width="100px"></asp:TextBox></td>
                    <td><asp:TextBox ID="TextBox2" runat="server" Width="200px"></asp:TextBox></td>
                    <td><asp:TextBox ID="TextBox3" runat="server" Width="100px"></asp:TextBox></td>
                    <td><asp:TextBox ID="TextBox4" runat="server" Width="100px"></asp:TextBox></td>
                    <td><asp:TextBox ID="TextBox5" runat="server" Width="100px"></asp:TextBox></td>
                </tr>
            </table>
            <br />
            <br />

            <asp:Button ID="btnEdit" CssClass="btn btn-primary" runat="server" Text="Edit Inventory" PostBackUrl ="~/addInventory.aspx" />

            <asp:Button ID="btnLogout" CssClass="btn btn-primary" runat="server" Text="Log Out" />

        </form>
    </asp:Content>