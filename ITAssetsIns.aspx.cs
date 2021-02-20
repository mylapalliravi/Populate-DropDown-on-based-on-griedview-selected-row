using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class ITAssetsIns :  System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetLocations();
        }
     
    }


    string strcon = ConfigurationManager.ConnectionStrings["inCoreConnectionString"].ConnectionString;
    public void GetLocations()
    {
       // var empcd = Session["empcode"].ToString();
          try
          {
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "inCore.dbo.usp_ITAssets_Ins";
                cmd.Parameters.AddWithValue("@Flag", "GetITAssets");
                var empcd= Convert.ToString(Session["empcode"]);
                cmd.Parameters.AddWithValue("@empcd", empcd);
                cmd.CommandTimeout = 0;
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                cmd.Connection = con;
                adpt.SelectCommand = cmd;
                DataSet ds = new DataSet();
                adpt.Fill(ds);

                DDLLoc.DataSource = ds.Tables[0];
                DDLLoc.DataTextField = "locationname";
                DDLLoc.DataBind();
                DDLLoc.Items.Insert(0, new ListItem("SELECT", ""));

                DDLAtype.DataSource = ds.Tables[1];
                DDLAtype.DataTextField = "AssetTypeDesc";
                DDLAtype.DataBind();
                DDLAtype.Items.Insert(0, new ListItem("SELECT", ""));

                DDLMdl.DataSource = ds.Tables[2];
                DDLMdl.DataTextField = "AssetTypeDesc";
                DDLMdl.DataBind();
                DDLMdl.Items.Insert(0,new ListItem("SELECT",""));

                DDLMake.DataSource = ds.Tables[3];
                DDLMake.DataTextField = "AssetTypeDesc";
                DDLMake.DataBind();
                DDLMake.Items.Insert(0, new ListItem("SELECT", ""));


                DDLOS.DataSource = ds.Tables[4];
                DDLOS.DataTextField = "AssetTypeDesc";
                DDLOS.DataBind();
                DDLOS.Items.Insert(0, new ListItem("SELECT", ""));

                DDLOffce.DataSource = ds.Tables[5];
                DDLOffce.DataTextField = "AssetTypeDesc";
                DDLOffce.DataBind();
                DDLOffce.Items.Insert(0, new ListItem("SELECT", ""));

                DDLRam.DataSource = ds.Tables[6];
                DDLRam.DataTextField = "AssetTypeDesc";
                DDLRam.DataBind();
                DDLRam.Items.Insert(0, new ListItem("SELECT", ""));

                DDLHD.DataSource = ds.Tables[7];
                DDLHD.DataTextField = "AssetTypeDesc";
                DDLHD.DataBind();
                DDLHD.Items.Insert(0, new ListItem("SELECT", ""));

                DDLEmp.DataSource = ds.Tables[8];
                DDLEmp.DataTextField = "EMPNM";
                DDLEmp.DataBind();
                DDLEmp.Items.Insert(0, new ListItem("SELECT", ""));

               

          }
            catch (Exception ex)
            {

               
            }
        
    }


    public void ITAssets_display()
    {
        try
        {

            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd = new SqlCommand("usp_ITAssets_Ins", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@flag", "GET_ITTypes");
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        catch (Exception ex)
        {

            throw;
        }
       
        
    }

    protected void Button_Save(object sender,EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(strcon);

            SqlCommand cmd = new SqlCommand("inCore..usp_ITAssets_Ins", con);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@flag", "insertITAssert");
           
            cmd.Parameters.AddWithValue("@Locationname",DDLLoc.Text );
            cmd.Parameters.AddWithValue("@AssetTypeDesc", DDLAtype.Text);
            cmd.Parameters.AddWithValue("@Model", DDLMdl.Text);
            cmd.Parameters.AddWithValue("@MakeDesc", DDLMake.Text);
            cmd.Parameters.AddWithValue("@serialno", TxtSerno.Text);
            cmd.Parameters.AddWithValue("@OS", DDLOS.Text);
            cmd.Parameters.AddWithValue("@Office", DDLOffce.Text);
            cmd.Parameters.AddWithValue("@RAM", DDLRam.Text);
            cmd.Parameters.AddWithValue("@HDISCK", DDLHD.Text);
            cmd.Parameters.AddWithValue("@EMPNM", DDLEmp.Text);
          

            int i=cmd.ExecuteNonQuery();

            ITAssets_display();

           
        }
        catch (Exception ex)
        {

            throw;
        }

    }


    protected void BttnClear_Click(object sender,EventArgs e)
    {
        DDLLoc.Text = "";
        DDLAtype.Text = "";
        DDLMdl.Text = "";
        DDLMake.Text = "";
        TxtSerno.Text = "";
        DDLOS.Text = "";
        DDLOffce.Text = "";
        DDLRam.Text = "";
        DDLHD.Text = "";
        DDLEmp.Text = "";
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Select")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex];
                string lblLoca = (row.FindControl("lblLoca") as Label).Text;
                string lblAssetTypeDesc = (row.FindControl("lblAssetTypeDesc") as Label).Text;
                string lblModel = (row.FindControl("lblModel") as Label).Text;
                string lblMakeDesc = (row.FindControl("lblMakeDesc") as Label).Text;
                string lblserialno = (row.FindControl("lblserialno") as Label).Text;
                string lblOS = (row.FindControl("lblOS") as Label).Text;
                string lblOffice = (row.FindControl("lblOffice") as Label).Text;
                string lblRAM = (row.FindControl("lblRAM") as Label).Text;
                string lblHDISCK = (row.FindControl("lblHDISCK") as Label).Text;
                string lblEMPNM = (row.FindControl("lblEMPNM") as Label).Text;

                DDLLoc.Items.Insert(0, new ListItem(lblLoca));
                DDLAtype.Items.Insert(0, new ListItem(lblAssetTypeDesc));
                DDLMdl.Items.Insert(0, new ListItem(lblModel));
                DDLMake.Items.Insert(0, new ListItem(lblMakeDesc));
                DDLOS.Items.Insert(0, new ListItem(lblOS));
                DDLOffce.Items.Insert(0, new ListItem(lblOffice));
                DDLRam.Items.Insert(0, new ListItem(lblRAM));
                DDLHD.Items.Insert(0, new ListItem(lblHDISCK));
                DDLEmp.Items.Insert(0, new ListItem(lblEMPNM));

                DDLLoc.SelectedValue = lblLoca;
                DDLAtype.SelectedValue = lblAssetTypeDesc;
                DDLMdl.SelectedValue = lblModel;
                DDLMake.SelectedValue = lblMakeDesc;
                TxtSerno.Text = lblserialno;
                DDLOS.SelectedValue = lblOS;
                DDLOffce.SelectedValue = lblOffice;
                DDLRam.SelectedValue = lblRAM;
                DDLHD.SelectedValue = lblHDISCK;
                DDLEmp.SelectedValue = lblEMPNM;
            }
        }
        catch (Exception ex)
        {


        }
    }
}


