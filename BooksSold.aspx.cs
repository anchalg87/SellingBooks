using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class BooksSold : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        User userName = (User)Session["presentUser"];
        if (userName != null)
        {
            lblUserName2.Text = userName.Name.ToString();
            lblEmailID2.Text = userName.EmailAddress.ToString();
            int i;
            TableRow trow = new TableRow();
            trow.ForeColor = System.Drawing.ColorTranslator.FromHtml("black");
            trow.Font.Bold = true;
            soldBooks.Rows.Add(trow);
            for (int j = 1; j <= 4; j++)
            {
                TableCell tcel = new TableCell();
                if (j == 1)
                    tcel.Text = "ISBN Number";
                else if (j == 2)
                    tcel.Text = "Title";
                else if (j == 3)
                    tcel.Text = "Date Sold";
                else if (j == 4)
                    tcel.Text = "Price Sold";
                trow.Cells.Add(tcel);
            }
            SqlConnection connectionToServer = new SqlConnection("Data Source=dcm.uhcl.edu;Initial Catalog=c432015fa03guptaa;User ID=guptaa;Password=1362659");
            string getBooks = "Select * from GuptaA_WADfl15_Transactions t inner join GuptaA_WADfl15_BookInfor b on b.ISBN = t.IsbnNumber where emailAddress='" + userName.EmailAddress + "'";
            SqlCommand sqlCommand = new SqlCommand(getBooks, connectionToServer);
            string[,] booksSold = new string[30,4];
            try
            {
                connectionToServer.Open();
                SqlDataReader sqlReader = sqlCommand.ExecuteReader();
                int k = 0;
                while (sqlReader.Read())
                {
                    if ((string)sqlReader["emailAddress"] == userName.EmailAddress)
                    {
                        booksSold[k,0] = (string)sqlReader["IsbnNumber"];
                        booksSold[k,1] = (string)sqlReader["Title"];
                        booksSold[k,2] = Convert.ToString(sqlReader["dateSold"]);
                        booksSold[k,3] = Convert.ToString(sqlReader["soldPrice"]);
                    }
                    k++;
                }
            }

            finally
            {
                connectionToServer.Close();
            }

            for (i = 0; i < booksSold.GetLength(0); i++)
            {
                TableRow tRow = new TableRow();
                soldBooks.Rows.Add(tRow);
                for (int cellCtr = 0; cellCtr < 4; cellCtr++)
                {
                    // Create a new cell and add it to the row.
                    TableCell tCell = new TableCell();
                    if (cellCtr == 0)
                        tCell.Text = booksSold[i, 0];
                    else if (cellCtr == 1)
                        tCell.Text = booksSold[i, 1];
                    else if (cellCtr == 2)
                        tCell.Text = booksSold[i, 2];
                    else if (cellCtr == 3)
                        tCell.Text = booksSold[i, 3];

                    tRow.Cells.Add(tCell);
                }
                if (booksSold[i, 0] == null)
                    break;
            }
        }
    }

    protected void btnMainPage_Clicked(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }



    protected void btnSellBook_Clicked(object sender, EventArgs e)
    {
        Response.Redirect("BookDetails.aspx");
    }
}