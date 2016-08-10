using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

public partial class ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnRecoverPassword_Clicked(object sender, EventArgs e)
    {
        List<User> allUsersList = Application["AllUserList"] as List<User>;
        User user = (User)Session["presentUser"];

        if (allUsersList.Exists(x => x.EmailAddress == txtEmailID.Text))
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Your password has been sent to the email address in file.');", true);

            String msgTo = txtEmailID.Text;
            String msgSubject = "We have recovered your password!";
            String msgBody = "Dear Valued Customer,@You are receiving this email because you requested to recover your password.@Your current password is: testpass1@Thank you@SellBooks.com Team";
            msgBody = msgBody.Replace("@", System.Environment.NewLine);

            MailMessage mailObj = new MailMessage();
            mailObj.Body = msgBody;
            mailObj.From = new MailAddress("testuserag11@gmail.com", "SellBooks Team");
            mailObj.To.Add(new MailAddress(msgTo));
            mailObj.Subject = msgSubject;
            mailObj.IsBodyHtml = true;

            SmtpClient SMTPClient = new System.Net.Mail.SmtpClient();
            SMTPClient.Host = "smtp.gmail.com";
            SMTPClient.Port = 587;
            SMTPClient.Credentials = new NetworkCredential("testuserag11@gmail.com", "testuser1");
            SMTPClient.EnableSsl = true;

            try
            {
                SMTPClient.Send(mailObj);
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Your account email cannot be verified.');", true);
            txtEmailID.Text = "";
        }
    }
}