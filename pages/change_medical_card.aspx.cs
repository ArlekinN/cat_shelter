using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_Change_medical_card : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        long idmc = Convert.ToInt64(Session["IdMC"]);
        string crit = "Select * from Q_cat_medical_card where idMedical_card=" + idmc;
        DataIll.SelectCommand = crit;
        Table_illness.DataBind();
    }

    protected void change_ill(object sender, EventArgs e)
    {
        long idmc = Convert.ToInt64(Session["IdMC"]);
        string date = Convert.ToString(TextBox_change_date.Text);
        string crit = "Update medical_card set date_of_recovery='" + date + "', idState_cat=" + List_new_state.Text + " where idMedical_card=" + idmc;
        string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("/DataBaseCat.accdb");
        var connect = new OleDbConnection(connectionString);
        connect.Open();
        var mycom = new OleDbCommand();
        mycom.Connection = connect;
        mycom.CommandText = crit;
        mycom.ExecuteNonQuery();
        connect.Close();
        Response.Redirect("admin_cat.aspx");
    }
}