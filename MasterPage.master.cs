using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Configuration.Provider;
using System.Web.Configuration;
using System.Configuration;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Bt_Admin.Visible = false;
        long iduser = Convert.ToInt64(Session["IDP"]);
        string myuser = Convert.ToString(Session["IdU"]);
        if (iduser != 0)
        {
            Text_login.Visible = false;
            Text_password.Visible = false;
            Enter_login.Visible = false;
            Enter_password.Visible = false;
            Button_entry.Visible = false;
            Button_regestration.Visible = false;
            Button_exit.Visible = true;
            Error.Visible = false;
            Data.Visible = true;
            Data.Text = "Привет " + myuser + "!";
            ImageButton_profile.Visible = true;
            if (myuser == "admin")
                Bt_Admin.Visible = true;
        }
        else
        {
            Text_login.Visible = true;
            Text_password.Visible = true;
            Enter_login.Visible = true;
            Enter_password.Visible = true;
            Button_entry.Visible = true;
            Button_regestration.Visible = true;
            Button_exit.Visible =false;
            Data.Visible = false;
            Error.Visible = false;
            ImageButton_profile.Visible = false;
        }
    }
    protected void LinkButton_to_main(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");

    }
    protected void LinkButton_to_catalog(object sender, EventArgs e)
    {
        Response.Redirect("cat_cataloge_page.aspx");
    }
    protected void LinkButton_to_event(object sender, EventArgs e)
    {
        Response.Redirect("event_page.aspx");
    }
    protected void LinkButton_to_donat(object sender, EventArgs e)
    {
        Response.Redirect("donate_page.aspx");
    }
    protected void LinkButton_to_rules_cat(object sender, EventArgs e)
    {
        Response.Redirect("rules_cat_page.aspx");
    }
    protected void LinkButton_to_volonteer(object sender, EventArgs e)
    {
        Response.Redirect("volonteer_page.aspx");
    }
    protected void LinkButton_to_dop_info(object sender, EventArgs e)
    {
        Response.Redirect("dop_info_page.aspx");
    }
    protected void To_profile(object sender, EventArgs e)
    {
        Response.Redirect("user_page.aspx");
    }

    protected void To_regestration(object sender, EventArgs e)
    {
        Response.Redirect("regestration_page.aspx");
    }

    
    // вход в систему пользователем
    protected void Entery(object sender, EventArgs e)
    {

        string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + Server.MapPath("/DataBaseCat.accdb");
        var connect = new OleDbConnection(connectionString);
        connect.Open();
        string slogin, sparol;
        slogin = Convert.ToString(Enter_login.Text);
        sparol = Convert.ToString(Enter_password.Text);
        string sqlQ = "SELECT * FROM all_user WHERE login='" + slogin + "' AND password='" + sparol+ "'";
        var mycom = new OleDbCommand();
        mycom.CommandText = sqlQ;
        mycom.Connection = connect;
        OleDbDataReader myread;
        myread = mycom.ExecuteReader();

        if (myread.Read() == true)
        {
            Session["IdU"] = slogin;
            Session["IDP"] = Convert.ToString(myread.GetValue(0));
            Enter_login.Visible = false;
            Enter_password.Visible = false;
            Text_login.Visible = false;
            Text_password.Visible = false;
            Error.Visible = false;
            Button_entry.Visible = false;
            Button_regestration.Visible = false;
            Button_exit.Visible = true;
            Data.Visible = true;
            ImageButton_profile.Visible = true;
            Data.Text = "Привет " + slogin + "!";
            if (slogin == "admin" && sparol=="admin")
                Bt_Admin.Visible = true;
        }
        else
        {
            Error.Visible = true;
            Error.Text = "Ошибка";
        }
        connect.Close();

    }

    // выход из системы
    protected void Exit(object sender, EventArgs e)
    {
        Session.Clear();
        Enter_login.Visible = true;
        Enter_password.Visible = true;
        Error.Visible = false;
        Data.Visible = false;
        Text_login.Visible = true;
        Text_password.Visible = true;
        Button_entry.Visible = true;
        Button_regestration.Visible = true;
        Button_exit.Visible = false;
        Response.Redirect("index.aspx");
    }

    protected void Page_admin(object sender, EventArgs e)
    {
        Response.Redirect("admin_page.aspx");
    }



}
