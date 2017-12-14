<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="Registration.RegistrationPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
    <link href="Content/RegMain.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="updateStatusPanel" runat="server" CssClass="disNone">
            <asp:Label ID="updateStatusHead" runat="server" Text="" CssClass="disNone"></asp:Label>
        </asp:Label>
    <h1>Registration Page</h1>
     <div class="userLines">
        <asp:Label ID="lblUserID" runat="server" Text="User Name: "></asp:Label>
        <asp:TextBox ID="txtUserID" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvUserID" runat="server" ErrorMessage="Please enter a username"
            Controltovalidate="txtUserID" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
    <div class="userLines">
        <asp:Label ID="lblPassword" runat="server" Text="Password: "></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
    </div>
    <div class="userLines">
        <asp:Label ID="lblConfirmPass" runat="server" Text="Confirm Password: "></asp:Label>
        <asp:TextBox ID="txtPasswordConfirm" runat="server"></asp:TextBox>
        <asp:CompareValidator ID="cvPassword" runat="server" ErrorMessage="Passwords do not match" ControlToCompare="txtPassword" 
            ControlToValidate="txtPasswordConfirm" Display="Dynamic"></asp:CompareValidator>
    </div>
    <div class="userLines">
        <asp:Label ID="lblEmail" runat="server" Text="Email Address: "></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
    </div>
    <div class="userLines">
        <asp:Label ID="lblEmailConfirm" runat="server" Text="Confirm Email: "></asp:Label>
        <asp:TextBox ID="txtEmailConfirm" runat="server"></asp:TextBox>
        <asp:CompareValidator ID="cvEmail" runat="server" ErrorMessage="Email Addresses do not match" ControlToCompare="txtEmail" 
            ControlToValidate="txtEmailConfirm" Display="Dynamic"></asp:CompareValidator>
    </div>
    <div>    
        <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" InsertMethod="InsertUser" TypeName="UsersDB" 
            DataObjectTypeName="Users" DeleteMethod="DeleteUser" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetUsers" UpdateMethod="UpdateUsers">
            <UpdateParameters>
                <asp:Parameter Name="original_Users" Type="Object" />
                <asp:Parameter Name="users" Type="Object" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </div>
    <div>
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
        <asp:Button ID="btnLogin" runat="server" Text="Return to Login" OnClick="btnLogin_Click" />
    </div>
    <div>
        <asp:Label ID="lblConfirmationMessage" runat="server" Text=""></asp:Label>
    </div>
    <div>
        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>
