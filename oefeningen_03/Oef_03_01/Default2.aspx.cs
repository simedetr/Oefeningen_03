using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Session["_name"] as string))
        {
            // set title
            MasterPage mp = (MasterPage)Page.Master;
            mp.subTitle = "Controleer gegevens (Default2.aspx)";

            summary();
        }
        else
        {
            Response.Redirect("~/Default.aspx");
        }
    }

    private void summary()
    {
        var date = DateTime.Today.ToString("dd-MM-yyyy");

        //sessionvariabelen uitlezen
        lblPersoon.Text = "Op " + date + " heeft " + Session["_name"] + " volgende bestelling geplaatst:";

        //bulletedlist
        ListItemCollection collection = new ListItemCollection();
        ListItem lokaal = new ListItem(Session["_lokaal"].ToString());
        ListItem printer = new ListItem(Session["_printer"].ToString());

        ListItem toners = new ListItem(Session["_toners"].ToString());

        collection.Add(lokaal);
        collection.Add(printer);
        collection.Add(toners);

        bliInfo.DataSource = collection;
        bliInfo.DataBind();
    }

    protected void btnTerug_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }

    protected void btnVerder_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("~/Default.aspx");
    }
}