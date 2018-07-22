using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

namespace Webshop
{
    public partial class Site : System.Web.UI.MasterPage
    {
        ShoppingCart sc = new ShoppingCart();

        protected void Page_Load(object sender, EventArgs e)

        {
            DataSet ds = sc.DatasetVar();
            HyperLink1.Text = "Kurv (" + ds.Tables[0].Rows.Count.ToString() + ")";
            LabelNav.Text = "Her er du: " + Path.GetFileName(Request.Path);
            
        }


        [System.Web.Services.WebMethod]
        public static string GetServerDate()
        {
            return DateTime.Now.ToLocalTime().ToString();
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Search.aspx?search=" + TextBox1.Text);
        }

    }
}