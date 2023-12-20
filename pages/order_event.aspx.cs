using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_order_event : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label_result_order_event.Visible = false;
        long iduser = Convert.ToInt64(Session["IDP"]);
        string str_user = "SELECT * FROM all_user where idUser=" + iduser;
        user.SelectCommand = str_user;
        TableUser.DataBind();

        Label_surname.Text = TableUser.Rows[0].Cells[1].Text.ToString();
        Label_name.Text = TableUser.Rows[0].Cells[2].Text.ToString();
        Label_father.Text = TableUser.Rows[0].Cells[3].Text.ToString();

        int idevent = Convert.ToInt16(Session["IdE"]);
        string str_event = "SELECT * FROM Q_event where idEvent=" + idevent;
        this_event.SelectCommand = str_event;
        TableEvent.DataBind();

        Label_event.Text = TableEvent.Rows[0].Cells[1].Text.ToString();
        Label_data.Text = TableEvent.Rows[0].Cells[2].Text.ToString();
        Label_time.Text = TableEvent.Rows[0].Cells[3].Text.ToString();
        Label_place.Text = TableEvent.Rows[0].Cells[4].Text.ToString();
    }

    // отправка заявки на мероприятие 
    protected void Order_event(object sender, EventArgs e)
    {
        try
        {
            long iduser = Convert.ToInt64(Session["IDP"]);
            int idevent = Convert.ToInt16(Session["IdE"]);
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + Server.MapPath("/DataBaseCat.accdb");
            var connect = new OleDbConnection(connectionString);
            connect.Open();
            var mycom = new OleDbCommand();
            mycom.Connection = connect;
            string sqlQ;
            // проверка на повторения заявки
            sqlQ = "SELECT * FROM bid_to_event where idEvent=" + idevent + " and idUser=" + iduser;
            bid_event.SelectCommand = sqlQ;
            TableBid_event.DataBind();
            if (TableBid_event.Rows.Count == 0)
            {
                string curDate = DateTime.Now.ToString("yyyy-MM-dd");

                sqlQ = "INSERT INTO bid_to_event(idUser, idEvent, idStatus_bid, date_bid) " +
                    "VALUES (" + iduser + ", " + idevent + ", 3, '" + curDate + "')";
                mycom.CommandText = sqlQ;
                mycom.ExecuteNonQuery();
                connect.Close();

                Label_result_order_event.Text = "Заявка подана";
                Label_result_order_event.Visible = true;
            }
            else
            {
                Label_result_order_event.Text = "Такая заявка уже есть";
                Label_result_order_event.Visible = true;
            }
        }
        catch
        {
            Label_result_order_event.Text = "Ошибка";
            Label_result_order_event.Visible = true;
        }

    }
}