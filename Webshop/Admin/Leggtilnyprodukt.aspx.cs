using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Webshop.Admin
{
    public partial class Leggtilnyprodukt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void AddProductButton_Click(object sender, EventArgs e)
        {
            Boolean fileOK = false;
            object Pname = DetailsView1.FindControl("ProductName");
            String pname1 = Convert.ToString(Pname);
            FileUpload ProductImage = (FileUpload)DetailsView1.FindControl("ImagePath");
            String path = Server.MapPath("~/Images/");
            if (ProductImage.HasFile)
            {
                String fileExtension = System.IO.Path.GetExtension(ProductImage.FileName).ToLower();
                String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])
                    {
                        fileOK = true;
                    }
                }
            }

            if (fileOK)
            {
                try
                {
                    // Save to Images folder.
                    ProductImage.PostedFile.SaveAs(path + ProductImage.FileName);
                    // Save to Images/Thumbs folder.
                    ProductImage.PostedFile.SaveAs(path + "Img/" + ProductImage.FileName);
                    

                    string cS = "Data Source=ELIAS-HIGHEND\\SQLSERVER; Initial Catalog=SalgDB;Integrated Security=True;Pooling=False";
                    string Select = "UPDATE Products SET ImagePath='"+ProductImage.FileName+"'WHERE ProductName='"+pname1+"'";
                    SqlConnection con = new SqlConnection(cS);
                    SqlCommand cmd = new SqlCommand(Select, con);
                    
                    
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                }
                catch (Exception ex)
                {

                    Label1.Text = ex.Message;
                }

                
            }
            else
            {
                Label1.Text = "Unable to accept file type.";
            }
        }
    }

}