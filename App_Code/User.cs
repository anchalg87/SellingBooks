using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Class1
/// </summary>
public class User
{
	private string name; 
    private string addressLine1; 
    private string addressLine2; 
    private string city; 
    private string zip; 
    private string state; 
    private string emailAddress; 
    private string password;
    
    public SoldBook[] soldBooks { get; set; } //This Array is used to store the books this user sold. It is an array of SoldBook objects.

    public string Name //This is a property to the name field. 
    { 
        get { return name; } 
        set { name = value; } 
    } 

    public string AddressLine1
    {
        get { return addressLine1; }
        set { addressLine1 = value; }
    }

    public string AddressLine2
    {
        get { return addressLine2; }
        set { addressLine2 = value; }
    }

    public string City
    {
        get { return city; }
        set { city = value; }
    }

    public string Zip
    {
        get { return zip; }
        set { zip = value; }
    }

    public string State
    {
        get { return state; }
        set { state = value; }
    }

    public string EmailAddress
    {
        get { return emailAddress; }
        set { emailAddress = value; }
    }

    public string Password
    {
        get { return password; }
        set { password = value; }
    }
}