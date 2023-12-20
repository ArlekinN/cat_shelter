using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_rules_cat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label_shelter.Visible = false;
        Session["IdC"] = 0;
        Session["IdE"] = 0;

    }
    protected void in_shelter(object sender, EventArgs e)
    {
        long iduser = Convert.ToInt64(Session["IDP"]);
        if (iduser == 0)
        {
            Label_shelter.Text = "Необходимо войти в учетную запись";
            Label_shelter.Visible = true;
        }
        else
        {
            Response.Redirect("order_cat_in_shelter_page.aspx");
        }
    }
}