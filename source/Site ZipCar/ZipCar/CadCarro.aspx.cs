using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL_ZipCar;
using System.IO;

public partial class CadCarro : System.Web.UI.Page
{
    private static int idCarro;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CarregaCategorias();
            CarregaGaragem();
            CarregaCarros();
            newRegistro();
        }
    }

    private void CarregaCategorias()
    {
        Categorias categoria = new Categorias();

        ddlCategoria.DataTextField = "descricao";
        ddlCategoria.DataValueField = "idCategoria";

        ddlCategoria.DataSource = categoria.GetAllCategorias();
        ddlCategoria.DataBind();
    }

    private void CarregaCarros()
    {
        grvCarros.DataSource = Carros.GetAllCarros(Convert.ToInt32(ddlCategoria.SelectedValue));
        grvCarros.DataBind();
    }

    private void CarregaGaragem()
    {
        Garagens garagem = new Garagens();

        ddlGaragem.DataTextField = "nome";
        ddlGaragem.DataValueField = "idGaragem";

        ddlGaragem.DataSource = garagem.GetAllGaragens();

        ddlGaragem.DataBind();

        ddlGaragem.Items.Insert(0, new ListItem("Selecione",(ddlGaragem.Items.Count + 1).ToString()));

        ddlGaragem.SelectedValue = (ddlGaragem.Items.Count + 1).ToString();
    }

    protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
    {
        CarregaCarros();
    }

    protected void grvCarros_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        

        if (e.CommandName.Equals(string.Empty))
        {
            Session["novoCarro"] = false;
            idCarro = Convert.ToInt32(grvCarros.Rows[Convert.ToInt32(e.CommandArgument)].Cells[0].Text);

            Carros c = new Carros();
            c.getDadosCarro(idCarro);

            txtMarca.Text = c.Marca;
            txtAno.Text = c.Ano.ToString();
            txtCor.Text = c.Cor;
            txtModelo.Text = c.Modelo;
            txtPlaca.Text = c.Placa;
            txtRenavam.Text = c.Renavam;
            txtValorloc.Text = c.ValorLoc.ToString();

            if (c.IdGaragem != null)
            {
                ddlGaragem.SelectedValue = c.IdGaragem.ToString();
            }

            if (c.Ar.Equals("S"))
            {
                chklistEspecificacoes.Items[0].Selected = true;
            }
            else
            {
                chklistEspecificacoes.Items[0].Selected = false;
            }

            if (c.Direcao.Equals("S"))
            {
                chklistEspecificacoes.Items[1].Selected = true;
            }
            else
            {
                chklistEspecificacoes.Items[1].Selected = false;
            }

            if (c.QuatroPortas.Equals("S"))
            {
                chklistEspecificacoes.Items[2].Selected = true;
            }
            else
            {
                chklistEspecificacoes.Items[2].Selected = false;
            }

            if (c.Gps.Equals("S"))
            {
                chklistEspecificacoes.Items[3].Selected = true;
            }
            else
            {
                chklistEspecificacoes.Items[3].Selected = false;
            }

        }
    }

    protected void GridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvCarros.PageIndex = e.NewPageIndex;

        CarregaCarros();
    }

    private void newRegistro()
    {
        ddlCategoria.SelectedIndex = 0;
        ddlCategoria.DataBind();

        txtMarca.Text = string.Empty;
        txtModelo.Text = string.Empty;
        txtPlaca.Text = string.Empty;
        txtRenavam.Text = string.Empty;
        txtValorloc.Text = string.Empty;
        txtAno.Text = string.Empty;
        txtCor.Text = string.Empty;

        chklistEspecificacoes.ClearSelection();

        ddlGaragem.SelectedValue = (ddlGaragem.Items.Count).ToString();

        Session["novoCarro"] = true;

    }

    protected void btnSalvar_Click(object sender, EventArgs e)
    {

        if (ValidaDadosInformados())
        {
            return;
        }

        if ((bool)Session["novoCarro"] == true)
        {
            InserirRegistro();
        }
        else
        {
            Alterar();
        }

        newRegistro();
        CarregaCarros();

    }

    private void InserirRegistro()
    {

        Carros novo = new Carros();

        novo = PopulaDadosCarro(novo);

        novo.IdCarro = Carros.BuscaMaxIdCarro();

        novo.Inserir();
    }

    private void Alterar()
    {
        Carros alterar = new Carros();

        alterar = PopulaDadosCarro(alterar);
        alterar.IdCarro  = idCarro;

        alterar.Alterar();
    }

    private Carros PopulaDadosCarro(Carros c)
    {
        c.IdCategoria = Convert.ToInt32(ddlCategoria.SelectedValue);
        c.Marca = txtMarca.Text;
        c.Modelo = txtModelo.Text;
        c.Ano = Convert.ToInt32(txtAno.Text);
        c.Placa = txtPlaca.Text;
        c.Renavam = txtRenavam.Text;
        c.Cor = txtCor.Text;

        if (chklistEspecificacoes.Items[0].Selected)
        {
            c.Ar = "S";
        }
        else
        {
            c.Ar = "N";
        }

        if (chklistEspecificacoes.Items[1].Selected)
        {
            c.Direcao = "S";
        }
        else
        {
            c.Direcao = "N";
        }
        if (chklistEspecificacoes.Items[2].Selected)
        {
            c.QuatroPortas = "S";
        }
        else
        {
            c.QuatroPortas = "N";
        }
        if (chklistEspecificacoes.Items[3].Selected)
        {
            c.Gps = "S";
        }
        else
        {
            c.Gps = "N";
        }
        c.ValorLoc = Convert.ToDecimal(txtValorloc.Text);

        if (ddlGaragem.SelectedValue != null)
        {
            c.IdGaragem = Convert.ToInt32(ddlGaragem.SelectedValue);
        }

        c.URLImagem = SalvaFoto();

        return c;
    }


    private bool ValidaDadosInformados()
    {
        if (ddlCategoria.SelectedValue.Equals(string.Empty))
        {
            return true;
        }

        if (txtMarca.Text.Equals(string.Empty))
        {
            txtMarca.Focus();
            return true;
        }

        if (txtModelo.Text.Equals(string.Empty))
        {
            txtModelo.Focus();
            return true;
        }

        if (txtAno.Text.Equals(string.Empty))
        {
            txtAno.Focus();
            return true;
        }
        
        if (txtPlaca.Text.Equals(string.Empty))
        {
            txtPlaca.Focus();
            return true;
        }

        if (txtRenavam.Text.Equals(string.Empty))
        {
            txtRenavam.Focus();
            return true;
        }

        if (txtCor.Text.Equals(string.Empty))
        {
            txtCor.Focus();
            return true;
        }

        if (txtValorloc.Text.Equals(string.Empty))
        {
            txtValorloc.Focus();
            return true;
        }

        return false;

    }
    private string SalvaFoto()
    {

        string fullname = null;

        string arq = txtMarca.Text + "_" + txtModelo.Text + ".jpg"; 
        if (FileUploadURL.FileName != "")
        {

            string diretorio = "..//Fotos Carros//";

            DirectoryInfo di = new DirectoryInfo(diretorio); 

            //di.FullName.Replace(" ", "_");
            //if (!di.Exists)
            //    di.Create();

            //fullname = di.FullName + "\\" + arq;

            fullname = "c:\\Temp\\" + "\\" + arq;

            FileUploadURL.SaveAs(fullname);                

        }

        return fullname;
    }
    protected void btNovo_Click(object sender, EventArgs e)
    {
        newRegistro();
    }
}