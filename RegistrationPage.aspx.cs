using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class RegistrationPage : System.Web.UI.Page
{
    User aUser = new User();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnMainPage_Clicked(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }

    protected void btnForgetPassword_Clicked(object sender, EventArgs e)
    {
        Response.Redirect("ForgotPassword.aspx");
    }

    protected void btnRegister_Clicked(object sender, EventArgs e)
    {
        if (!Page.IsValid)
        {
            return;
        }
        else
        {
            SqlConnection connectionToServer = new SqlConnection("Data Source=dcm.uhcl.edu;Initial Catalog=c432015fa03guptaa;User ID=guptaa;Password=1362659");
            
            List<User> allUsersList = Application["AllUserList"] as List<User>;
            Boolean registeredUser = false;

            string getUsers = "Select * from GuptaA_WADfl15_Users";

            SqlCommand sqlCommand = new SqlCommand(getUsers, connectionToServer);
            try
            {
                connectionToServer.Open();

                SqlDataReader sqlReader = sqlCommand.ExecuteReader();
                while(sqlReader.Read())
                {
                    if((string)sqlReader["emailAddress"] == txtEmailAdd.Text)
                    {
                        registeredUser = true;
                    }
                }
            }

            finally
            {
                connectionToServer.Close();
            }

            if (registeredUser)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Your email address is already registered in our database. Please login.');", true);
                txtName.Text = "";
                txtAddress1.Text = "";
                txtAddress2.Text = "";
                txtCity.Text = "";
                txtZip.Text = "";
                txtEmailAdd.Text = "";
            }
            else
            {
                aUser.Name = txtName.Text;
                aUser.AddressLine1 = txtAddress1.Text;
                aUser.AddressLine2 = (txtAddress2.Text == "" || txtAddress2.Text == null) ? "" : txtAddress2.Text;
                aUser.City = txtCity.Text;
                aUser.Zip = txtZip.Text;
                aUser.State = ddlState.SelectedValue;
                aUser.EmailAddress = txtEmailAdd.Text;
                aUser.Password = txtPassword.Text;

                allUsersList.Add(aUser);

                string userDetail = "INSERT INTO GuptaA_WADfl15_Users(emailAddress,Name,AddressLine1,AddressLine2,City,Zip,State,Password)" +
                                      "VALUES('" + txtEmailAdd.Text + "','" + txtName.Text + "','" + txtAddress1.Text + "','" + txtAddress2.Text + "','" + txtCity.Text + "','" + txtZip.Text + "','" + ddlState.SelectedValue + "','" + txtPassword.Text + "')";

                sqlCommand = new SqlCommand(userDetail, connectionToServer);

                try
                {
                    connectionToServer.Open();

                    sqlCommand.ExecuteNonQuery();
                }

                finally
                {
                    connectionToServer.Close();
                }

                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Thank you for registering. You can now log in.');", true);
                txtName.Text = "";
                txtAddress1.Text = "";
                txtAddress2.Text = "";
                txtCity.Text = "";
                txtZip.Text = "";
                txtEmailAdd.Text = "";
            }
        }
    }

    protected void btnLogIn_Clicked(object sender, EventArgs e)
    {
        List<User> allUsersList = Application["AllUserList"] as List<User>;

        SqlConnection connectionToServer = new SqlConnection("Data Source=dcm.uhcl.edu;Initial Catalog=c432015fa03guptaa;User ID=guptaa;Password=1362659");
        string getUsers = "Select * from GuptaA_WADfl15_Users";
        Boolean registeredUser = false;

        SqlCommand sqlCommand = new SqlCommand(getUsers, connectionToServer);
         try
            {
                connectionToServer.Open();

                SqlDataReader sqlReader = sqlCommand.ExecuteReader();
                while(sqlReader.Read())
                {
                    if ((string)sqlReader["emailAddress"] == txtLoginID.Text && (string)sqlReader["Password"] == txtPassword2.Text)
                    {
                        registeredUser = true;
                        aUser.Name = (string)sqlReader["Name"];
                        aUser.AddressLine1 = (string)sqlReader["AddressLine1"];
                        aUser.AddressLine2 = (string)sqlReader["AddressLine2"];
                        aUser.City = (string)sqlReader["City"];
                        aUser.State = (string)sqlReader["State"];
                        aUser.Zip = (string)sqlReader["Zip"];
                        aUser.EmailAddress = (string)sqlReader["emailAddress"];
                        aUser.Password = (string)sqlReader["Password"];
                    }
                }
                if (registeredUser)
                {
                    Session["presentUser"] = aUser;
                    Response.Redirect("Default.aspx");
                }
            }

         finally
         {
             connectionToServer.Close();
         }


       // foreach (var user in allUsersList)
       // {
       //if (user.EmailAddress == txtLoginID.Text && user.Password == txtPassword2.Text)
       //     {

       //     }
       // }
        if (!registeredUser)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Sorry. You are not a registered user. Please Register.');", true);
            txtLoginID.Text = "";
        }
    }
}