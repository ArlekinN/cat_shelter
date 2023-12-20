using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_donate_page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label_donat_error.Visible = false;
        Session["IdC"] = 0;
        Session["IdE"] = 0;
    }

    protected void Send_donat(object sender, EventArgs e)
    {

        try
        {
            long iduser = Convert.ToInt64(Session["IDP"]);
            if (iduser == 0)
            {
                Label_donat_error.Text = "Необходимо войти в учетную запись";
                Label_donat_error.Visible = true;
            }
            else
            {
                int sum_donat = Convert.ToInt16(Text_sum_donat.Text);
                string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + Server.MapPath("/DataBaseCat.accdb");
                var connect = new OleDbConnection(connectionString);
                connect.Open();
                var mycom = new OleDbCommand();
                mycom.Connection = connect;
                string sqlQ;


                string curDate = DateTime.Now.ToString("yyyy-MM-dd");
                string curTime = DateTime.Now.ToString("hh:mm:ss");
                sqlQ = "INSERT INTO payment(idUser, sum_donat, date_pay, time_pay, idType_pay) " +
                    "VALUES (" + iduser + "," + sum_donat + ", '" + curDate + "', '" + curTime + "', 2)";
                mycom.CommandText = sqlQ;
                mycom.ExecuteNonQuery();
                connect.Close();

                Label_donat_error.Text = "Спасибо за пожертвование!!!";
                Label_donat_error.Visible = true;
            }
        }
        catch
        {
            Label_donat_error.Text = "Ошибка";
            Label_donat_error.Visible = true;
        }


    }
}