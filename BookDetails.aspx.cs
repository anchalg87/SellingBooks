using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class BookDetails : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            User userName = (User)Session["presentUser"];
            if(userName == null)
            {
                btnSellBook.Enabled = false;
            }
            else
            {
                btnSellBook.Enabled = true;
            }
            string isbnNo = (String)Session["isbnNo"];
            string[] isbn = Application["ISBN Num"] as string[];
            string[] title = Application["Title"] as string[];
            string[] author = Application["Author"] as string[];
            string[] price = Application["Price"] as string[];

            for (int i = 0; i < 10; i++)
            {
                if (isbn[i] == isbnNo)
                {
                    txtISBN.Text = isbn[i];
                    txtTitle.Text = title[i];
                    txtAuthor.Text = author[i];
                    imgBookCover.ImageUrl = "images/" + isbnNo + ".png";
                    txtPrice.Text = "$" + price[i];
                    break;
                }
            }
        }
    }

    protected void checkISBN_Clicked(object sender, EventArgs e)
    {
        string newISBNNo = txtISBN.Text;
        string[] isbn = Application["ISBN Num"] as string[];
        string[] title = Application["Title"] as string[];
        string[] author = Application["Author"] as string[];
        string[] price = Application["Price"] as string[];
        int i;

        for (i = 0; i < 10; i++)
        {
            if (isbn[i] == newISBNNo)
            {
                txtTitle.Text = title[i];
                txtAuthor.Text = author[i];
                imgBookCover.ImageUrl = "images/" + newISBNNo + ".png";
                txtPrice.Text = "$" + price[i];
                break;
            }
        }

        if(i == 10)
        {
           ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Sorry. The ISBN number you entered is not found in our database.');", true);
        }
    }

    protected void btnNoBuy_Clicked(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }

    protected void btnSellBook_Clicked(object sender, EventArgs e)
    {
      //  ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Thank you for your business.\\nYour account will be updated after we receive the book.\\nA confirmation email has been sent to the email address in our file.');", true);

        //List<SoldBook> bookList = Application["AllBooksSold"] as List<SoldBook>;
        User userName = (User)Session["presentUser"];
        Boolean booksold = false;
        SqlConnection connectionToServer = new SqlConnection("Data Source=dcm.uhcl.edu;Initial Catalog=c432015fa03guptaa;User ID=guptaa;Password=1362659");
        string getBookList = "Select * from GuptaA_WADfl15_Transactions where emailAddress='" + userName.EmailAddress + "'";
        SqlCommand sqlCommand = new SqlCommand(getBookList, connectionToServer);
        try
        {
            connectionToServer.Open();
            SqlDataReader sqlReader = sqlCommand.ExecuteReader();
            while (sqlReader.Read())
            {
                if ((string)sqlReader["emailAddress"] == userName.EmailAddress)
                {
                    if ((string)sqlReader["IsbnNumber"] == txtISBN.Text)
                        booksold = true;
                }
                if (booksold)
                    break;
            }
        }

        finally
        {
            connectionToServer.Close();
        }

        if (booksold)
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('This book has already been sold.');", true);
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Thank you for your business.\\nYour account will be updated after we receive the book.\\nA confirmation email has been sent to the email address in our file.');", true);

            //bookList.ISBNNumber = txtISBN.Text;
            //bookList.Title = txtTitle.Text;
            //bookList.SoldPrice = txtPrice.Text;
            //bookList.SoldDate = DateTime.Today.ToShortDateString();

            //sbList.Add(bookList);

            SqlConnection connectionToServer2 = new SqlConnection("Data Source=dcm.uhcl.edu;Initial Catalog=c432015fa03guptaa;User ID=guptaa;Password=1362659");

            string soldBook = "INSERT INTO GuptaA_WADfl15_Transactions(emailAddress,IsbnNumber,dateSold,soldPrice)" +
                                         "VALUES('" + userName.EmailAddress + "','" + txtISBN.Text + "','" + DateTime.Today.ToShortDateString() + "'," + txtPrice.Text.Replace("$", "") + ")";

            SqlCommand sqlCommand2 = new SqlCommand(soldBook, connectionToServer2);

            try
            {
                connectionToServer2.Open();

                sqlCommand2.ExecuteNonQuery();
            }

            finally
            {
                connectionToServer2.Close();
            }
        }
    }

}