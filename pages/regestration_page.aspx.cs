using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_regestration_page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["IdC"] = 0;
        Session["IdE"] = 0;
    }
    // регистрация пользователя
    protected void regestration(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("/DataBaseCat.accdb");
                var connect = new OleDbConnection(connectionString);
                connect.Open();
                string ssurname, sname, sfather, ssex, sbirth, smail, sphone, slogin, spassword;
                ssurname = Convert.ToString(TextBox_surname.Text);
                sname = Convert.ToString(TextBox_name.Text);
                sfather = Convert.ToString(TextBox_father.Text);
                ssex = List_sex.SelectedValue;
                sbirth = Convert.ToString(TextBox_date_birth.Text);
                smail = Convert.ToString(TextBox_mail.Text);
                sphone = Convert.ToString(TextBox_phone.Text);
                slogin = Convert.ToString(TextBox_login.Text);
                spassword = Convert.ToString(TextBox_password.Text);
                var mycom = new OleDbCommand();
                mycom.Connection = connect;
                string sqlQ;
                sqlQ = "INSERT INTO all_user(surname, name_user, fatherland, sex, date_of_birth, mail, phone, login, [password]) " +
                    "VALUES ('" + ssurname + "', '" + sname + "', '" + sfather + "', '" + ssex + "', '" + sbirth + "', '" +
                    smail + "', '" + sphone + "', '" + slogin + "', '" + spassword + "')";
                mycom.CommandText = sqlQ;
                mycom.ExecuteNonQuery();
                connect.Close();
                Error_regectration.Text = "Регистрация прошла успешно";
            }
            catch
            {
                Error_regectration.Text = "Ошибка";
            }  
        }
    }
}