using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pages_event_page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label_error_order_event.Visible = false;
        Session["IdC"] = 0;

    }
    protected void Order_event(object s, EventArgs e)
    {
        long iduser = Convert.ToInt64(Session["IDP"]);
        int idevent = Convert.ToInt16(Session["IdE"]);
        if (iduser == 0)
        {
            Label_error_order_event.Text = "Необходимо войти в учетную запись";
            Label_error_order_event.Visible = true;
        }   
        else
        {
            if(idevent == 0)
            {
                Label_error_order_event.Text = "Необходимо выбрать мероприятие";
                Label_error_order_event.Visible = true;
            }
            else
            {
                Response.Redirect("order_event.aspx");
            }              
        }
    }



    protected void TableEvent_SelectedIndexChanged(object sender, EventArgs e)
    {
        for (int i=0; i<TableEvent.Rows.Count; i++)
            TableEvent.Rows[i].BackColor = System.Drawing.Color.White;
        int idrow = Convert.ToInt16(TableEvent.SelectedIndex);
        TableEvent.Rows[idrow].BackColor = System.Drawing.Color.LightGreen;
        int idevent = Convert.ToInt16(TableEvent.Rows[idrow].Cells[1].Text.ToString());
        Session["IdE"] = idevent;

    }


}