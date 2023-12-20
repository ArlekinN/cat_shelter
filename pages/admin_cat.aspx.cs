using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_page_for_admin_cat_admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Err_status_cat.Visible = false;
        Session["IdMC"] = 0;
        Err_about_new_ill.Visible = false;
        Mess_about_all_good_ill.Visible = false;
        Err_about_cat_vac.Visible = false;
        Label_good_vac.Visible = false;
    }
    // обновление таблицы по фильтрам 
    protected void Show_filter_cat(object sender, EventArgs e)
    { 
        // по породе
        string breed;
        if (List_breed.SelectedValue == "0")
        {
            breed = "";
        }
        else
        {
            breed = "where breed='" + Convert.ToString(List_breed.SelectedValue)+"'";
        }
        // по возрасту
        string age;
        if (List_age.SelectedValue == "0")
        {
            age = "";
        }
        else
        {
            if (breed == "")
            {
                age = "where ";
            }
            else
            {
                age = " and ";
            }
            if (List_age.SelectedValue == "1")
            {
                age += "(YEAR(NOW())-YEAR(date_of_birth)) < 1";
            }
            else
            {
                if (List_age.SelectedValue == "2")
                {
                    age += "(YEAR(NOW())-YEAR(date_of_birth)) between 1 and 3";
                }
                else
                {
                    age += "(YEAR(NOW())-YEAR(date_of_birth)) > 3";
                }
            }

        }
        // по полу
        string sex;
        if (List_sex.SelectedValue == "0")
        {
            sex = "";
        }
        else
        {
            if (breed == "" & age == "")
            {
                sex = "where ";
            }
            else
            {
                sex = " and ";
            }
            sex += "sex='" + List_sex.SelectedValue + "'";
        }
        // по статусу 
        string status;
        if (List_statusCat.SelectedValue == "0")
        {
            status = "";
        }
        else
        {
            if (breed == "" & age == "" & sex == "")
            {
                status = "where ";
            }
            else
            {
                status = " and ";
            }
            status += "status_cat='" + List_statusCat.SelectedValue + "'";
        }
        string crit;
        crit = "SELECT * FROM Q_cat_all " + breed + age + sex + status;
        DataCat.SelectCommand = crit;
        TableCat.DataBind();
    }
    // поиска кота по имени и вывод всей инфы о нем
    protected void Show_cat_name(object sender, EventArgs e)
    {
        string name_cat = TextBox_cat.Text;
        string crit;
        crit = "SELECT * FROM Q_cat_all where nickname='" + name_cat + "'";
        DataCat.SelectCommand = crit;
        TableCat.DataBind();

        crit = "SELECT * FROM Q_cat_photo where nickname='" + name_cat + "'";
        DataPhoto.SelectCommand = crit;
        TablePhoto.DataBind();

        crit = "SELECT * FROM Q_cat_medical_card where nickname='" + name_cat + "'";
        DataMedicalCard.SelectCommand = crit;
        TableIllnesses.DataBind();

        crit = "SELECT * FROM Q_cat_vaccination_card where nickname='" + name_cat + "'";
        Data_vaccination.SelectCommand = crit;
        TableVaccination.DataBind();
    }

    // вывод всей инфы о котах
    protected void Show_all_cat(object sender, EventArgs e)
    {
        string crit;
        crit = "SELECT * FROM Q_cat_all";
        DataCat.SelectCommand = crit;
        TableCat.DataBind();

        crit = "SELECT * FROM Q_cat_photo";
        DataPhoto.SelectCommand = crit;
        TablePhoto.DataBind();

        crit = "SELECT * FROM Q_cat_medical_card";
        DataMedicalCard.SelectCommand = crit;
        TableIllnesses.DataBind();

        crit = "SELECT * FROM Q_cat_vaccination_card";
        Data_vaccination.SelectCommand = crit;
        TableVaccination.DataBind();
        Session["idcat"] = 0;
        Session["name_cat"] = "";
    }

    // фильтр на таблицу с медицинской ифной по состоянию 
    protected void Filter_state_cat(object sender, EventArgs e)
    {
        string crit;
        if (List_state_cat.SelectedValue == "0")
        {
            crit = "SELECT * FROM Q_cat_medical_card";
        }
        else
        {
            crit = "SELECT * FROM Q_cat_medical_card where state_cat='" + List_state_cat.SelectedValue + "'";
        }
        DataMedicalCard.SelectCommand = crit;
        TableIllnesses.DataBind();
    }

    // изменение статуса кота
    protected void change_status_cat(object sender, EventArgs e)
    {
        string crit;
        long idcat = Convert.ToInt64(Session["idcat"]);
        if (idcat == 0)
            Err_status_cat.Visible = true;
        else
        {
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" +Server.MapPath("/DataBaseCat.accdb");
            var connect = new OleDbConnection(connectionString);
            connect.Open();
            var mycom = new OleDbCommand();
            mycom.Connection = connect;
            crit = "UPDATE cat set idStatus_cat=" + List_new_status_cat.Text + " where nickname='" + Convert.ToString(Session["name_cat"]) + "'";
            mycom.CommandText = crit;
            mycom.ExecuteNonQuery();
            connect.Close();
            crit = "Select * from Q_cat_all where nickname='" + Convert.ToString(Session["name_cat"]) + "'";
            DataCat.SelectCommand = crit;
            TableCat.DataBind();
        }
        
    }
   

    // выбор медицинской записи
    protected void TableIllnesses_SelectedIndexChanged(object sender, EventArgs e)
    {
        int idrow = Convert.ToInt16(TableIllnesses.SelectedIndex);
        int idcard = Convert.ToInt16(TableIllnesses.Rows[idrow].Cells[1].Text.ToString());
        Session["IdMC"] = idcard;
        Response.Redirect("change_medical_card.aspx");
    }

    // выбор кота из общей таблицы и сортировка всей инфы по коту
    protected void TableCat_SelectedIndexChanged(object sender, EventArgs e)
    {
        int idrow = Convert.ToInt16(TableCat.SelectedIndex);
        string namecat =TableCat.Rows[idrow].Cells[2].Text.ToString();
        Session["name_cat"] =TableCat.Rows[idrow].Cells[2].Text.ToString();
        Session["idcat"] = TableCat.Rows[idrow].Cells[1].Text.ToString();
        string crit;
        crit = "SELECT * FROM Q_cat_all where nickname='" + namecat + "'";
        DataCat.SelectCommand = crit;
        TableCat.DataBind();

        crit = "SELECT * FROM Q_cat_photo where nickname='" + namecat + "'";
        DataPhoto.SelectCommand = crit;
        TablePhoto.DataBind();

        crit = "SELECT * FROM Q_cat_medical_card where nickname='" + namecat + "'";
        DataMedicalCard.SelectCommand = crit;
        TableIllnesses.DataBind();

        crit = "SELECT * FROM Q_cat_vaccination_card where nickname='" + namecat + "'";
        Data_vaccination.SelectCommand = crit;
        TableVaccination.DataBind();
    }

    // Добавление болезни котику
    protected void Add_new_ill(object sender, EventArgs e)
    {
        long idcat = Convert.ToInt64(Session["idcat"]);
        if (idcat == 0)
        {
            Err_about_new_ill.Visible = true;
        }
        else
        {
            string crit = "INSERT INTO medical_card(idCat, idIllnesses, date_of_illnesses, vet_appoinment, idState_cat) " +
                "VALUES (" + idcat + ", " + List_ill.SelectedValue + ", '" + Convert.ToString(TextBox_date_ill.Text) + "', '" + TextBox_vet_app.Text + "', 2)";
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + Server.MapPath("/DataBaseCat.accdb");
            var connect = new OleDbConnection(connectionString);
            connect.Open();
            var mycom = new OleDbCommand();
            mycom.Connection = connect;
            mycom.CommandText = crit;
            mycom.ExecuteNonQuery();
            connect.Close();
            crit = "SELECT * FROM Q_cat_medical_card where nickname='" + Convert.ToString(Session["name_cat"]) + "'";
            DataMedicalCard.SelectCommand = crit;
            TableIllnesses.DataBind();
            TextBox_vet_app.Text = "";
            TextBox_date_ill.Text = "";
        }
        
    }

    // создание болезни
    protected void Create_ill(object sender, EventArgs e)
    {
        string crit = "INSERT INTO illnesses(illnesses) Values('" + TextBox_new_ill.Text + "')";
        string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + Server.MapPath("/DataBaseCat.accdb");
        var connect = new OleDbConnection(connectionString);
        connect.Open();
        var mycom = new OleDbCommand();
        mycom.Connection = connect;
        mycom.CommandText = crit;
        mycom.ExecuteNonQuery();
        connect.Close();
        Mess_about_all_good_ill.Visible = true;
        TextBox_new_ill.Text = " ";
    }

    // добавление прививки котику
    protected void Add_new_vac(object sender, EventArgs e)
    {
        long idcat = Convert.ToInt64(Session["idcat"]);
        if (idcat == 0)
        {
            Err_about_cat_vac.Visible = true;
        }
        else
        {
            if (TextBox_date_vac.Text != ""){
                string crit = "INSERT INTO vaccination_card(idCat, idVaccination, date_vaccination) " +
                "VALUES (" + idcat + ", " + List_vac.SelectedValue + ", '" + Convert.ToString(TextBox_date_vac.Text) + "')";
                string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath("/DataBaseCat.accdb");
                var connect = new OleDbConnection(connectionString);
                connect.Open();
                var mycom = new OleDbCommand();
                mycom.Connection = connect;
                mycom.CommandText = crit;
                mycom.ExecuteNonQuery();
                connect.Close();
                crit = "SELECT * FROM Q_cat_vaccination_card where nickname='" + Convert.ToString(Session["name_cat"]) + "'";
                Data_vaccination.SelectCommand = crit;
                TableVaccination.DataBind();
                TextBox_date_vac.Text = "";
            }   
        }
    }

    // создание прививки котику
    protected void Create_vac(object sender, EventArgs e)
    {
        string crit = "INSERT INTO vaccination(vaccination) Values('" + TextBox_new_vac.Text + "')";
        string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0; Data Source=" + Server.MapPath("/DataBaseCat.accdb");
        var connect = new OleDbConnection(connectionString);
        connect.Open();
        var mycom = new OleDbCommand();
        mycom.Connection = connect;
        mycom.CommandText = crit;
        mycom.ExecuteNonQuery();
        connect.Close();
        Label_good_vac.Visible = true;
        TextBox_new_vac.Text = " ";
    }
}