<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Image ID="imgBanner" runat="server" Width="100%" Height="300px" ImageUrl="images/booksBanner.jpg" />
    <table>
    <tr>
    <td><span style="font-size:20px">Password Recovery</span></td>
    </tr>
    <tr>
    <td><asp:Label ID="lblEmailID" runat="server" Text="Email Address"></asp:Label></td>
    <td><asp:TextBox ID="txtEmailID" runat="server" Width="300px"></asp:TextBox></td>
    <td><asp:Button ID="btnRecoverPassword" runat="server" Text="Recover Password" OnClick="btnRecoverPassword_Clicked" /></td>
    </tr>
    <tr>
    <td><asp:HyperLink ID="hlMainPage" runat="server" NavigateUrl="~/Default.aspx">Go Back to Main Page</asp:HyperLink></td>
    </tr>
    </table>
    </div>
    </form>
</body>
</html>
