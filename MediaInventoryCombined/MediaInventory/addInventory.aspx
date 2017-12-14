<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addInventory.aspx.cs" Inherits="MediaInventory.addInventory" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Add Inventory</title>

    <meta name="viewport" content="width=device-width, inital-scale=1" />

    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
   
</head>
<body>
    <div class ="container">

        <form id="form1" runat="server">

            <div class = "form-group">
                <label for ="rdolstMedia">Please select media type:</label>
                <asp:RadioButtonList ID="rdolstMedia" runat="server">
                    <asp:ListItem Selected ="True">Book</asp:ListItem>
                    <asp:ListItem>CD</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        
            <div class = "form-group">
                <label for="txtTitle" id="lblTitle">Title</label>
                <asp:RequiredFieldValidator ID="reqTitle" runat="server" ErrorMessage="Required" CssClass="text-danger" ControlToValidate="txtTitle"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtTitle" runat="server" CssClass ="form-control"></asp:TextBox>
            </div>
        
            <div class = "form-group">
                <label for="txtArtistAuthor" id="lblArtistAuthor">Artist/Author</label>
                <asp:RequiredFieldValidator ID="reqArtist" runat="server" ErrorMessage="Required" CssClass="text-danger" ControlToValidate="txtArtistAuthor"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtArtistAuthor" runat="server" CssClass ="form-control"></asp:TextBox>
            </div>

            <div class = "form-group">
                <label for="txtIsbn" id ="lblIsbn">ISBN</label>
                <asp:TextBox ID="txtIsbn" runat="server" CssClass ="form-control"></asp:TextBox>
            </div>

            <div class = "form-group">
                <label for="txtImage" id ="lblImage">Image</label>
                <asp:FileUpload ID="fulImage" runat="server"/>
            </div>

            <div class = "form-group">
                <asp:Button ID="btnAdd" runat="server" Text="Add" Cssclass ="btn btn-primary" OnClick="btnAdd_Click"/>
                <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass ="btn" OnClick="btnClear_Click" CausesValidation="False"/>
            </div>
        </form>

    </div>

    

</body>
</html>
