using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Car_Rental
{
    public partial class CarBooking : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            CarList();


        }
        public void Clear()
        {
            cust_name.Text = " ";
            cust_address.Text = " ";
            cust_mob.Text = " ";
            aadharno.Text = " ";
            plateno.Text = " ";
            brand.Text = " ";
            rentdate.Value = " ";
            returndate.Value = " ";
            fees.Text = "";

        }


        private void CarList()
        {
            string projectConnection = ConfigurationManager.ConnectionStrings["car_rentalConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(projectConnection);
            con.Open();

            SqlCommand cmd = new SqlCommand("fetch_AvailableCars", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter p1 = new SqlParameter("@Status", SqlDbType.VarChar);
            cmd.Parameters.Add(p1).Value = "Available";
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            CarBookings.DataSource = ds.Tables[0];
            CarBookings.DataBind();
            Update_carDetails();
            
            con.Close();
        }
        private void Update_carDetails()
        {

            string projectConnection = ConfigurationManager.ConnectionStrings["car_rentalConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(projectConnection);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update_BookingCars", con);
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
        }
        protected void submit_btn_Click(object sender, EventArgs e)
        {
            string projectConnection = ConfigurationManager.ConnectionStrings["car_rentalConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(projectConnection);
            con.Open();
            try
            {
                if (cust_name.Text == " " || cust_address.Text == " " || cust_mob.Text == " " || aadharno.Text == " " ||
                   plateno.Text == " " || brand.Text == " " || rentdate.Value == " " || returndate.Value == " " || fees.Text == "")

                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "script", "alert('Please Required Field')", true);
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("insert_BookingCars", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter p1 = new SqlParameter("@CustomerName", SqlDbType.VarChar);
                    cmd.Parameters.Add(p1).Value = cust_name.Text;
                    SqlParameter p2 = new SqlParameter("@CustomerAddress", SqlDbType.VarChar);
                    cmd.Parameters.Add(p2).Value = cust_address.Text;
                    SqlParameter p3 = new SqlParameter("@CustomerMobileNumber", SqlDbType.VarChar);
                    cmd.Parameters.Add(p3).Value = cust_mob.Text;
                    SqlParameter p4 = new SqlParameter("@AadharNo", SqlDbType.Int);
                    cmd.Parameters.Add(p4).Value = aadharno.Text;
                    SqlParameter p5 = new SqlParameter("@plateNo", SqlDbType.VarChar);
                    cmd.Parameters.Add(p5).Value = plateno.Text;
                    SqlParameter p6 = new SqlParameter("@Brand", SqlDbType.VarChar);
                    cmd.Parameters.Add(p6).Value = brand.Text;
                    SqlParameter p7 = new SqlParameter("@RentDate", SqlDbType.DateTime);
                    cmd.Parameters.Add(p7).Value = rentdate.Value;
                    SqlParameter p8 = new SqlParameter("@ReturnDate", SqlDbType.DateTime);
                    cmd.Parameters.Add(p8).Value = returndate.Value;
                    SqlParameter p9 = new SqlParameter("@Fees", SqlDbType.Int);
                    cmd.Parameters.Add(p9).Value = fees.Text;
                    int i = cmd.ExecuteNonQuery();
                    ScriptManager.RegisterStartupScript(this, GetType(), "script", "alert('Car Booking Successfully')", true);
                    con.Close();
                    Update_carDetails();
                    CarList();
                    
                    Clear();
                    
                }
            }

            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Script", "alert('Exception')", true);
            }
        }

        protected void CarBookings_SelectedIndexChanged(object sender, EventArgs e)
        {
            plateno.Text = CarBookings.SelectedRow.Cells[1].Text;
            brand.Text = CarBookings.SelectedRow.Cells[2].Text;
            fees.Text = CarBookings.SelectedRow.Cells[4].Text;
        }

        protected void cancel_btn_Click(object sender, EventArgs e)
        {
            Clear();
        }

        protected void label_TextChanged(object sender, EventArgs e)
        {

        }
    }
}