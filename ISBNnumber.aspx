<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ISBNnumber.aspx.cs" Inherits="ISBNnumber" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>What is ISBN Number?</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <img src="images/booksBanner.jpg" width="100%" height="300px" />
    <h1><center>How do I find my book's ISBN?</center>&nbsp;</h1>
    <p>Your books ISBN number can usually be found on the back of the book above the barcode.</p>
    <center><img src="images/isbnNumber.jpg" width="300px" height="200px"/></center>
    <p>An ISBN can be a 10 or 13 digit number and SellBooks pricing tool accepts both. If your book does not have a barcode or a sticker is covering the barcode you can usually find the ISBN inside of the 
       front title page where you would find publisher information. Books published before 1970 do not have ISBN numbers and we cannot buy them.
    </p>
    <center><input type="button" value="Back to Main Page"  onclick="location.href='Default.aspx'" /></center>
    </div>
    </form>
</body>
</html>
