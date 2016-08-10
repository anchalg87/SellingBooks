using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class MyAccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            List<User> allUsersList = Application["AllUserList"] as List<User>;

            User currentUser = (User)Session["presentUser"];

            SqlConnection connectionToServer = new SqlConnection("Data Source=dcm.uhcl.edu;Initial Catalog=c432015fa03guptaa;User ID=guptaa;Password=1362659");
            string getUsers = "Select * from GuptaA_WADfl15_Users";
            SqlCommand sqlCommand = new SqlCommand(getUsers, connectionToServer);
            try
            {
                connectionToServer.Open();
                SqlDataReader sqlReader = sqlCommand.ExecuteReader();
                while (sqlReader.Read())
                // foreach (var user in allUsersList)
                {
                    if ((string)sqlReader["Name"] == currentUser.Name)
                    {
                        txtName.Text = (string)sqlReader["Name"];
                        txtAddress1.Text = (string)sqlReader["AddressLine1"];
                        txtAddress2.Text = (string)sqlReader["AddressLine2"];
                        txtCity.Text = (string)sqlReader["City"];
                        txtZip.Text = (string)sqlReader["Zip"];
                        ddlState.SelectedValue = (string)sqlReader["State"];
                        txtEmailAdd.Text = (string)sqlReader["emailAddress"];
                    }
                }
            }

            finally
            {
                connectionToServer.Close();
            }
        }
    }

    protected void btnMainPage_Clicked(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }

    protected void btnUpdate_Clicked(object sender, EventArgs e)
    {
        List<User> allUsersList = Application["AllUserList"] as List<User>;

        User currentUser = (User)Session["presentUser"];

        SqlConnection connectionToServer = new SqlConnection("Data Source=dcm.uhcl.edu;Initial Catalog=c432015fa03guptaa;User ID=guptaa;Password=1362659");
        string getUsers = "Select * from GuptaA_WADfl15_Users";
        SqlCommand sqlCommand = new SqlCommand(getUsers, connectionToServer);

        try
        {
            string Address1="";
            string Address2="";
            string userCity="";
            string userZip="";
            string userState="";
            string userPwd="";
            connectionToServer.Open();
            SqlDataReader sqlReader = sqlCommand.ExecuteReader();
            while (sqlReader.Read())
            // foreach (var user in allUsersList)
            {
                if ((string)sqlReader["Name"] == currentUser.Name)
                {
                    Address1 = txtAddress1.Text;
                    Address2 = txtAddress2.Text;
                    userCity = txtCity.Text;
                    userZip = txtZip.Text;
                    userState = ddlState.SelectedValue;
                    userPwd = txtPassword.Text;

                }
            }
            sqlReader.Close();
            string updateUsers = "Update GuptaA_WADfl15_Users set AddressLine1='" + Address1 + "', AddressLine2 = '" + Address2 + "', City = '" + userCity + "', Zip = '" + userZip + "', State = '" + userState + "', Password = '" + userPwd + "' where Name ='" + currentUser.Name + "'";
            SqlCommand sqlCommand2 = new SqlCommand(updateUsers, connectionToServer);
            sqlCommand2.ExecuteNonQuery();

            txtName.Text = currentUser.Name;
            txtAddress1.Text = Address1;
            txtAddress2.Text = Address2;
            txtCity.Text = userCity;
            txtZip.Text = userZip;
            ddlState.SelectedValue = userState;
            txtEmailAdd.Text = currentUser.EmailAddress;

        }
        finally
        {
            connectionToServer.Close();
        }
        Application["AllUserList"] = allUsersList;
    }

    protected void btnUpdateMainPage_Clicked(object sender, EventArgs e)
    {
        List<User> allUsersList = Application["AllUserList"] as List<User>;

        User currentUser = (User)Session["presentUser"];

        SqlConnection connectionToServer = new SqlConnection("Data Source=dcm.uhcl.edu;Initial Catalog=c432015fa03guptaa;User ID=guptaa;Password=1362659");
        string getUsers = "Select * from GuptaA_WADfl15_Users";
        SqlCommand sqlCommand = new SqlCommand(getUsers, connectionToServer);

        try
        {
            string Address1="";
            string Address2="";
            string userCity="";
            string userZip="";
            string userState="";
            string userPwd="";
            connectionToServer.Open();
            SqlDataReader sqlReader = sqlCommand.ExecuteReader();
            while (sqlReader.Read())

            // foreach (var user in allUsersList)
            {
                if ((string)sqlReader["Name"] == currentUser.Name)
                {
                    Address1 = txtAddress1.Text;
                    Address2 = txtAddress2.Text;
                    userCity = txtCity.Text;
                    userZip = txtZip.Text;
                    userState = ddlState.SelectedValue;
                    userPwd = txtPassword.Text;
                }
            }
            sqlReader.Close();
            string updateUsers = "Update GuptaA_WADfl15_Users set AddressLine1='" + Address1 + "', AddressLine2 = '" + Address2 + "', City = '" + userCity + "', Zip = '" + userZip + "', State = '" + userState + "', Password = '" + userPwd + "'";
            SqlCommand sqlCommand2 = new SqlCommand(updateUsers, connectionToServer);
            sqlCommand2.ExecuteNonQuery();
        }
        finally
        {
            connectionToServer.Close();
        }

        Application["AllUserList"] = allUsersList;
        Response.Redirect("Default.aspx");
    }
}