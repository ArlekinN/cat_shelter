using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_page_for_admin_event_admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Err_event.Visible = false;
    }
    // фильтр на мероприятия по дате
    protected void Filter_event(object sender, EventArgs e)
    {
        string crit;
        if (ListTimeStatus.SelectedValue == "0")
        {
            crit = "SELECT * FROM Q_event";
        }
        else
        {
            if (ListTimeStatus.SelectedValue == "1")
            {
                crit = "SELECT * FROM Q_event where NOW() > date_event";
            }
            else
            {
                crit = "SELECT * FROM Q_event where NOW() < date_event";
            }
        }
        DataEvent.SelectCommand = crit;
        TableEvent.DataBind();
    }

    // добавление нового мероприятия 
    protected void Add_event(object sender, EventArgs e)
    {
        string time_event = TextBox_time.Text + ":00";
        string crit = "INSERT INTO event(type_event, date_event, time_event, place, activity, idVolonteer) " +
                "VALUES (" + List_type.SelectedValue + ", '" + TextBox_date.Text + "', '" + time_event + "', " +
                "'"+ TextBox_place.Text + "', '" + TextBox_activ.Text+ "', "+ List_volon.SelectedValue+ ")";
        string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("/DataBaseCat.accdb");
        var connect = new OleDbConnection(connectionString);
        connect.Open();
        var mycom = new OleDbCommand();
        mycom.Connection = connect;
        mycom.CommandText = crit;
        mycom.ExecuteNonQuery();
        connect.Close();

        TableEvent.DataSourceID = "DataEvent";
        TableEvent.DataBind();

        TextBox_date.Text = "";
        TextBox_time.Text = "";
        TextBox_place.Text = "";
        TextBox_activ.Text = "";
    }

    // Обновление информации в мероприятии 
    protected void Change_event(object sender, EventArgs e)
    {
        long idevent = Convert.ToInt64(Session["IdE"]);
        if (idevent == 0)
        {
            Err_event.Visible = true;
        }
        else
        {
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + Server.MapPath("/DataBaseCat.accdb");
            var connect = new OleDbConnection(connectionString);
            connect.Open();
            var mycom = new OleDbCommand();
            mycom.Connection = connect;
            string sqlQ;
            if (TextBox_date_ch.Text != "")
            {
                sqlQ = "UPDATE event SET date_event='" + TextBox_date_ch.Text + "' where idEvent=" + idevent;
                mycom.CommandText = sqlQ;
                mycom.ExecuteNonQuery();
            }
            if (TextBox_time_ch.Text != "")
            {
                string event_time = TextBox_time_ch.Text + ":00";
                sqlQ = "UPDATE event SET time_event='" + event_time + "' where idEvent=" + idevent;
                mycom.CommandText = sqlQ;
                mycom.ExecuteNonQuery();
            }
            if (TextBox_place_ch.Text != "")
            {
                sqlQ = "UPDATE event SET place='" + TextBox_place_ch.Text + "' where idEvent=" + idevent;
                mycom.CommandText = sqlQ;
                mycom.ExecuteNonQuery();
            }
            if (List_volont.SelectedValue != "0")
            {
                sqlQ = "UPDATE event SET idVolonteer=" + List_volont.SelectedValue + " where idEvent=" + idevent;
                mycom.CommandText = sqlQ;
                mycom.ExecuteNonQuery();
            }
            connect.Close();
            Response.Redirect("admin_event.aspx");
        }
    }

    // Выбор мероприятия 
    protected void TableEvent_SelectedIndexChanged(object sender, EventArgs e)
    {
        int idrow = Convert.ToInt16(TableEvent.SelectedIndex);
        int idevent = Convert.ToInt16(TableEvent.Rows[idrow].Cells[1].Text.ToString());
        Session["IdE"] = idevent;
    }
}