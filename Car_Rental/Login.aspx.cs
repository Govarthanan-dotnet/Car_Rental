using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
using System.Configuration;


namespace Car_Rental
{
    public partial class Login : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
          
        }
        
       
           public void Clear()
           {
             email.Text = "";
             password.Text = "";
           }

        protected void login_btn_Click2(object sender, EventArgs e)
        {
            string projectConnection = ConfigurationManager.ConnectionStrings["car_rentalConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(projectConnection);
            try
            {
                con.Open();
               
                if (email.Text == "admin@gmail.com" && password.Text == "admin123")
                {

                    ScriptManager.RegisterStartupScript(this, GetType(), "Script", "alert('Login Successfully')", true);
                   
                    Response.Redirect("HomePage.aspx");
                }
                else
                {
                 
                    HttpCookie userInfo = new HttpCookie("user");
                    userInfo["Email"] = email.Text;
                    userInfo["Password"] = password.Text;
                    userInfo.Expires = System.DateTime.Now.AddSeconds(-01);
                    Response.Cookies.Add(userInfo);
                    SqlCommand cmd = new SqlCommand("sp_Admin_tbl", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter p1 = new SqlParameter("@Email", SqlDbType.VarChar);
                    cmd.Parameters.Add(p1).Value = email.Text;
                    SqlParameter p2 = new SqlParameter("@Password", SqlDbType.VarChar);
                    cmd.Parameters.Add(p2).Value = password.Text;
                    int i = cmd.ExecuteNonQuery();
                   if(i > 0)
                    { 
                        string msg = "alert(\" Login Successfully\")";
                        ScriptManager.RegisterStartupScript(this, GetType(), "ServerScript", msg, true);
                        
                        Response.Redirect("CarBooking.aspx");

                   }
                    else
                    {
                        string msg = "alert(\" Login Failed\")";
                        ScriptManager.RegisterStartupScript(this, GetType(), "ServerScript", msg, true);
                    }

                }
               
              
                con.Close();
                Clear();


            }
            catch (Exception)
            {
                string msg = "alert(\" Exception \")";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerScript", msg, true);
            }
        }
    }
}
