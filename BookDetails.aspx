<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BookDetails.aspx.cs" Inherits="BookDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color:darkgoldenrod">
        <asp:Image ID="imgBanner" runat="server" Width="100%" Height="300px" ImageUrl="images/booksBanner.jpg" />
        <table align="center">
            <tr>
                <td><asp:Label ID="lblISBN" runat="server" Text="ISBN Number:"></asp:Label></td>
                <td></td>
                <td></td>
                <td><asp:TextBox ID="txtISBN" runat="server"></asp:TextBox></td>
                <td></td>
                <td></td>
                <td><asp:Button ID="btnCheckISBN" runat="server" Text="Check Another ISBN" onClick="checkISBN_Clicked" /></td>
            </tr>
        </table>
    </div>
    <div style="background-color:goldenrod">
        <table align="center">
            <tr>
                <td colspan="7"><asp:Image ID="imgBookCover" runat="server" Width="425px" Height="500px"/></td>
            </tr>
        </table>
    </div>
    <div style="background-color:darkgoldenrod">
        <table align="center">
            <tr>
                <td><asp:Label ID="lblTitle" runat="server" Text="Title:"></asp:Label></td>
                <td></td>
                <td colspan="5"><asp:TextBox ID="txtTitle" runat="server" Enabled="false" Width="310px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblAuthor" runat="server" Text="Author:"></asp:Label></td>
                <td></td>
                <td colspan="5"><asp:TextBox ID="txtAuthor" runat="server" Enabled="false" Width="310px"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblPrice" runat="server" Text="Buy Price:"></asp:Label></td>
                <td></td>
                <td colspan="5"><asp:TextBox ID="txtPrice" runat="server" Enabled="false" Width="310px"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2"></td>
                <td></td>
                <td><asp:Button ID="btnSellBook" runat="server" Text="Sell This Book" Width="150px" onClick="btnSellBook_Clicked" /></td>
                <td></td>
                <td></td>
                <td><asp:Button ID="btnNoBuy" runat="server" Text="No Thanks" Width="140px" onClick="btnNoBuy_Clicked" /></td>
            </tr>
        </table>
    </div>
    
        
    </form>
</body>
</html>
