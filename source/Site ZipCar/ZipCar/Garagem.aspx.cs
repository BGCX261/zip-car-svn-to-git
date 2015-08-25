using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using BLL_ZipCar;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Garagem : System.Web.UI.Page
{
    private static int idGaragem;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            newRegistro();
        }
    }

    private void newRegistro()
    {
        txtNome.Text = string.Empty;
        txtCidade.Text = string.Empty;
        txtBairro.Text = string.Empty;
        txtUf.Text = string.Empty;
        txtCEP.Text = string.Empty;
        txtLogradouro.Text = string.Empty;
        txtNumero.Text = string.Empty;
        txtComplemento.Text = string.Empty;
        txtCapacidade.Text = string.Empty;
        txtLatitude.Text = string.Empty;
        txtLongitude.Text = string.Empty;
        Session["novaGaragem"] = true;

        txtNome.Focus();
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {

        if (txtNome.Text.Equals(string.Empty))
        {
            txtNome.Focus();
            return;
        }

        Garagens Garagens = new Garagens();

        try
        {
            Garagens.GetDadosGaragem(txtNome.Text.ToString());

            PopulaDadosTela(Garagens);
            Session["novaGaragem"] = false;

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    protected void PopulaDadosTela(Garagens novo)
    {
        idGaragem = novo.IdGaragem;

        txtNome.Text = novo.Nome;

        txtCidade.Text = novo.Cidade;
        txtUf.Text = novo.UF;
        txtLogradouro.Text = novo.Logradouro;
        txtNumero.Text = novo.Num.ToString();
        txtComplemento.Text = novo.Complemento;
        txtBairro.Text = novo.Bairro;
        txtCEP.Text = novo.Cep;
        txtCapacidade.Text = novo.Capacidade.ToString();
        txtLatitude.Text = novo.Latitude;
        txtLongitude.Text = novo.Longitude;

    }

    protected void btnSalvar_Click(object sender, EventArgs e)
    {

        if (ValidaDadosInformados())
        {
            return;
        }


        if ((bool)Session["novaGaragem"] == true)
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

        Garagens novo = new Garagens();

        novo = PopulaDadosGaragem(novo);

        novo.Inserir();
    }

    private void Alterar()
    {
        Garagens alterar = new Garagens();

        alterar = PopulaDadosGaragem(alterar);

        alterar.Alterar();
    }

    protected Garagens PopulaDadosGaragem(Garagens novo)
    {
        if ((bool)Session["novaGaragem"] == true)
        {
            novo.IdGaragem = Garagens.BuscaMaxIdGaragem();
        }
        else
        {
            novo.IdGaragem = idGaragem;
        }
        novo.Nome = txtNome.Text;
        novo.Cidade = txtCidade.Text;
        novo.UF = txtUf.Text;
        novo.Logradouro = txtLogradouro.Text;
        novo.Num = Convert.ToInt32(txtNumero.Text);
        novo.Complemento = txtComplemento.Text;
        novo.Bairro = txtBairro.Text;
        novo.Cep = txtCEP.Text;
        novo.Capacidade = Convert.ToInt32(txtCapacidade.Text);
        novo.Latitude = txtLatitude.Text;
        novo.Longitude = txtLongitude.Text;

        return novo;
    }

    private bool ValidaDadosInformados()
    {
        if (txtNome.Text.Equals(string.Empty))
        {
            txtNome.Focus();
            return true;
        }

        if (txtCidade.Text.Equals(string.Empty))
        {
            txtCidade.Focus();
            return true;
        }

        if (txtUf.Text.Equals(string.Empty))
        {
            txtUf.Focus();
            return true;
        }

        if (txtBairro.Text.Equals(string.Empty))
        {
            txtBairro.Focus();
            return true;
        }

        if (txtCEP.Text.Equals(string.Empty))
        {
            txtCEP.Focus();
            return true;
        }

        if (txtLogradouro.Text.Equals(string.Empty))
        {
            txtLogradouro.Focus();
            return true;
        }

        if (txtNumero.Text.Equals(string.Empty))
        {
            txtNumero.Focus();
            return true;
        }

        if (txtCapacidade.Text.Equals(string.Empty))
        {
            txtCapacidade.Focus();
            return true;
        }

        return false;
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static string[] SearchGaragens(string prefixText, int count)
    {

        DataSet dtst = new DataSet();

        SqlConnection sqlCon = new SqlConnection();

        sqlCon.ConnectionString = "Data Source=ROCKENBACH-NOTE\\SQLEXPRESS;Initial Catalog=ZipCar;Integrated Security=True";

        string strSql = "select nome from Garagem where nome LIKE '" + prefixText + "%' ";

        SqlCommand sqlComd = new SqlCommand(strSql, sqlCon);

        sqlCon.Open();

        SqlDataAdapter sqlAdpt = new SqlDataAdapter();

        sqlAdpt.SelectCommand = sqlComd;

        sqlAdpt.Fill(dtst);

        string[] cntName = new string[dtst.Tables[0].Rows.Count];

        int i = 0;

        try
        {
            foreach (DataRow rdr in dtst.Tables[0].Rows)
            {
                cntName.SetValue(rdr["nome"].ToString(), i);
                i++;
            }
        }
        catch { }

        finally
        {
            sqlCon.Close();
        }

        return cntName;
    }
    protected void btnLimpar_Click(object sender, EventArgs e)
    {
        newRegistro();
    }
}