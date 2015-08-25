using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using BLL_ZipCar;

public partial class Categoria : System.Web.UI.Page
{
    private static Int32 idCategoria;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            newRegistro();
        }

    }

    private void newRegistro()
    {
        txtDescricao.Text = string.Empty;
        CarregaCategorias();
        Session["novaCategoria"] = true;
    }


    protected void btnSalvar_Click(object sender, EventArgs e)
    {

        if (txtDescricao.Text.Equals(string.Empty))
        {
            txtDescricao.Focus();
            return;
        }

        if ((bool)Session["novaCategoria"] == true)
        {
            InserirRegistro();
        }
        else
        {
            Alterar();
        }

        newRegistro();

    }

    private void InserirRegistro()
    {

        Categorias novo = new Categorias();

        novo = PopulaDadosCategoria(novo);

        novo.Inserir();
    }

    private void Alterar()
    {
        Categorias alterar = new Categorias();

        alterar = PopulaDadosCategoria(alterar);

        alterar.Alterar();
    }

    protected Categorias PopulaDadosCategoria(Categorias novo)
    {
        novo.Descricao = txtDescricao.Text;
        if ((bool)Session["novaCategoria"] == true)
        {
            novo.IdCategoria = Categorias.BuscaMaxIdCategoria();
        }
        else
        {
            novo.IdCategoria = idCategoria;
        }

        return novo;
    }

    protected void grvCategorias_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Session["novaCategoria"] = false;

        if (e.CommandName.Equals(string.Empty))
        {
            idCategoria = Convert.ToInt32(grvCategorias.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text);
            txtDescricao.Text = Server.HtmlDecode(grvCategorias.Rows[Convert.ToInt32(e.CommandArgument)].Cells[1].Text);
        }
    }

    private void CarregaCategorias()
    {

        Categorias categoria = new Categorias();

        grvCategorias.DataSource = categoria.GetAllCategorias();
        grvCategorias.DataBind();

    }

    protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvCategorias.PageIndex = e.NewPageIndex;

        CarregaCategorias();
    }

    protected void btNovo_Click(object sender, EventArgs e)
    {
        newRegistro();
    }

    
}