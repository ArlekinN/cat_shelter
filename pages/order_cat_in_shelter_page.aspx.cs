using System;
using System.Activities.Debugger;
using System.Activities.Statements;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Drawing;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_order_cat_in_shelter_page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label_craete_cat.Visible = false;
        Label_message_order_in_shelter.Visible = false;
        Label_error_ill.Visible = false;
        Label_error_vaccin.Visible = false;
        Label_message_ok_cat.Visible = false;
        
    }

    // создание записи о котике в бд
    protected void Create_cat(object sender, EventArgs e)
    {
        string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + Server.MapPath("/DataBaseCat.accdb");
        var connect = new OleDbConnection(connectionString);
        connect.Open();
        string name_cat, breed, sex, birth, reason;
        int idbreed;
        name_cat = Convert.ToString(TextBox_cat_name.Text);
        var mycom = new OleDbCommand();
        mycom.Connection = connect;
        
        if (ListBreed.SelectedValue == "0")
        {
            // выбор породы из поля
            breed = TextBox_breed.Text;
            string newbreed = "Insert into breed(breed) values('" + breed + "')";
            mycom.CommandText = newbreed;
            mycom.ExecuteNonQuery();
            connect.Close();
            // обновление таблицы
            TableBreed.DataSourceID = "all_breed";
            TableBreed.DataBind();
            connectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + Server.MapPath("/DataBaseCat.accdb");
            connect = new OleDbConnection(connectionString);
            connect.Open();
            mycom = new OleDbCommand();
            mycom.Connection = connect;

        }
        else
        {
            // выбор породы из списка
            breed = ListBreed.SelectedValue;
        }
        

        string sql_breed = "SELECT * from breed where breed='" + breed + "'";
        all_breed.SelectCommand = sql_breed;
        TableBreed.DataBind();
        idbreed = Convert.ToInt16(TableBreed.Rows[0].Cells[0].Text.ToString());
        sex = ListSex.SelectedValue;
        birth = TextBox_birth.Text;
        reason = Convert.ToString(TextBox_reason.Text);

        // добавление котика в БД
        string sqlQ;
        sqlQ = "INSERT INTO cat(nickname, idBreed, sex, date_of_birth, reason, idStatus_cat) " +
            "VALUES ('" + name_cat + "', " + idbreed + ", '" + sex + "', '" + birth + "', '" + reason + "', 5)";
        mycom.CommandText = sqlQ;
        mycom.ExecuteNonQuery();
        connect.Close();
        Label_craete_cat.Text = "Котик зарегестрирован";


        TableCat.DataSourceID = "DataCat";
        TableCat.DataBind();

        Label_craete_cat.Visible = true;
        Session["IdC"] = Convert.ToInt16(TableCat.Rows[TableCat.Rows.Count-1].Cells[0].Text.ToString());
        
    }

    // отправление заявки
    protected void Send_order(object sender, EventArgs e)
    {
        int idcat = Convert.ToInt16(Session["IdC"]);
        if (idcat == 0)
        {
            Label_message_order_in_shelter.Text = "Сначала внесите информацию о котике";
            Label_message_order_in_shelter.Visible = true;
        }
        else
        {
            long iduser = Convert.ToInt64(Session["IDP"]);

            // подключение
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + Server.MapPath("/DataBaseCat.accdb");
            var connect = new OleDbConnection(connectionString);
            connect.Open();
            var mycom = new OleDbCommand();
            mycom.Connection = connect;
            string curDate = DateTime.Now.ToString("yyyy-MM-dd");
            string sqlQ;
            sqlQ = "INSERT INTO bid_cat(idUser, idCat, idStatus_bid, idType_bid, date_bid) " +
                "VALUES (" + iduser + ", " + idcat + ", 3, 1, '" + curDate + "')";
            mycom.CommandText = sqlQ;
            mycom.ExecuteNonQuery();
            connect.Close();
            Label_message_ok_cat.Visible = true;
        }
        
    }

    // добавление в бд болезней котика
    protected void Add_illnesses(object sender, EventArgs e)
    {
        int idcat = Convert.ToInt16(Session["IdC"]);
        if (idcat == 0)
        {
            Label_error_ill.Visible = true;
        }
        else
        {
            // подключение
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + Server.MapPath("/DataBaseCat.accdb");
            var connect = new OleDbConnection(connectionString);
            connect.Open();
            int idill, idstate_cat;
            string ill,  date_ill, vet_app, date_rec, state_cat;
            var mycom = new OleDbCommand();
            mycom.Connection = connect;
            // осоздание новой болезни
            if (ListIllnesses.SelectedValue == "0")
            {
                // добавление болезни в бд
                ill = TextBox_illnesses.Text;
                string newill = "INSERT INTO illnesses(illnesses) VALUES ('" + ill + "')";
                mycom.CommandText = newill;
                mycom.ExecuteNonQuery();
                connect.Close();

                illnesses.DataSourceID = "illness";
                illnesses.DataBind();

                connectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + Server.MapPath("/DataBaseCat.accdb");
                connect = new OleDbConnection(connectionString);
                connect.Open();
                mycom = new OleDbCommand();
                mycom.Connection = connect;

            }
            else
            {
                // выбор болезни из списка
                ill= ListIllnesses.SelectedValue;
            }

            
            // поиск id этой болезни
            string sql_ill = "SELECT * from illnesses where illnesses='" + ill + "'";
            illness.SelectCommand = sql_ill;
            illnesses.DataBind();
            idill = Convert.ToInt16(illnesses.Rows[0].Cells[0].Text.ToString());
            // получение всех полей
            date_ill = TextBox_date_ill.Text;
            vet_app = TextBox_vet_app.Text;
            date_rec = TextBox_date_rec.Text;
            state_cat = ListStateCat.SelectedValue;
            string sql_state = "SELECT * from state_cat where state_cat='" + state_cat + "'";
            Sqlstatecat.SelectCommand = sql_state;
            TableSateCat.DataBind();
            idstate_cat = Convert.ToInt16(TableSateCat.Rows[0].Cells[0].Text.ToString());
            // добавление записи о болезни котика в БД
            string sqlQ;
            if (date_rec != "")
            {
                sqlQ = "INSERT INTO medical_card(idCat, idIllnesses, date_of_illnesses, vet_appoinment, date_of_recovery, idState_cat) " +
                "VALUES (" + idcat + ", " + idill + ", '" + date_ill + "', '" + vet_app + "', '" + date_rec + "', " + idstate_cat + ")";
            }
            else
            {
                sqlQ = "INSERT INTO medical_card(idCat, idIllnesses, date_of_illnesses, vet_appoinment, idState_cat) " +
                "VALUES (" + idcat + ", " + idill + ", '" + date_ill + "', '" + vet_app + "', " + idstate_cat + ")";
            }

            mycom.CommandText = sqlQ;
            mycom.ExecuteNonQuery();
            connect.Close();

            // отображение добавленных записей
            string sql_illnesses_new_cat = "SELECT * from medical_card where idCat=" + idcat;
            DataMedicalCard.SelectCommand = sql_illnesses_new_cat;
            Table_illnesses.DataBind();
            Table_illnesses.Visible = true;

            // обнуление полей
            TextBox_illnesses.Text = "";
            TextBox_date_ill.Text = "";
            TextBox_vet_app.Text = "";
            TextBox_date_rec.Text = "";
            ListIllnesses.SelectedIndex= 0;
            ListStateCat.SelectedIndex = 0;

        }
    }

    // Добавление прививок котику
    protected void Add_vaccination(object sender, EventArgs e)
    {
        int idcat = Convert.ToInt16(Session["IdC"]);
        if (idcat == 0)
        {
            Label_error_vaccin.Visible = true;
        }
        else
        {
            // подключение
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + Server.MapPath("/DataBaseCat.accdb");
            var connect = new OleDbConnection(connectionString);
            connect.Open();
            int idvac;
            string vac, date_vac;
            var mycom = new OleDbCommand();
            mycom.Connection = connect;
            // осоздание новой прививки
            if (List_vaccination.SelectedValue == "0")
            {
                // добавление прививки в бд
                vac = Convert.ToString(TextBox_input_vaccin.Text);
                string new_vac = "INSERT INTO vaccination(vaccination) VALUES ('" + vac + "')";
                mycom.CommandText = new_vac;
                mycom.ExecuteNonQuery();
                connect.Close();

                TableVaccination.DataSourceID = "DataVaccination";
                TableVaccination.DataBind();
                connectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + Server.MapPath("/DataBaseCat.accdb");
                connect = new OleDbConnection(connectionString);
                connect.Open();
                mycom = new OleDbCommand();
                mycom.Connection = connect;
            }
            else
            {
                // выбор вакцины из списка
                vac = List_vaccination.SelectedValue;
            }
            // поиск id этой прививки
            string sql_vac = "SELECT * from vaccination where vaccination='" + vac + "'";
            DataVaccination.SelectCommand = sql_vac;
            TableVaccination.DataBind();
            idvac = Convert.ToInt16(TableVaccination.Rows[0].Cells[0].Text.ToString());

            date_vac = TextBox_date_vaccin.Text;

            string sqlQ;
            sqlQ = "INSERT INTO vaccination_card(idCat, idVaccination, date_vaccination) " +
                "VALUES (" + idcat + ", " + idvac + ", '" + date_vac + "')";

            mycom.CommandText = sqlQ;
            mycom.ExecuteNonQuery();
            connect.Close();

            // отображение добавленных записей
            string sql_vaccin_new_cat = "SELECT * from vaccination_card where idCat=" + idcat;
            DataVaccinationCard.SelectCommand = sql_vaccin_new_cat;
            Table_vaccination_card.DataBind();
            Table_vaccination_card.Visible = true;
            

            // обнуление полей
            TextBox_date_vaccin.Text = "";
            TextBox_input_vaccin.Text = "";
            List_vaccination.SelectedIndex = 0;
        }
    }


}