using System;
using System.Collections.Generic;
using System.Drawing.Drawing2D;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_admin_page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
   


    protected void To_admin_cat(object sender, EventArgs e)
    {
        Response.Redirect("admin_cat.aspx");

    }
    protected void To_admin_event(object sender, EventArgs e)
    {
        Response.Redirect("admin_event.aspx");
    }
    protected void To_admin_order(object sender, EventArgs e)
    {
        Response.Redirect("admin_order.aspx");
    }
}
