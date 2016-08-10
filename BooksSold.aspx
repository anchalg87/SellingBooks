<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BooksSold.aspx.cs" Inherits="BooksSold" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Image ID="imgBanner" runat="server" Width="100%" Height="300px" ImageUrl="images/booksBanner.jpg" />
    <table cellpadding="2" width="100%">
    <tr>
    <td align="left" width="120px"><asp:Label ID="lblUserName" runat="server" Text="User Name: " style="font-size:22px;color:blue" width="100%"></asp:Label></td>
    <td width="150px"><asp:Label ID="lblUserName2" runat="server" style="font-size:22px;color:deepskyblue" width="100%"></asp:Label></td>
    <td></td>
    <td align="right" width="200px"><asp:Label ID="lblEmailID" runat="server" Text="User Email Address: " style="font-size:22px;color:blue" width="100%"></asp:Label></td>
    <td align="right" width="200px"><asp:Label ID="lblEmailID2" runat="server" style="font-size:22px;color:deepskyblue" width="100%"></asp:Label></td>
    </tr>
    </table>
    <asp:Table id="soldBooks" runat="server" style="margin-left:-7px;color:black; table-layout:fixed;background-color:goldenrod;width:100%;height:100%;"></asp:Table>
    <center>
    <table>
        <tr>  
            <td>
                <asp:Button ID="btnMainPage" runat="server" Text="Goto Main Page" OnClick="btnMainPage_Clicked" />
            </td>
            <td></td>
            <td>
                <asp:Button ID="btnSellBook" runat="server" Text="Sell Another Book" OnClick="btnSellBook_Clicked" />
            </td>
        </tr>
    </table>
    </center>
    </div>
    </form>
</body>
</html>
