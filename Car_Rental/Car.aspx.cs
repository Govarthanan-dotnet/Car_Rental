using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Car_Rental
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            populate();
        }
        private void populate()
        {
            string projectConnection = ConfigurationManager.ConnectionStrings["car_rentalConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(projectConnection);
            con.Open();
            SqlCommand cmd = new SqlCommand("fetch_carDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            CarList.DataSource = ds.Tables[0];
            CarList.DataBind();
            con.Close();
        }
        
        private void Clear()
        {
            plate_number.Text = "";
            brand.Text = "";
            model.Text = "";
            price.Text = "";
            available.Text = "";
        }

        protected void update_btn_Click(object sender, EventArgs e)
        {
            string projectConnection = ConfigurationManager.ConnectionStrings["car_rentalConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(projectConnection);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update_carDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter p1 = new SqlParameter("@plateNo", SqlDbType.VarChar);
                cmd.Parameters.Add(p1).Value = plate_number.Text;
                SqlParameter p2 = new SqlParameter("@Brand", SqlDbType.VarChar);
                cmd.Parameters.Add(p2).Value = brand.Text;
                SqlParameter p3 = new SqlParameter("@Model", SqlDbType.VarChar);
                cmd.Parameters.Add(p3).Value = model.Text;
                SqlParameter p4 = new SqlParameter("@Price", SqlDbType.Int);
                cmd.Parameters.Add(p4).Value = price.Text;
                SqlParameter p5 = new SqlParameter("@Status", SqlDbType.VarChar);
                cmd.Parameters.Add(p5).Value = available.Text;
                cmd.ExecuteNonQuery();
                string msg = "alert(\" Updated Successfully\")";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerScript", msg, true);
                con.Close();
                populate();
                Clear();
            }
            catch (Exception)
            {
                string msg = "alert(\" Exception\")";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerScript", msg, true);
            }
        }

        protected void save_btn_Click(object sender, EventArgs e)
        {
            string projectConnection = ConfigurationManager.ConnectionStrings["car_rentalConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(projectConnection);
            try
            {
                
                con.Open();
                if (plate_number.Text=="" || brand.Text == "" || model.Text=="" || price.Text == "" || available.Text == "")
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Script", "alert('Please Enter All Fields')", true);
                }
                else
                {

                    SqlCommand cmd = new SqlCommand("insert_carDetails", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlParameter p1 = new SqlParameter("@plateNo", SqlDbType.VarChar);
                    cmd.Parameters.Add(p1).Value = plate_number.Text;
                    SqlParameter p2 = new SqlParameter("@Brand", SqlDbType.VarChar);
                    cmd.Parameters.Add(p2).Value = brand.Text;
                    SqlParameter p3 = new SqlParameter("@Model", SqlDbType.VarChar);
                    cmd.Parameters.Add(p3).Value = model.Text;
                    SqlParameter p4 = new SqlParameter("@Price", SqlDbType.Int);
                    cmd.Parameters.Add(p4).Value = price.Text;
                    SqlParameter p5 = new SqlParameter("@Status", SqlDbType.VarChar);
                    cmd.Parameters.Add(p5).Value = available.Text;
                    cmd.ExecuteNonQuery();
                    //   string msg = "alert(\"Car Details Entered Successfully\")";
                    ScriptManager.RegisterStartupScript(this, GetType(), "Script", "alert('Car Details Entered Successfully')", true);
                    con.Close();
                    populate();
                    Clear();
                }
            }
            catch (Exception)
            {
                string msg = "alert(\"ex Message\")";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerScript", msg, true);
            }

        }

        protected void delete_btn_Click(object sender, EventArgs e)
        {
            string projectConnection = ConfigurationManager.ConnectionStrings["car_rentalConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(projectConnection);
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete_carDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlParameter p1 = new SqlParameter("@plateNo", SqlDbType.VarChar);
                cmd.Parameters.Add(p1).Value = plate_number.Text;
                cmd.ExecuteNonQuery();
                string msg = "alert(\"Car Details Deleted Successfully\")";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerScript", msg, true);

                con.Close();
                populate();
                Clear();
            }
            catch (Exception)
            {
                string msg = "alert(\"ex message\")";
                ScriptManager.RegisterStartupScript(this, GetType(), "ServerScript", msg, true);

            }
        }

        protected void CarList_SelectedIndexChanged(object sender, EventArgs e)
        {
            plate_number.Text = CarList.SelectedRow.Cells[1].Text;
            brand.Text = CarList.SelectedRow.Cells[2].Text;
            model.Text = CarList.SelectedRow.Cells[3].Text;
            price.Text = CarList.SelectedRow.Cells[4].Text;
            available.Text = CarList.SelectedRow.Cells[5].Text;
        }
    }
}