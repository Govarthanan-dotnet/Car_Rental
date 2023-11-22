using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Car_Rental
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowDetails();
        }
        public void ShowDetails()
        {
            string projectConnection = ConfigurationManager.ConnectionStrings["car_rentalConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(projectConnection);
            con.Open();
            SqlCommand cmd = new SqlCommand("fetch_ReturnedCars", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            ReturnedCars.DataSource = ds.Tables[0];
            ReturnedCars.DataBind();
            con.Close();

        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            string projectConnection = ConfigurationManager.ConnectionStrings["car_rentalConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(projectConnection);
            con.Open();
            SqlCommand cmd = new SqlCommand("search_plateNo", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter p1 = new SqlParameter("@Search", SqlDbType.VarChar);
            cmd.Parameters.Add(p1).Value = search.Text;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            ReturnedCars.DataSource = ds.Tables[0];
            ReturnedCars.DataBind();
            con.Close();
        }

        protected void ReturnedCars_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

     
    }
}