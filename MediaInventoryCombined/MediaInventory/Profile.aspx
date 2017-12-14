<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="MediaInventory.Profile" UnobtrusiveValidationMode="none"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Profile Page</title>

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
        <asp:Label ID="updateStatusPanel" runat="server" CssClass="disNone">
            <asp:Label ID="updateStatusHead" runat="server" Text="" CssClass="disNone"></asp:Label>
        </asp:Label>
    <div class="center"><h1>Profile Page</h1></div>
        <div class="container">
               <div class="vert"></div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="currentName">Current Username: </label>
                <div class="col-sm-8">
                    <asp:TextBox ID="currentName" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="newName">New Username: </label>
                <div class="col-sm-8">
                    <asp:TextBox ID="newName" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="confirmName">Re-enter new Username: </label>
                <div class="col-sm-8">
                    <asp:TextBox ID="confirmName" runat="server" class="form-control"></asp:TextBox>
                    <asp:CompareValidator ID="confirmNameComp" runat="server" ErrorMessage="Usernames must be equal." ControlToCompare="newName" 
                                            ControlToValidate="confirmName" Display="Dynamic" CssClass="text-danger"></asp:CompareValidator>
                    <asp:Label ID="userNameTaken" runat="server" Text="" CssClass="text-danger"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="newPassword">New Password: </label>
                <div class="col-sm-8">
                    <asp:TextBox ID="newPassword" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3" for="confirmPassword">Re-enter New Password: </label>
                <div class="col-sm-8">
                    <asp:TextBox ID="confirmPassword" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="confirmPassComp" runat="server" ErrorMessage="Passwords must be equal." ControlToCompare="newPassword" 
                                            ControlToValidate="confirmPassword" Display="Dynamic" CssClass="text-danger"></asp:CompareValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-2">
                    <asp:Button ID="updProfile" runat="server" OnClick="updProfile_Click" 
                                Text="Update" CssClass="btn btn-primary" CausesValidation="true" />
                    <asp:Button ID="login" runat="server" PostBackUrl="~\login.aspx" 
                                Text="Login" CssClass="btn btn-primary" CausesValidation="false" />
                </div>
            </div>
    </form>
</body>
</html>
