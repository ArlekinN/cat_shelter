using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_order_cat_page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        Session["IdE"] = 0;
        Label_button_order_cat.Visible = false;
        int idcat = Convert.ToInt16(Session["IdC"]);
        long iduser = Convert.ToInt64(Session["IDP"]);

        string str_user = "SELECT * FROM all_user where idUser=" + iduser;
        DataUser.SelectCommand = str_user;
        TableUser.DataBind();

        Label_surname.Text = TableUser.Rows[0].Cells[1].Text.ToString();
        Label_name.Text = TableUser.Rows[0].Cells[2].Text.ToString();
        Label_father.Text = TableUser.Rows[0].Cells[3].Text.ToString();

        string str_cat = "SELECT * FROM cat where idCat=" + idcat;
        DataCat.SelectCommand = str_cat;
        TableCat.DataBind();

        Label_cat.Text = TableCat.Rows[0].Cells[1].Text.ToString();
    }

    // отправка заявки на кота в семью
    protected void Order_cat(object sender, EventArgs e)
    {
        long iduser = Convert.ToInt64(Session["IDP"]);
        int idcat = Convert.ToInt16(Session["IdC"]);
        string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + Server.MapPath("/DataBaseCat.accdb");
        var connect = new OleDbConnection(connectionString);
        connect.Open();
        var mycom = new OleDbCommand();
        mycom.Connection = connect;
        string sqlQ;
        // проверка на то, что такой заявки еще нет от пользователя
        sqlQ = "SELECT * FROM bid_cat where idCat=" + idcat + " and idUser=" + iduser;
        DataOrderCat.SelectCommand = sqlQ;
        TableOrderCat.DataBind();
        if (TableOrderCat.Rows.Count == 0)
        {
            string curDate = DateTime.Now.ToString("yyyy-MM-dd");

            sqlQ = "INSERT INTO bid_cat(idUser, idCat, idStatus_bid, idType_bid, date_bid) " +
                "VALUES (" + iduser + ", " + idcat + ", 3, 2, '" + curDate + "')";
            mycom.CommandText = sqlQ;
            mycom.ExecuteNonQuery();
            connect.Close();

            Label_button_order_cat.Text = "Заявка подана";
            Label_button_order_cat.Visible = true;
        }
        else
        {
            Label_button_order_cat.Text = "Такая заявка уже есть";
            Label_button_order_cat.Visible = true;
        }
    }
}