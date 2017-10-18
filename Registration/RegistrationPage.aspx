<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="Registration.RegistrationPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
    <link href="RegMain.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <h1>Registration Page</h1>
    <div class="userLines">
        <asp:Label ID="lblUserName" runat="server" Text="Username: "></asp:Label>
        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
    </div>
    <div class="userLines">
        <asp:Label ID="lblPassword" runat="server" Text="Password: "></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
    </div>
    <div class="userLines">
        <asp:Label ID="lblEmail" runat="server" Text="Email Address: "></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    </div>
    <div class="userLines">
        <asp:Label ID="lblEmailConfirm" runat="server" Text="Confirm Email: "></asp:Label>
        <asp:TextBox ID="txtEmailConfirm" runat="server"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Email Address do not equal" ControlToCompare="txtEmail" ControlToValidate="txtEmailConfirm" Display="Dynamic"></asp:CompareValidator>
    </div>
    <div>
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
    </div>
    <div>
        <asp:Label ID="lblConfirmationMessage" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>
