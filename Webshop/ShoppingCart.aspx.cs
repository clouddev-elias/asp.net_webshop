using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;
using Webshop.Checkout;

using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;

namespace Webshop
{
    public partial class ShoppingCart : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            string rawId = Request.QueryString["ProductID"];
            int productId;


            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(rawId) && int.TryParse(rawId, out productId))
                {
                    AddShopCart(productId);
                }

            }
            GridView1.DataSource = DatasetVar();
            GridView1.DataBind();

        }



        public DataSet DatasetVar()
        {

            DataSet ds = new DataSet();
            if (Session["cart"] == null)
            {

                DataTable dt = new DataTable("cart");

                DataColumn PID = new DataColumn("ProductID", typeof(int));
                dt.Columns.Add(PID);
                dt.Columns.Add(new DataColumn("ProductName", typeof(string)));
                dt.Columns.Add(new DataColumn("UnitPrice", typeof(Double)));
                dt.Columns.Add(new DataColumn("Quantity", typeof(int)));
                dt.Columns.Add(new DataColumn("subTotal", typeof(Double), "Quantity*UnitPrice"));
                dt.Columns.Add(new DataColumn("Total", typeof(Double), "SUM(subTotal)"));

                DataColumn[] keys = new DataColumn[1];
                keys[0] = PID;
                dt.PrimaryKey = keys;
                ds.Tables.Add(dt);
                Session["cart"] = ds;
                return ds;
            }
            else
            {

                return (Session["cart"] as DataSet);
            }



        }

        private void AddShopCart(int ItemId)
        {
            object alpha = ItemId;
            string cS = "Data Source=ELIAS-HIGHEND\\SQLSERVER; Initial Catalog=SalgDB;Integrated Security=True;Pooling=False";
            string Select = "SELECT ProductID, ProductName, UnitPrice FROM Products WHERE ProductID = @alpha";
            SqlConnection con = new SqlConnection(cS);
            SqlCommand cmd = new SqlCommand(Select, con);
            cmd.Parameters.AddWithValue("@alpha", alpha);

            DataSet dsi = DatasetVar();
            DataTable dt = dsi.Tables[0];
            DataColumn dc = dt.Columns["ProductID"];
            DataRow datarow = dt.Rows.Find(ItemId);
            
            int quant = 1;

            if (datarow == null)
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {

                    datarow = dt.NewRow();
                    
                    datarow["ProductID"] = reader["ProductID"];
                   
                    datarow["ProductName"] = reader["ProductName"];
                    datarow["Quantity"] = quant;
                    datarow["UnitPrice"] = reader["UnitPrice"];
                   
                    dt.Rows.Add(datarow);
                    
                    dsi.AcceptChanges();
                    
                    GridView1.DataSource = dsi;
                    GridView1.DataBind();



                }
                con.Close();
                Session["cart"] = dsi;

            }

            else
            {
               int qty = Convert.ToInt32(datarow["Quantity"]);
                   qty = qty + quant;
                   datarow["Quantity"] = qty; 

              

              
                GridView1.DataSource = dsi;
                GridView1.DataBind();
               // Session["cart"] = dsi;
               
            }

        }



        public void Remove(int ProductID)
        {

            DataSet ds = DatasetVar();
            DataTable dt = ds.Tables[0];
            DataRow adr = dt.Rows.Find(ProductID);

            if (adr != null)
            {
                ds.Tables[0].Rows.Remove(adr);
                ds.AcceptChanges();

                GridView1.DataSource = DatasetVar();
                GridView1.DataBind();
            }
            //Session["cart"] = ds;
        }




        protected void CheckoutBtn_Click(object sender, ImageClickEventArgs e)
        {

         
           
        }




    

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            int pid = (int)GridView1.DataKeys[e.RowIndex].Value;
            Remove(pid);

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[2].Text = "Totalt:";
                e.Row.Cells[3].Text = System.String.Format("{0:c}", DatasetVar().Tables[0].Rows[0]["Total"]);
            }
            
            
            
            
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                TextBox Quant = (TextBox)(e.Row.Cells[1].FindControl("Quantity"));

                  DataSet ds = DatasetVar();
                  DataTable dt = ds.Tables[0];

                if (Convert.ToInt32(Quant.Text) >=  0)
                {
                    ds.Tables[0].Rows[0]["Quantity"] = Convert.ToInt32(Quant.Text);
                    ds.AcceptChanges();
                }
            }



        
            }





        }


    }
