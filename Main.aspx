<!-- Group Project - Cari Benesh, Madison Brown, Sean Urban, Austin Kingrey, Brady Chiles 
    Adv C#
    Unit 4 CheckPoint Assignment -->


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="media_inventory.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Main</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/main.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/jquery.validate.unobtrusive.min.js"></script>
    <script src="Scripts/boostrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblHeader" CssClass="header" runat="server" Text="Media Inventory"></asp:Label>
    </div>
    <br />

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

        <asp:Button ID="btnLogout" CssClass="btn btn-primary" runat="server" Text="Log Out" PostBackUrl ="~/login.aspx"/>

    </form>
</body>
</html>
