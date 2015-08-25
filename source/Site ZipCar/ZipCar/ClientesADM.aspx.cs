using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using BLL_ZipCar;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Forms_ClientesADM : System.Web.UI.Page
{

    public int IdCliente { get; set; }

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

        txtCpf.Text = string.Empty;
        txtCnpj.Text = string.Empty;

        txtCidade.Text = string.Empty;
        txtUf.Text = string.Empty;
        rdlSexo.ClearSelection();
        rdlSexo.DataBind();
        txtLogradouro.Text = string.Empty;
        txtNumero.Text = string.Empty;
        txtComplemento.Text = string.Empty;
        txtBairro.Text = string.Empty;
        txtCEP.Text = string.Empty;
        txtDataNasc.Text = string.Empty;
        txtTelefoneRes.Text = string.Empty;
        txtTelefoneCel.Text = string.Empty;
        txtEmail.Text = string.Empty;

        rdlPesTip.ClearSelection();
        rdlPesTip.DataBind();
        txtCarteiraNum.Text = string.Empty;
        txtCarteiraVal.Text = string.Empty;
        rblCarteiraCat.ClearSelection();
        rblCarteiraCat.DataBind();
        txtNumCartao.Text = string.Empty;
        txtCartaoVal.Text = string.Empty;

        txtNome.Focus();

    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        if (txtNome.Text.Equals(string.Empty))
        {
            txtNome.Focus();
            return;
        }


        Clientes Cliente = new Clientes();

        try
        {
            Cliente.getDadosCliente(txtNome.Text);

            if (Cliente.IdCliente.Equals(null))
            {
                System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Alerta"
            , "javascript:Alerta('Cliente não encontrado');", true);
                newRegistro();
            }
            else
            {

                PopulaDadosTela(Cliente);
            }

        }
        catch (Exception ex)
        {
            throw ex;
        }

    }

    protected void PopulaDadosTela(BLL_ZipCar.Clientes novo)
    {
        txtNome.Text = novo.Nome;

        if (!novo.Sexo.Equals(null))
        {
            if (novo.Sexo.Equals('M'))
            {
                rdlSexo.SelectedIndex = 0;
            }
            else
            {
                rdlSexo.SelectedIndex = 1;
            }
        }

        if (!novo.PesTip.Equals(null))
        {
            if (novo.PesTip.Equals('F'))
            {
                rdlPesTip.SelectedIndex = 0;
            }
            else
            {
                rdlPesTip.SelectedIndex = 1;
            }
        }
        
        rdlPesTip_SelectedIndexChanged();

        txtCpf.Text = novo.Cpf;


        txtCidade.Text = novo.Cidade;
        txtUf.Text = novo.Uf;
        txtLogradouro.Text = novo.Logradouro;
        txtNumero.Text = novo.Numero.ToString();
        txtComplemento.Text = novo.Complemento;
        txtBairro.Text = novo.Bairro;
        txtCEP.Text = novo.Cep;
        txtDataNasc.Text = System.DateTime.Parse(novo.DataNasc.ToString()).ToString("dd/MM/yyyy");
        txtTelefoneRes.Text = novo.TelefoneRes;
        txtTelefoneCel.Text = novo.TelefoneCel;
        txtEmail.Text = novo.Email;

        txtCarteiraNum.Text = novo.CarteiraNum;
        txtCarteiraVal.Text = System.DateTime.Parse(novo.CarteiraVal.ToString()).ToString("dd/MM/yyyy");

        if (!novo.CarteiraCat.Equals(null))
        {
            if (novo.CarteiraCat.Equals('A'))
            {
                rblCarteiraCat.SelectedIndex = 0;
            }
            else
            {
                if (novo.CarteiraCat.Equals('B'))
                {
                    rblCarteiraCat.SelectedIndex = 1;
                }
                else
                {
                    if (novo.CarteiraCat.Equals('c'))
                    {
                        rblCarteiraCat.SelectedIndex = 2;
                    }else
                    {
                        rblCarteiraCat.SelectedIndex = 3;
                    }
                }
            }
        }
         
        txtNumCartao.Text = novo.NumCartao;
        txtCartaoVal.Text = System.DateTime.Parse(novo.CartaoVal.ToString()).ToString("dd/MM/yyyy");
    }

    [System.Web.Script.Services.ScriptMethod()]
    [System.Web.Services.WebMethod]
    public static string[] SearchClientes(string prefixText, int count)
    {

        DataSet dtst = new DataSet();

        SqlConnection sqlCon = new SqlConnection();

        sqlCon.ConnectionString = "Data Source=ROCKENBACH-NOTE\\SQLEXPRESS;Initial Catalog=ZipCar;Integrated Security=True";

        string strSql = "select nome from Cliente where nome LIKE '" + prefixText + "%' ";

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

    protected void rdlPesTip_SelectedIndexChanged()
    {

        if (rdlPesTip.SelectedIndex.Equals(0))
        {
            txtCnpj.Text = string.Empty;
            txtCpf.BackColor = txtCnpj.BackColor;
            txtCnpj.BackColor = Color.LightGray;

            txtCnpj.ReadOnly = true;
            txtCpf.ReadOnly = false;
        }
        else
        {
            txtCpf.Text = string.Empty;
            txtCnpj.BackColor = txtCpf.BackColor;
            txtCpf.BackColor = Color.LightGray;

            txtCnpj.ReadOnly = false;
            txtCpf.ReadOnly = true;
        }



    }

}