using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Drawing;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_user_page : System.Web.UI.Page
{
    // отображение данных о пользователе
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["IdC"] = 0;
        Session["IdE"] = 0;
        long iduser = Convert.ToInt64(Session["IDP"]);
        string str_user = "SELECT * FROM all_user where idUser=" + iduser;
        user.SelectCommand = str_user;
        TableUser.DataBind();


        Label_surname.Text = TableUser.Rows[0].Cells[1].Text.ToString();
        Label_name.Text = TableUser.Rows[0].Cells[2].Text.ToString();
        Label_father.Text = TableUser.Rows[0].Cells[3].Text.ToString();
        Label_sex.Text = TableUser.Rows[0].Cells[4].Text.ToString();
        Label_date_birth.Text = TableUser.Rows[0].Cells[5].Text.ToString();
        Label_mail.Text = TableUser.Rows[0].Cells[6].Text.ToString();
        Label_phone.Text = TableUser.Rows[0].Cells[7].Text.ToString();
        Label_login.Text = TableUser.Rows[0].Cells[8].Text.ToString();
        Label_password.Text = TableUser.Rows[0].Cells[9].Text.ToString();

        Label_payment_user.Visible = false;
        Label_cat_bid.Visible = false;
        Label_event_bid.Visible = false;

        string str_pay;
        str_pay = "SELECT * FROM Q_payment where idUser=" + iduser;
        payment.SelectCommand = str_pay;
        TablePayment.DataBind();

        int amount_rows = TablePayment.Rows.Count;
        if (amount_rows == 0)
            Label_payment_user.Visible = true;

        string str_bid_cat;
        str_bid_cat = "SELECT * FROM Q_cat_bid where idUser=" + iduser;
        bid_cat.SelectCommand = str_bid_cat;
        TableBidCat.DataBind();

        amount_rows = TableBidCat.Rows.Count;
        if (amount_rows == 0)
            Label_cat_bid.Visible = true;

        string str_bid_event;
        str_bid_event = "SELECT * FROM Q_event_bid where idUser=" + iduser;
        bid_event.SelectCommand = str_bid_event;
        TableBidEvent.DataBind();

        amount_rows = TableBidEvent.Rows.Count;
        if (amount_rows == 0)
            Label_event_bid.Visible = true;
    }
    protected void Change_data_user(object sender, EventArgs e)
    {
        Response.Redirect("change_data_user.aspx");
    }


}