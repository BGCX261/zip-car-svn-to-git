using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using BLL_ZipCar;

public partial class Forms_Clientes : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            newRegistro();
        }
    }

    private void newRegistro()
    {
        lblDataEntrega.BackColor = Color.Empty;
        lblDataRetirada.BackColor = Color.Empty;
        txtDataEntrega.Text = String.Empty;
        txtDataRetirada.Text = String.Empty;
        this.CarregaGaragem();
    }

    private void CarregaGaragem()
    {

        Garagens garagemRetirada = new Garagens();

        dropGaragemRetirada.DataTextField = "nome";
        dropGaragemRetirada.DataValueField = "idGaragem";

        dropGaragemRetirada.DataSource = garagemRetirada.GetAllGaragens();
        dropGaragemRetirada.DataBind();


        Garagens garagemEntrega = new Garagens();

        dropGaragemEntrega.DataTextField = "nome";
        dropGaragemEntrega.DataValueField = "idGaragem";

        dropGaragemEntrega.DataSource = garagemEntrega.GetAllGaragens();
        dropGaragemEntrega.DataBind();
    }

    private bool ValidaDadosInformados()
    {
        var validado = true;

        if (txtDataRetirada.Text.Equals(string.Empty))
        {
            txtDataRetirada.Focus();
            lblDataRetirada.BackColor = Color.LightCoral;
            validado = false;

        }

        if (txtDataEntrega.Text.Equals(string.Empty))
        {
            txtDataEntrega.Focus();
            lblDataEntrega.BackColor = Color.LightCoral;
            validado = false;
        }

        if (!validado)
        {
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Alerta"
                , "javascript:Alerta('Campos destacados obrigatórios');", true);

        }

        return validado;
    }


    protected void btnConsultar_Click(object sender, EventArgs e)
    {
        if (ValidaDadosInformados())
        {

            Session["consDataRetirada"] = Server.HtmlEncode(txtDataRetirada.Text);
            Session["consDataEntrega"] = Server.HtmlEncode(txtDataEntrega.Text);
            Session["ConsGaragemRetirada"] = Server.HtmlEncode(dropGaragemRetirada.SelectedValue);
            Session["ConsGaragemEntrega"] = Server.HtmlEncode(dropGaragemEntrega.SelectedValue);

            Response.Redirect("~/ReservarCarroLista.aspx");
        }        
    }
}