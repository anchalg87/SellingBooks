<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Selling Books</title>    <!-- Display the title of the webpage -->
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <img src="images/booksBanner.jpg" width="100%" height="300px" />       <!-- Display the banner of the website -->
    
    <!-- Creating a menu with all the links -->
        <asp:Table ID="tblLinks" Width="100%" Height="100%" runat="server">
            <asp:TableRow>
                <asp:TableCell BackColor="Goldenrod" Height="40px"><a href="Faq.aspx"><center>FAQ</center></a></asp:TableCell>
                <asp:TableCell BackColor="Goldenrod" Height="40px"><a href="ContactUs.aspx"><center>Contact Us</center></a></asp:TableCell>
                <asp:TableCell BackColor="Goldenrod" Height="40px"><center><asp:LinkButton ID="lbYourAccount" enabled="false" OnClick="lbYourAccount_Clicked" runat="server">Your Account</asp:LinkButton></center></asp:TableCell>
                <asp:TableCell BackColor="Goldenrod" Height="40px"><center><asp:LinkButton ID="lbBooksSold" enabled="false" OnClick="lbBooksSold_Clicked" runat="server">What You Sold</asp:LinkButton></center></asp:TableCell>
                <asp:TableCell id="tdRegister" BackColor="Goldenrod" Height="40px"><a href="RegistrationPage.aspx"><center>Register</center></a></asp:TableCell>
                <asp:TableCell id="tdLogin" BackColor="Goldenrod" Height="40px"><a href="RegistrationPage.aspx"><center>Login</center></a></asp:TableCell>
                <asp:TableCell id="tdCurrentUser" Visible="false" BackColor="Goldenrod" Height="40px" ColumnSpan="2"><center><asp:Label id="lblcurrentUser" runat="server" Text=""></asp:Label><asp:LinkButton ID="lbLogOut" runat="server" OnClick="lbLogOut_Clicked">Log Out</asp:LinkButton></center></asp:TableCell>
            </asp:TableRow>
        </asp:Table>

    <!-- The user can get a quote on the book(s) he/she wants to sell -->
    <table style="background-color:goldenrod" width="100%">
        <tr>
            <td style="font-size:24pt"><center>Want to do a quick check how much $$$$$ you could get?</center></td>
        </tr>
        <tr>
            <td style="font-size:20pt"><center><br />Enter ISBN Number:<font color="red">*</font>&nbsp;<asp:TextBox ID="isbnNumber" runat="server"></asp:TextBox>
                &nbsp;<asp:Button ID="getQuote" runat="server" Text="Get Quote" onClick="getQuote_Clicked" ValidationGroup="isbnGroup"/>
           <asp:RequiredFieldValidator ID="vldisbnNumber" runat="server" ForeColor="Red" Font-Size="Small" ValidationGroup="isbnGroup" ErrorMessage="The ISBN number is a Required Field." ControlToValidate="isbnNumber"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="vldisbnNumber1" runat="server" ForeColor="Red" Font-Size="Small" ValidationGroup="isbnGroup" ValidationExpression="^978[-][0-9]{10}$" ErrorMessage="The ISBN number must be in 999-9999999999 format." ControlToValidate="isbnNumber"></asp:RegularExpressionValidator>
           </center></td>
        </tr>
        <tr>
            <td style="font-size:12pt"><center><br />What is ISBN Number?<a href="ISBNnumber.aspx">Click Here</a></center></td>
        </tr>
    </table>

    <!-- These are ads -->
    <table width="100%" height="100%">
        <tr style="background-color:goldenrod">
            <td style="font-size:20pt;font-family:'Comic Sans MS'" colspan="6"><center>No need to worry about shipping costs.<br /><br /> We pay for shipping!!</center></td>
        </tr>
        <tr>
            <td style="height:50px"><img src="images/check.jpg" /></td>
            <td style="height:50px;font-size:16pt">Best price offered. We continually update our prices online.</td>
            <td style="height:50px"><img src="images/check.jpg" /></td>
            <td style="height:50px;font-size:16pt">Free shipping. Just print a label online for shipping.</td>
            <td style="height:50px"><img src="images/check.jpg" /></td>
            <td style="height:50px;font-size:16pt">Speedy Payment. Your payment is processed within 2 business days of your shipment.</td>
        </tr>
    </table>
    
    <!-- Shows all the financial institutions we use -->
    <img src="images/financialInstitution.jpg" width="100%" height="175px"/>
    <asp:AdRotator ID="AdRotator1" runat="server" AdvertisementFile="~/Ads1.xml" Target="_blank" KeywordFilter="Computer" />
    <asp:AdRotator ID="AdRotator2" runat="server" AdvertisementFile="~/Ads2.xml" Target="_blank" KeywordFilter="Computer" />
    <asp:AdRotator ID="AdRotator3" runat="server" AdvertisementFile="~/Ads3.xml" Target="_blank" KeywordFilter="Computer" />
    </div>
    </form>
</body>
</html>
