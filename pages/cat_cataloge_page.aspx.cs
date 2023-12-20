using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_cat_cataloge : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["IdC"] = 0;
        Session["IdE"] = 0;
    }
    protected void Show_filter_cat(object sender, EventArgs e)
    {
        string breed;
        if (ListBreed.SelectedValue == "0")
        {
            breed = "";
        }
        else
        {
            breed = "where breed='" + ListBreed.SelectedValue+"'";
        }
        string age;
        if (ListAge.SelectedValue == "0")
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
            if (ListAge.SelectedValue == "1")
            {
                age += "(YEAR(NOW())-YEAR(date_of_birth)) < 1";
            }
            else
            {
                if (ListAge.SelectedValue == "2")
                {
                    age += "(YEAR(NOW())-YEAR(date_of_birth)) between 1 and 3";
                }
                else
                {
                    age += "(YEAR(NOW())-YEAR(date_of_birth)) > 3";
                }
            }

        }
        string sex;
        if (ListSex.SelectedValue == "0")
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
            sex += "sex='" + ListSex.SelectedValue + "'";
        }
        string crit;
        crit = "SELECT * FROM Q_cat " + breed + age + sex;
        DataBaseCat.SelectCommand = crit;
        TableCat.DataBind();
    }

    protected void Show_cat_name(object sender, EventArgs e)
    {
        string name_cat = TextBox_name_cat.Text;
        string crit;
        crit = "SELECT * FROM Q_cat where nickname='" + name_cat + "'";
        DataBaseCat.SelectCommand = crit;
        TableCat.DataBind();
    }
    protected void Show_all_cat(object sender, EventArgs e)
    {
        string crit;
        crit = "SELECT * FROM Q_cat";
        DataBaseCat.SelectCommand = crit;
        TableCat.DataBind();
    }

    protected void TableCat_SelectedIndexChanged(object sender, EventArgs e)
    {
        int idrow = Convert.ToInt16(TableCat.SelectedIndex);
        int idcat = Convert.ToInt16(TableCat.Rows[idrow].Cells[1].Text.ToString());
        Session["IdC"] = idcat;
        Response.Redirect("cat_page.aspx");
        
    }
}