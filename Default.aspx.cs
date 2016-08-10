using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            User userName = (User)Session["presentUser"];
            if(userName != null)
            {
                string name = userName.Name;
                lblcurrentUser.Text = name + " logged in ";
                tdRegister.Visible = false;
                tdLogin.Visible = false;
                tdCurrentUser.Visible = true;
                lbYourAccount.Enabled = true;
                lbBooksSold.Enabled = true;
            }
        }
    }

    protected void lbLogOut_Clicked(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Default.aspx");
        tdRegister.Visible = true;
        tdLogin.Visible = true;
        tdCurrentUser.Visible = false;
    }

    protected void lbYourAccount_Clicked(object sender, EventArgs e)
    {
        Response.Redirect("MyAccount.aspx");
    }

    protected void lbBooksSold_Clicked(object sender, EventArgs e)
    {
        Response.Redirect("BooksSold.aspx");
    }

    protected void getQuote_Clicked(object sender, EventArgs e)
    {
        if (!Page.IsValid)
        {
            return;
        }
        else
        {
            string[] isbn = Application["ISBN Num"] as string[];
            int i;
            for (i = 0; i < 10; i++)
            {
                if (isbn[i] == isbnNumber.Text)
                {
                    Session["isbnNo"] = isbnNumber.Text;
                    Response.Redirect("BookDetails.aspx");
                    break;
                }
            }
            if (i == 10 && isbnNumber.Text != "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Sorry. The ISBN number you entered is not found in our database.');", true);
            }
        }
    }
}