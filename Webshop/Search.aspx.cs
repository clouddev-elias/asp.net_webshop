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
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                String a = Request.QueryString["search"];

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SalgDBConnectionString"].ConnectionString);
                SqlCommand cmd = new SqlCommand("SELECT * FROM Products WHERE ProductName LIKE'%"+a+"%'OR Description LIKE '%"+a+"%'", con);
                if (a != null)
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    DataTable dt = new DataTable();
                    dt.Load(dr);

                    Searchlist.DataSource = dt;
                    Searchlist.DataBind();
                    con.Close();

                }
            }
        }

        

    }
}