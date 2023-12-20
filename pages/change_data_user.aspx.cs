using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_Change_data_user : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["IdC"] = 0;
        Session["IdE"] = 0;
        long iduser = Convert.ToInt64(Session["IDP"]);

    }
    //Изменение данных пользователем
    protected void Change_data(object sender, EventArgs e)
    {
        long iduser = Convert.ToInt64(Session["IDP"]);
       
        string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + Server.MapPath("/DataBaseCat.accdb");
        var connect = new OleDbConnection(connectionString);
        connect.Open();
        var mycom = new OleDbCommand();
        mycom.Connection = connect;
        string sqlQ;
        if (TextBox_surname.Text != "")
        {
            sqlQ = "UPDATE all_user SET surname='" + TextBox_surname.Text + "' where idUser="+iduser;
            mycom.CommandText = sqlQ;
            mycom.ExecuteNonQuery();
        }
        if (TextBox_name.Text != "")
        {
            sqlQ = "UPDATE all_user SET name_user='" + TextBox_name.Text + "' where idUser=" + iduser;
            mycom.CommandText = sqlQ;
            mycom.ExecuteNonQuery();
        }
        if (TextBox_fatherland.Text != "")
        {
            sqlQ = "UPDATE all_user SET fatherland='" + TextBox_fatherland.Text + "' where idUser=" + iduser;
            mycom.CommandText = sqlQ;
            mycom.ExecuteNonQuery();
        }
        sqlQ = "UPDATE all_user SET sex='" + DropDownList_sex.Text + "' where idUser=" + iduser;
        mycom.CommandText = sqlQ;
        mycom.ExecuteNonQuery();
        if (TextBox_date_of_birth.Text != "")
        {
            sqlQ = "UPDATE all_user SET date_of_birth='" + TextBox_date_of_birth.Text + "' where idUser=" + iduser;
            mycom.CommandText = sqlQ;
            mycom.ExecuteNonQuery();
        }
        if (TextBox_mail.Text != "")
        {
            sqlQ = "UPDATE all_user SET mail='" + TextBox_mail.Text + "' where idUser=" + iduser;
            mycom.CommandText = sqlQ;
            mycom.ExecuteNonQuery();
        }
        if (TextBox_phone.Text != "")
        {
            sqlQ = "UPDATE all_user SET phone='" + TextBox_phone.Text + "' where idUser=" + iduser;
            mycom.CommandText = sqlQ;
            mycom.ExecuteNonQuery();
        }
        if (TextBox_login.Text != "")
        {
            sqlQ = "UPDATE all_user SET login='" + TextBox_login.Text + "' where idUser=" + iduser;
            mycom.CommandText = sqlQ;
            mycom.ExecuteNonQuery();
        }
        if (TextBox_password.Text != "")
        {
            sqlQ = "UPDATE all_user SET password='" + TextBox_password.Text + "' where idUser=" + iduser;
            mycom.CommandText = sqlQ;
            mycom.ExecuteNonQuery();
        }

        connect.Close();
        Response.Redirect("user_page.aspx");
    }


}