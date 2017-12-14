<!-- Group Project - Cari Benesh, Madison Brown, Sean Urban, Austin Kingrey, Brady Chiles 
    Adv C#
    Unit 4 CheckPoint Assignment -->


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="MediaInventory.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Main</title>
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
           <div class="center"><h1>Main Inventory View</h1></div>
    <br />
         <div class="container">
            <div class="center">
               <div class="vert">
                   <asp:DataList ID="dlInventory" runat="server"
                       DataKeyField="itemID" DataSourceID="ObjectDataSource1"
                       UseAccessibleHeader="True"
                       CssClass="table table-bordered table-striped table-condensed">
                       <HeaderTemplate>
                           <span class="col-xs-2">ID</span>
                           <span class="col-xs-1">Type</span>
                           <span class="col-xs-2">Title</span>
                           <span class="col-xs-2">Artist/Author</span>
                           <span class="col-xs-2">ISBN/UPC</span>
                           <span class="col-xs-2">Image</span>
                       </HeaderTemplate>
                       <ItemTemplate>
                           <asp:Label ID="lblID" runat="server"
                               Text='<%# Eval("itemID") %>' CssClass="col-xs-2">
                           </asp:Label>
                           <asp:Label ID="lblType" runat="server"
                               Text='<%# Eval("MediaType") %>' CssClass="col-xs-1">
                           </asp:Label>
                           <asp:Label ID="lblTitle" runat="server"
                              Text='<%# Eval("title") %>' CssClass="col-xs-2">
                           </asp:Label>
                           <asp:Label ID="lblArtistAuthor" runat="server"
                               Text='<%# Eval("ArtistAuthor") %>' CssClass="col-xs-2">
                           </asp:Label>
                           <asp:Label ID="lblIsbn_Upc" runat="server"
                               Text='<%# Eval("ISBN") %>' CssClass="col-xs-2">
                           </asp:Label>
                           <asp:Image ID="imgItem" runat="server" Width="50" Height="50" ImageUrl='<%#Bind("Image", "~/images/{0}") %>' CssClass="col-xs-2"/>
                       </ItemTemplate>
                   </asp:DataList>
                  <asp:ObjectDataSource runat="server" ID="ObjectDataSource1"
                      SelectMethod="GetItems" TypeName="MediaInventory.ItemDB" OldValuesParameterFormatString="original_{0}"></asp:ObjectDataSource>
                   <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Edit Inventory" PostBackUrl ="~/addInventory.aspx" />

                    <asp:Button ID="Button2" CssClass="btn btn-primary" runat="server" Text="Log Out" PostBackUrl ="~/login.aspx"/>
               </div>
            </div>
        </div>
    </form>
</body>
</html>
