<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us</title>
     <script type="text/javascript">
         var xmlDoc;
         var xmlhttp;
         function loadXMLDoc() {
             xmlhttp = new XMLHttpRequest();
             xmlhttp.onreadystatechange = readData;
             xmlhttp.open("GET", "contactUs.xml", true);
             xmlhttp.send();
         }

         function readData() {
             if (xmlhttp.readyState == 4) {
                 xmlDoc = xmlhttp.responseXML;
                 var items = xmlDoc.getElementsByTagName("info");
                 var contactPhone = items[0].getAttribute("contact-phone");
                 var contactEmail = items[0].getAttribute("contact-email");
                 var addressStreet = items[0].getAttribute("address-street");
                 var addressCity = items[0].getAttribute("address-city");
                 var addressState = items[0].getAttribute("address-state");
                 var addressZip = items[0].getAttribute("address-zip");
                 var mailingAddress = addressCity + ", " + addressState + " " + addressZip;
                 document.getElementById("Label1").innerHTML = contactPhone;
                 document.getElementById("Label2").innerHTML = contactEmail;
                 document.getElementById("Label3").innerHTML = addressStreet;
                 document.getElementById("Label4").innerHTML = mailingAddress;
             }
         }
    </script>
</head>
<body onload="loadXMLDoc()">
    <form id="form1" runat="server">
    <div>
    <center><img src="images/booksBanner.jpg" width="900px" height="150px" /></center>
    <center>
    <table>
        <tr>
            <td>Contact Phone</td>
            <td><asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td>Contact E-mail</td>
            <td><asp:Label ID="Label2" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td>Mailing Address</td>
            <td><asp:Label ID="Label3" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Label ID="Label4" runat="server" Text=""></asp:Label></td>
        </tr>
    </table>
    </center>
    <center><input type="button" value="Back to Main Page"  onclick="location.href='Default.aspx'" /></center>
    </div>
    </form>
</body>
</html>
