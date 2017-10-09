<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="groupProjectAddInventory.Confirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Confirm Inventory Item</title>

    <meta name="viewport" content="width=device-width, inital-scale=1" />

    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.1.1.slim.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>

</head>

<body>

    <div class="container">
    
        <h1></h1>

        <form id="form1" runat="server">

            <h3>Please Confirm Item Information</h3>

            <div class ="form-group">

                <label>Media: </label>
                <asp:Label ID="lblMedia" runat="server" Text=""></asp:Label>
                <br />

                <label>Title: </label>
                <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label>
                <br />

                <label>Artist/Author: </label>
                <asp:Label ID="lblArtistAuthor" runat="server" Text=""></asp:Label>
                <br />

                <label>ISBN: </label>
                <asp:Label ID="lblISBN" runat="server" Text=""></asp:Label>
                <br />

                <label>Image: </label>
                <br/>
                <asp:Image ID="imgImage" runat="server" Height="200px" Width="200px" />

            </div>

            <div class ="form-group">
                <asp:Button ID="btnConfirm" runat="server" Text="Confirm" CssClass ="btn btn-primary" OnClick="btnConfirm_Click" />
                <asp:Button ID="btnModify" runat="server" Text="Modify" CssClass ="btn" PostBackUrl ="~/addInventory.aspx" />
            </div>

            <div class ="form-group">
                <asp:Label ID="lblConfirmation" runat="server" Text=""></asp:Label>
            </div>
            
        </form>

    </div>

</body>
</html>
