using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SoldBook
/// </summary>
public class SoldBook
{
    private string isbnNumber; 
    private string title;
    private string soldDate;
    private string soldPrice;
    
    public string ISBNNumber //Property for isbnNumber 
    { 
        get { return isbnNumber; } 
        set { isbnNumber = value; } 
    }

    public string Title 
    {
        get { return title; }
        set { title = value; }
    }

    public string SoldDate
    {
        get { return soldDate; }
        set { soldDate = value; }
    }

    public string SoldPrice
    {
        get { return soldPrice; }
        set { soldPrice = value; }
    } 
}