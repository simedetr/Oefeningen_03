using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCopyPrinters_Click(object sender, EventArgs e)
    {
        //select gedeelte
        SqlConnection conn = null;
        SqlConnection conn2 = null;

        try
        {
            string connString =
                ConfigurationManager.ConnectionStrings["RandapparatuurConnectionString"].ToString();

            conn = new SqlConnection(connString);

            string sql = "SELECT Printer_id, Merk, Model, Lokaal_id, Kleur, Technologie, Resolutie, Serienummer FROM Printers";

            SqlCommand cmd = new SqlCommand(sql, conn);

            conn.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            //conn.Close();

            string connString2 =
                ConfigurationManager.ConnectionStrings["BackupConnectionString"].ToString();

            conn2 = new SqlConnection(connString2);

            string sql2 = "INSERT INTO Printers(Printer_id, Merk, Model, Lokaal_id, Kleur, Technologie, Resolutie, Serienummer)" +
                "VALUES(@Printer_id, @Merk, @Model, @Lokaal_id, @Kleur, @Technologie, @Resolutie, @Serienummer)";

            SqlCommand cmd2 = new SqlCommand(sql2, conn2);

            /*cmd2.Parameters.Add("@Printer_id", reader.GetValues(0));
            cmd2.Parameters.AddWithValue("@Merk", reader);
            cmd2.Parameters.AddWithValue("@Model", reader);
            cmd2.Parameters.AddWithValue("@Lokaal_id", reader);
            cmd2.Parameters.AddWithValue("@Kleur", reader);
            cmd2.Parameters.AddWithValue("@Technologie", reader);
            cmd2.Parameters.AddWithValue("@Resolutie", reader);
            cmd2.Parameters.AddWithValue("@Serienummer", reader);*/

            
            conn2.Open();
            cmd2.ExecuteNonQuery();
        }
        catch( Exception ex)
        {
            lblError.Text = "error: " + ex.Message;
        }
        finally
        {
            if (conn != null)
                conn.Close();
        }
    }

    protected void btnDelPrinters_Click(object sender, EventArgs e)
    {
        SqlConnection conn = null;

        try
        {
            string connString = ConfigurationManager.ConnectionStrings["BackupConnectionString"].ToString();
            conn = new SqlConnection(connString);

            string sql =
                "DELETE FROM Printers";

            SqlCommand cmd = new SqlCommand(sql, conn);

            conn.Open();
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            lblError.Text = "error: " + ex.Message;
        }
        finally
        {
            if (conn != null)
                conn.Close();
        }
    }

    protected void btnCopyLokaal_Click(object sender, EventArgs e)
    {

    }

    protected void btnDelLokaal_Click(object sender, EventArgs e)
    {
        SqlConnection conn = null;

        try
        {
            string connString = ConfigurationManager.ConnectionStrings["BackupConnectionString"].ToString();
            conn = new SqlConnection(connString);

            string sql =
                "DELETE FROM Lokalen";

            SqlCommand cmd = new SqlCommand(sql, conn);

            conn.Open();
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            lblError.Text = "error: " + ex.Message;
        }
        finally
        {
            if (conn != null)
                conn.Close();
        }
    }
}