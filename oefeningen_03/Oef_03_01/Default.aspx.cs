using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // set title
        MasterPage mp = (MasterPage)Page.Master;
        mp.subTitle = "Invoer gegevens (Default.aspx)";

        //Session.Abandon();

        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Session["_name"] as string))
            {
                tbxAanvrager.Text = Session["_name"].ToString();
                ddlLokaal.SelectedItem.Text = Session["_lokaal"].ToString();
                ddlPrinter.SelectedItem.Text = Session["_printer"].ToString();
                //cbxToners.SelectedValue = Session["_toners"].ToString();
            }
            else
            {
                Reset();
            }
        }
    }
    
    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            //session variabelen instellen
            string name = tbxAanvrager.Text;
            string lokaal = ddlLokaal.SelectedItem.Text;
            string printer = ddlPrinter.SelectedItem.Text;

            //checkboxen uitlezen
            /*List<ListItem> selected = new List<ListItem>();
            foreach (ListItem item in cbxToners.Items)
                if (item.Selected) selected.Add(item);*/

            string values = "";

            // We perform a for loop to check if each checkbox is selected then we get the value
            foreach (ListItem objItem in cbxToners.Items)
            {
                if (objItem.Selected)
                {
                    values += objItem.Text + "\r\n";
                }
            }

            //ListItem[] cartridges = selected.ToArray();

            Session["_toners"] = values;
            //waarden verzamelen in een session
            Session["_name"] = name;
            Session["_lokaal"] = lokaal;
            Session["_printer"] = printer;

            Response.Redirect("~/Default2.aspx");
        }
    }

    private void Reset()
    {
        tbxAanvrager.Text = "";
        ddlLokaal.SelectedIndex = -1;
        ddlPrinter.SelectedIndex = -1;

        Session.Abandon();
    }

    protected void ddlLokaal_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlPrinter.SelectedIndex = -1;
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (cbxToners.SelectedIndex != -1)
        {
            args.IsValid = true;
        }
        else
        {
            args.IsValid = false;
        }
    }
}