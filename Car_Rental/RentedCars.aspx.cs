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
    public partial class WebForm3 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            ShowCars();
        }
        private void ShowCars()
        {
            string projectConnection = ConfigurationManager.ConnectionStrings["car_rentalConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(projectConnection);
            con.Open();
            SqlCommand cmd = new SqlCommand("fetch_BookingCars", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            RentedCars.DataSource = ds.Tables[0];
            RentedCars.DataBind();
            DeleteCars();
            con.Close();
            
        }
        private void CarList()
        {
            string projectConnection = ConfigurationManager.ConnectionStrings["car_rentalConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(projectConnection);
           
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("availableCars", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter p1 = new SqlParameter("@plateNo", SqlDbType.VarChar);
                cmd.Parameters.Add(p1).Value = plateno.Text;
                SqlParameter p2 = new SqlParameter("@Status", SqlDbType.VarChar);
                cmd.Parameters.Add(p2).Value = status.Text;
                cmd.ExecuteNonQuery();
                con.Close();
               
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "script", "alert('Exception')", true);

            }

            con.Close();
        }
        private void DeleteCars()
        {
            string projectConnection = ConfigurationManager.ConnectionStrings["car_rentalConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(projectConnection);
              con.Open(); 
                SqlCommand cmd = new SqlCommand("delete_rentedCars", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter p1 = new SqlParameter("@RentId", SqlDbType.VarChar);
                cmd.Parameters.Add(p1).Value = rentid.Text;
                cmd.ExecuteNonQuery();
                con.Close();
                


        }
        public void Clear()
        {
            rentid.Text = "";
            name.Text = "";
            plateno.Text = "";
            brand.Text = "";
            returndate.Value = "";
            delay.Text = "";
            fine.Text = "";

        }

       
        protected void RentedCars_SelectedIndexChanged(object sender, EventArgs e)
        {
           rentid.Text = RentedCars.SelectedRow.Cells[1].Text;
            name.Text = RentedCars.SelectedRow.Cells[2].Text;
            plateno.Text = RentedCars.SelectedRow.Cells[6].Text;
            brand.Text = RentedCars.SelectedRow.Cells[7].Text;
        }

       
        protected void Retun_btn_Click(object sender, EventArgs e)
        {
            string projectConnection = ConfigurationManager.ConnectionStrings["car_rentalConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(projectConnection);

            try
            {
                con.Open();
                if (rentid.Text == "" || name.Text == "" || plateno.Text == "" || brand.Text == "" || returndate.Value == ""||
                    delay.Text == "" || fine.Text == "")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "script", "alert('Please Enter the Fields')", true);

                }
                else
                {
                    SqlCommand cmd = new SqlCommand("insert_returnedCars", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter p1 = new SqlParameter("@RentId", SqlDbType.VarChar);
                    cmd.Parameters.Add(p1).Value = rentid.Text;
                    SqlParameter p2 = new SqlParameter("@CustomerName", SqlDbType.VarChar);
                    cmd.Parameters.Add(p2).Value = name.Text;
                    SqlParameter p3 = new SqlParameter("@plateNo", SqlDbType.VarChar);
                    cmd.Parameters.Add(p3).Value = plateno.Text;
                    SqlParameter p4 = new SqlParameter("@Brand", SqlDbType.VarChar);
                    cmd.Parameters.Add(p4).Value = brand.Text;
                    SqlParameter p5 = new SqlParameter("@ReturnDate", SqlDbType.DateTime);
                    cmd.Parameters.Add(p5).Value = returndate.Value;
                    SqlParameter p6 = new SqlParameter("@Delay", SqlDbType.VarChar);
                    cmd.Parameters.Add(p6).Value = delay.Text;
                    SqlParameter p7 = new SqlParameter("@Fine", SqlDbType.Int);
                    cmd.Parameters.Add(p7).Value = fine.Text;
                    int i = cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "script", "alert('Car Returned Successfully')", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "script", "alert('Car Not Returned')", true);
                    }
                    con.Close();
                    DeleteCars();
                    ShowCars();
                    CarList();
                    Clear();
                }
            }

            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Script", "alert('Exception')", true);
            }
        }

        protected void Searh_btn_Click(object sender, EventArgs e)
        {
            string projectConnection = ConfigurationManager.ConnectionStrings["car_rentalConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(projectConnection);
            con.Open();
            SqlCommand cmd = new SqlCommand("search_RentedCars", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter p1 = new SqlParameter("@Search", SqlDbType.VarChar);
            cmd.Parameters.Add(p1).Value = search.Text;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            RentedCars.DataSource = ds.Tables[0];
            RentedCars.DataBind();
            con.Close();
            
            search.Text = "";
        }
    }
}