<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyAccount.aspx.cs" Inherits="MyAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Image ID="imgBanner" runat="server" Width="100%" Height="300px" ImageUrl="images/booksBanner.jpg" />
    <asp:Label ID="Label1" runat="server" Text="Your Account Information" style="font-size:22px;background-color:gold" width="100%"></asp:Label>
    <table cellpadding="2" Width="100%" Height="100%">
     <tr Height="100%">
      <td style="background-color:goldenrod">
        <table>
            <tr>
                <td colspan="3"><span style="font-size:20px">Personal Information</span></td>
            </tr>
            <tr>
                <td colspan="3"><span>If you wish, you can update the account information and then click 'Update' or 'Update and Goto Main Page' button below.</span></td>
            </tr>
            <tr>
                <td width="80px"><asp:Label ID="lblName" runat="server" Text="Your Name"></asp:Label></td>
                <td width="20px"></td>
                <td><asp:TextBox ID="txtName" runat="server" Width="400px" Disabled="true"></asp:TextBox></td>
            </tr>
            <tr>
                <td width="100px"><asp:Label ID="lblAddress1" runat="server" Text="Address Line 1"></asp:Label></td>
                <td width="20px"><span><font color="Red">*</font></span></span></td>
                <td><asp:TextBox ID="txtAddress1" runat="server" Width="500px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="vldAddress" runat="server" ForeColor="Red" Font-Size="Small" ErrorMessage="The address is a Required Field." ValidationGroup="registerValidation" ControlToValidate="txtAddress1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td width="100px"><asp:Label ID="lblAddress2" runat="server" Text="Address Line 2"></asp:Label></td>
                <td width="20px"></td>
                <td><asp:TextBox ID="txtAddress2" runat="server" Width="500px"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>&nbsp;&nbsp;<font color="Red">*</font></span></td>
                <td><asp:TextBox ID="txtCity" runat="server" Width="400px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="vldCity" runat="server" ForeColor="Red" Font-Size="Small" ErrorMessage="The city is a Required Field." ValidationGroup="registerValidation" ControlToValidate="txtCity"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lblZip" runat="server" Text="Zip"></asp:Label>&nbsp;&nbsp;<font color="Red">*</font></span></td>
                <td><asp:TextBox ID="txtZip" runat="server" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="vldZip" runat="server" ForeColor="Red" Font-Size="Small" ErrorMessage="The zipcode is a Required Field." ValidationGroup="registerValidation" ControlToValidate="txtZip"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="vldRegexZip" runat="server" ForeColor="Red" Font-Size="Small" ValidationGroup="registerValidation" ValidationExpression="^(\d{5}-\d{4}|\d{5}|\d{9})$|^([a-zA-Z]\d[a-zA-Z] \d[a-zA-Z]\d)$" ErrorMessage="The zip code is not in the correct format." ControlToValidate="txtZip"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lblState" runat="server" Text="State"></asp:Label></td>
                <td>
                <asp:DropDownList ID="ddlState" runat="server" Width="40px">
                    <asp:ListItem Value="AL" Text="AL"></asp:ListItem>
                    <asp:ListItem Value="AK" Text="AK"></asp:ListItem>
                    <asp:ListItem Value="AZ" Text="AZ"></asp:ListItem>
                    <asp:ListItem Value="AR" Text="AR"></asp:ListItem>
                    <asp:ListItem Value="CA" Text="CA"></asp:ListItem>
                    <asp:ListItem Value="CO" Text="CO"></asp:ListItem>
                    <asp:ListItem Value="CT" Text="CT"></asp:ListItem>
                    <asp:ListItem Value="DE" Text="DE"></asp:ListItem>
                    <asp:ListItem Value="FL" Text="FL"></asp:ListItem>
                    <asp:ListItem Value="GA" Text="GA"></asp:ListItem>
                    <asp:ListItem Value="HI" Text="HI"></asp:ListItem>
                    <asp:ListItem Value="ID" Text="ID"></asp:ListItem>
                    <asp:ListItem Value="IL" Text="IL"></asp:ListItem>
                    <asp:ListItem Value="IN" Text="IN"></asp:ListItem>
                    <asp:ListItem Value="IA" Text="IA"></asp:ListItem>
                    <asp:ListItem Value="KS" Text="KS"></asp:ListItem>
                    <asp:ListItem Value="KY" Text="KY"></asp:ListItem>
                    <asp:ListItem Value="LA" Text="LA"></asp:ListItem>
                    <asp:ListItem Value="ME" Text="ME"></asp:ListItem>
                    <asp:ListItem Value="MD" Text="MD"></asp:ListItem>
                    <asp:ListItem Value="MA" Text="MA"></asp:ListItem>
                    <asp:ListItem Value="MI" Text="MI"></asp:ListItem>
                    <asp:ListItem Value="MN" Text="MN"></asp:ListItem>
                    <asp:ListItem Value="MS" Text="MS"></asp:ListItem>
                    <asp:ListItem Value="MO" Text="MO"></asp:ListItem>
                    <asp:ListItem Value="MT" Text="MT"></asp:ListItem>
                    <asp:ListItem Value="NE" Text="NE"></asp:ListItem>
                    <asp:ListItem Value="NV" Text="NV"></asp:ListItem>
                    <asp:ListItem Value="NH" Text="NH"></asp:ListItem>
                    <asp:ListItem Value="NJ" Text="NJ"></asp:ListItem>
                    <asp:ListItem Value="NM" Text="NM"></asp:ListItem>
                    <asp:ListItem Value="NY" Text="NY"></asp:ListItem>
                    <asp:ListItem Value="NC" Text="NC"></asp:ListItem>
                    <asp:ListItem Value="ND" Text="ND"></asp:ListItem>
                    <asp:ListItem Value="OH" Text="OH"></asp:ListItem>
                    <asp:ListItem Value="OK" Text="OK"></asp:ListItem>
                    <asp:ListItem Value="OR" Text="OR"></asp:ListItem>
                    <asp:ListItem Value="PA" Text="PA"></asp:ListItem>
                    <asp:ListItem Value="RI" Text="RI"></asp:ListItem>
                    <asp:ListItem Value="SC" Text="SC"></asp:ListItem>
                    <asp:ListItem Value="SD" Text="SD"></asp:ListItem>
                    <asp:ListItem Value="TN" Text="TN"></asp:ListItem>
                    <asp:ListItem Value="TX" Text="TX"></asp:ListItem>
                    <asp:ListItem Value="UT" Text="UT"></asp:ListItem>
                    <asp:ListItem Value="VT" Text="VT"></asp:ListItem>
                    <asp:ListItem Value="VA" Text="VA"></asp:ListItem>
                    <asp:ListItem Value="WA" Text="WA"></asp:ListItem>
                    <asp:ListItem Value="WV" Text="WV"></asp:ListItem>
                    <asp:ListItem Value="WI" Text="WI"></asp:ListItem>
                    <asp:ListItem Value="WY" Text="WY"></asp:ListItem>
                </asp:DropDownList></td>
            </tr>
        </table>
        <hr />
        <table>
            <tr>
                <td colspan="3"><span style="font-size:20px">Login Information</span></td>
            </tr>
            <tr>
                <td width="100px" colspan="2"><asp:Label ID="lblEmailAddress" runat="server" Text="Email Address"></asp:Label>&nbsp;&nbsp;<font color="Red">*</font></span></td>
                <td><asp:TextBox ID="txtEmailAdd" runat="server" Width="400px" Disabled="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="vldEmailAdd" runat="server" ForeColor="Red" Font-Size="Small" ErrorMessage="The email address is a Required Field." ValidationGroup="registerValidation" ControlToValidate="txtEmailAdd"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="vldRegexEmailAdd" runat="server" ForeColor="Red" Font-Size="Small" ValidationGroup="registerValidation" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" ErrorMessage="The email address is not in the correct format." ControlToValidate="txtEmailAdd"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td width="100px" colspan="2"><asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>&nbsp;&nbsp;<font color="Red">*</font></td>
                <td><asp:TextBox ID="txtPassword" runat="server" Width="400px" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="vldPassword" runat="server" ForeColor="Red" Font-Size="Small" ErrorMessage="The password is a Required Field." ValidationGroup="registerValidation" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="vldRegexPassword" runat="server" ForeColor="Red" Font-Size="Small" ValidationGroup="registerValidation" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,10}$" ErrorMessage="The password must be between 8 and 10 characters, contain at least one digit and one alphabetic character, and must not contain special characters." ControlToValidate="txtPassword"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2"><asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password"></asp:Label></td>
                <td><asp:TextBox ID="txtConfirmPassword" runat="server" Width="400px"  TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="vldCmpPassword" runat="server" ForeColor="Red" Font-Size="Small" ErrorMessage="Your password does not match." ValidationGroup="registerValidation" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"></asp:CompareValidator>
                </td>
            </tr>
        </table>
        <hr />
        <table>
            <tr>
                <td colspan="4"><span style="font-size:20px">Pay me by</span></td>
            </tr>
            <tr>
                <td colspan="4"><asp:RadioButton ID="rdoCheck" runat="server" GroupName="Payment" Checked="true" />&nbsp;&nbsp;<span>Check</span>&nbsp;&nbsp;<asp:RadioButton ID="rdoPayPal" runat="server" GroupName="Payment" />&nbsp;&nbsp;<span>Paypal</span></td>
            </tr>
            <tr>
                <td><asp:Button ID="btnMainPage" runat="server" Text="Goto Main Page" OnClick="btnMainPage_Clicked" /></td>
                <td><asp:Button ID="btnUpdate" runat="server" ValidationGroup="registerValidation" Text="Update" OnClick="btnUpdate_Clicked" /></td>
                <td colspan="2"><asp:Button ID="btnUpdateMainPage" runat="server" ValidationGroup="registerValidation" Text="Update and Goto Main Page" OnClick="btnUpdateMainPage_Clicked" /></td>
            </tr>
        </table>
          </td>
          </tr>
          </table>
    </div>
    </form>
</body>
</html>
