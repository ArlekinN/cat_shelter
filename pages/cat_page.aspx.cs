using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_cat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        Session["IdE"] = 0;
        Label_illnesses.Visible = false;
        Label_vaccination.Visible = false;
        Label_button_order_cat.Visible = false;

        int idcat = Convert.ToInt16(Session["IdC"]);
        string str_cat = "SELECT * FROM Q_cat where idCat=" + idcat;
        DataCat.SelectCommand = str_cat;
        TableCat.DataBind();
        Label_name.Text = TableCat.Rows[0].Cells[0].Text.ToString();
        Label_breed.Text = TableCat.Rows[0].Cells[2].Text.ToString();
        Label_sex.Text = TableCat.Rows[0].Cells[4].Text.ToString();
        Label_birth.Text = TableCat.Rows[0].Cells[3].Text.ToString();
        Label_reason.Text = TableCat.Rows[0].Cells[5].Text.ToString();

        string str_ill = "SELECT * FROM Q_medical_card where idCat=" + idcat;
        DataIllnesses.SelectCommand = str_ill;
        TableMedical_card.DataBind();
        if (TableMedical_card.Rows.Count == 0)
        {
            Label_illnesses.Visible = true;
            Label_illnesses.Text = "Нет болезней";
        }

        string str_vac = "SELECT * FROM Q_vaccination where idCat=" + idcat;
        DataVaccination.SelectCommand = str_vac;
        Tablevaccination.DataBind();
        if (Tablevaccination.Rows.Count == 0)
        {
            Label_vaccination.Visible = true;
            Label_vaccination.Text = "Нет прививок";
        }

        string str_photo = "SELECT * FROM photo where idCat =" + idcat;
        DataPhoto.SelectCommand = str_photo;
        TablePhoto.DataBind();
    }

    protected void Order_cat(object sender, EventArgs e)
    {
        long iduser = Convert.ToInt64(Session["IDP"]);
        if (iduser == 0)
        {
            Label_button_order_cat.Text = "Необходимо войти в учетную запись";
            Label_button_order_cat.Visible = true;
        }
        else
        {
            Response.Redirect("order_cat_page.aspx");
        }
    }
}