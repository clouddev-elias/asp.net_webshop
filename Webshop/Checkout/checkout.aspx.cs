using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Webshop;

namespace Webshop.Checkout
{
    public partial class checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void DriveIn()
        {
            DataSet sds = (DataSet)Session["cart"];
            DataTable dt = sds.Tables[0];
            
            string cS = "Data Source=ELIAS-HIGHEND\\SQLSERVER; Initial Catalog=SalgDB;Integrated Security=True;Pooling=False";
            //string INSERT = "INSERT INTO Orders(OrderDate, Username, FirstName, LastName, Address, City, PostalCode, Country, Phone, Total) VALUES (@OrderDate,@UserName, @FirstName, @LastName, @Address, @City, @PostalCode, @Country, @Phone, @Total)";
            //string bigINS = "INSERT INTO Orders(OrderDate, Username, FirstName, LastName, Address, City, PostalCode, Country, Phone), OrderDetails(Username,ProductId,Quantity,UnitPrice) VALUES (@OrderDate, @UserName, @FirstName, @LastName, @Address, @City, @PostalCode, @Country, @Phone, @ProductId, @Quantity, @UnitPrice)";
            SqlConnection con = new SqlConnection(cS);
            SqlCommand cmd = new SqlCommand("CreateNewOrder", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add("@OrderDate", SqlDbType.DateTime);
            cmd.Parameters["@OrderDate"].Value = DateTime.Now;

            cmd.Parameters.Add("@Username", SqlDbType.VarChar);
            cmd.Parameters["@Username"].Value = User.Identity.Name;
            
            cmd.Parameters.Add("@FirstName", SqlDbType.VarChar);
            cmd.Parameters["@FirstName"].Value = TextBox2.Text;

            cmd.Parameters.Add("@LastName", SqlDbType.VarChar);
            cmd.Parameters["@LastName"].Value = TextBox3.Text;

            cmd.Parameters.Add("@Address", SqlDbType.VarChar);
            cmd.Parameters["@Address"].Value = TextBox4.Text;

            cmd.Parameters.Add("@City", SqlDbType.VarChar,25);
            cmd.Parameters["@City"].Value = TextBox5.Text;

            cmd.Parameters.Add("@Postalcode", SqlDbType.VarChar,4);
            cmd.Parameters["@Postalcode"].Value = TextBox6.Text;

            cmd.Parameters.Add("@Country", SqlDbType.VarChar,10);
            cmd.Parameters["@Country"].Value = TextBox7.Text;

            cmd.Parameters.Add("@Phone", SqlDbType.VarChar,9);
            cmd.Parameters["@Phone"].Value = TextBox8.Text;
           
            cmd.Parameters.Add("@Total", SqlDbType.Decimal);
            cmd.Parameters["@Total"].Value = dt.Rows[0]["Total"];
            con.Open();
            int key = Convert.ToInt32(cmd.ExecuteScalar());

            foreach (DataRow dr in dt.Rows)
            {

                    SqlCommand cmdsec = new SqlCommand("InsertDetOrder", con);
                    cmdsec.CommandType = CommandType.StoredProcedure;

                    cmdsec.Parameters.Add("@OrderId", SqlDbType.Int);
                    cmdsec.Parameters["@OrderId"].Value = key;

                    cmdsec.Parameters.Add("@Username", SqlDbType.VarChar);
                    cmdsec.Parameters["@Username"].Value = User.Identity.Name;
                    
                    cmdsec.Parameters.Add("@Productid", SqlDbType.Int);
                    cmdsec.Parameters["@Productid"].Value = dr["ProductID"];

                    cmdsec.Parameters.Add("@Quantity", SqlDbType.Int);
                    cmdsec.Parameters["@Quantity"].Value = dr["Quantity"];

                    cmdsec.Parameters.Add("@UnitPrice", SqlDbType.Float);
                    cmdsec.Parameters["@UnitPrice"].Value = dr["UnitPrice"];
                    
                    cmdsec.ExecuteNonQuery();

            }
            Response.Redirect("Complete.aspx");
            Session["cart"] = (DataSet)null;
            sds = null;
            con.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DriveIn();

        }

    }
}