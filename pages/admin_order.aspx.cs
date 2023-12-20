using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_page_for_admin_order_admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Err_bid_show.Visible = false;
        Label_err_status.Visible = false;
        Err_bid_event.Visible = false;
    }

    // фильтры по заявкам на кота по типу и статусу
    protected void Show_filter(object sender, EventArgs e)
    {
        string crit;
        crit = "SELECT * FROM Q_cat_bid";
        if (ListType.SelectedValue != "0")
        {
            crit += " where type='" + ListType.SelectedItem + "'";
        }
        if (ListStatus.SelectedValue != "0")
        {
            if (ListType.SelectedValue != "0")
                crit += " and status_bid='" + ListStatus.SelectedItem +"'";
            else
                crit += "where status_bid='" + ListStatus.SelectedItem + "'";
        }
        DataBidCat.SelectCommand = crit;
        TableCatBid.DataBind();
    }

    // показать все заявки
    protected void Show_all(object sender, EventArgs e)
    {
        string crit;
        crit = "SELECT * FROM Q_cat_bid";
        DataBidCat.SelectCommand = crit;
        TableCatBid.DataBind();
    }

    // выбор заявки на кота
    protected void TableCatBid_SelectedIndexChanged(object sender, EventArgs e)
    {
        int idrow = Convert.ToInt16(TableCatBid.SelectedIndex);
        Session["IdUserBid"] = Convert.ToInt16(TableCatBid.Rows[idrow].Cells[2].Text.ToString());
        Session["IdBid"] = Convert.ToInt16(TableCatBid.Rows[idrow].Cells[1].Text.ToString());
    }

    // показать информацию о пользователе из заявки
    protected void Show_people(object sender, EventArgs e)
    {
        long iduser = Convert.ToInt64(Session["IdUserBid"]);
        if (iduser == 0)
        {
            Err_bid_show.Visible = true;
        }
        else
        {
            string crit = "Select * from all_user where idUser=" + iduser;
            DataUser.SelectCommand = crit;
            TableUser.DataBind();
            TableUser.Visible = true;
        }
    }

    // скрыть информацию о пользователе 
    protected void Not_show_people(object sender, EventArgs e)
    {
        TableUser.Visible = false;
    }

    // изменить статус заявки и указать причину отказа 
    protected void ChangeStatus(object sender, EventArgs e)
    {
        long iduser = Convert.ToInt64(Session["IdUserBid"]);
        if (iduser == 0)
        {
            Label_err_status.Visible = true;
        }
        else
        {
            long idbid = Convert.ToInt64(Session["IdBid"]);
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + Server.MapPath("/DataBaseCat.accdb");
            var connect = new OleDbConnection(connectionString);
            connect.Open();
            var mycom = new OleDbCommand();
            mycom.Connection = connect;
            string crit = "UPDATE bid_cat set idStatus_bid=" + List_ch_status.SelectedValue + " where idBid=" + idbid;
            mycom.CommandText = crit;
            mycom.ExecuteNonQuery();
            if (List_ch_status.SelectedValue == "3")
            {
                if (TextBox_reason.Text != "")
                {
                    crit = "UPDATE bid_cat set reason='" + TextBox_reason.Text + "' where idBid=" + idbid;
                    mycom.CommandText = crit;
                    mycom.ExecuteNonQuery();
                }
            }
            connect.Close();
            TableCatBid.DataSourceID = "DataBidCat";
            TableCatBid.DataBind();
            Session["IdUserBid"] = 0;
        }
    }

    // выбор заявки на мероприятие
    protected void TableEvent_SelectedIndexChanged(object sender, EventArgs e)
    {
        int idrow = Convert.ToInt16(TableEvent.SelectedIndex);
        Session["IdEventBid"] = Convert.ToInt16(TableEvent.Rows[idrow].Cells[1].Text.ToString());
    }
    // фильтр на заявки на мероприятие по статусу
    protected void Show_event_bid(object sender, EventArgs e)
    {
        string crit = "Select * from Q_admin_event where status_bid='" + List_status_bid_event.SelectedItem+"'";
        DataEvent.SelectCommand = crit;
        TableEvent.DataBind();
    }
    // отобрадение всех мероприятий
    protected void Not_show_event_bid(object sender, EventArgs e)
    {
        string crit = "Select * from Q_admin_event";
        DataEvent.SelectCommand = crit;
        TableEvent.DataBind();
    }

    // изменение статуса заявки мероприятия
    protected void Change_bid_event(object sender, EventArgs e)
    {
        long idevent = Convert.ToInt64(Session["IdEventBid"]);
        if (idevent == 0)
        {
            Err_bid_event.Visible = true;
        }
        else
        {
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + Server.MapPath("/DataBaseCat.accdb");
            var connect = new OleDbConnection(connectionString);
            connect.Open();
            var mycom = new OleDbCommand();
            mycom.Connection = connect;
            string crit = "UPDATE bid_to_event set idStatus_bid=" + List_ch_status_ev.SelectedValue + " where idBid=" + idevent;
            mycom.CommandText = crit;
            mycom.ExecuteNonQuery();
            connect.Close();
            TableEvent.DataSourceID = "DataEvent";
            TableEvent.DataBind();
            Session["IdEventBid"] = 0;
        }
    }
}