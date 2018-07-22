using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Webshop
{
    public partial class Products : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SalgDBConnectionString"].ConnectionString);
        DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM Products", con);
            
            if (!IsPostBack)
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                dt.Load(dr);

                productList.DataSource = dt;
                productList.DataBind();
                con.Close();
            }
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            productList.DataSource = null;
            productList.DataBind();
            

            if (DropDownList1.SelectedValue == "1") {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Products ORDER BY UnitPrice asc", con);
                con.Open();
                
                SqlDataReader dr = cmd.ExecuteReader();
                dt.Load(dr);
                productList.DataSource = dt;
                productList.DataBind();
                con.Close();
            }
            if (DropDownList1.SelectedValue == "2")
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Products ORDER BY UnitPrice desc", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                dt.Load(dr);
                productList.DataSource = dt;
                productList.DataBind();
                con.Close();
            }

            if (DropDownList1.SelectedValue == "3")
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Products ORDER BY ProductName asc", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                dt.Load(dr);
                productList.DataSource = dt;
                productList.DataBind();
                con.Close();
            }
            if (DropDownList1.SelectedValue == "4")
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Products ORDER BY ProductName desc", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                dt.Load(dr);
                productList.DataSource = dt;
                productList.DataBind();
                con.Close();

            }
        }


    }
}