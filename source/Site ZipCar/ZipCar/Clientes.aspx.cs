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

    public int IdCliente { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            newRegistro();
        }
    }

    //protected void btnNovo_Click(object sender, EventArgs e)
    //{
    //        newRegistro();
    //}

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

        //Session["novoCliente"] = true;
        txtNome.Focus();

    }
    protected void btnSalvar_Click(object sender, EventArgs e)
    {

        if (ValidaDadosInformados())
        {
            return;
        }


        //if ((bool)Session["novoCliente"] == true)
        //{

            InserirRegistro();

        //}
        //else
        //{
        //    Alterar();

        //}

        //newRegistro();

    }

    private void InserirRegistro()
    {

        Clientes novo = new Clientes();

        novo = PopulaDadosCliente(novo);

        novo.Inserir();
    }

    private void Alterar()
    {
        Clientes alterar = new Clientes();

        alterar = PopulaDadosCliente(alterar);

        alterar.Alterar();
    }

    protected Clientes PopulaDadosCliente(Clientes novo)
    {

        novo.IdCliente = Clientes.BuscaMaxIdCliente();
        novo.Nome = txtNome.Text;
        
        if (rdlSexo.SelectedValue.Equals("Masculino"))
        {
            novo.Sexo = 'M';
        }
        else
        {
            novo.Sexo = 'F';
        }

        if (rdlPesTip.SelectedValue.Equals("Física"))
        {
            novo.PesTip = 'F';
        }else
        {
            novo.PesTip = 'J';
        }

        novo.CarteiraNum = txtCarteiraNum.Text;
        novo.CarteiraVal = Convert.ToDateTime(txtCarteiraVal.Text);
        novo.CarteiraCat = Convert.ToChar(rblCarteiraCat.SelectedValue.ToString());
        novo.NumCartao =   txtNumCartao.Text;
        novo.CartaoVal =   Convert.ToDateTime(txtCartaoVal.Text);

        if (!txtCpf.Text.Equals(string.Empty))
        {
            novo.Cpf = txtCpf.Text;
        }
        else 
        {
            novo.Cpf = txtCnpj.Text;
        }

        novo.Cpf = txtCpf.Text;
        novo.Cidade = txtCidade.Text;
        novo.Uf = txtUf.Text;
        novo.Logradouro = txtLogradouro.Text;
        novo.Numero = Convert.ToInt32(txtNumero.Text);
        novo.Complemento = txtComplemento.Text;
        novo.Bairro = txtBairro.Text;
        novo.Cep = txtCEP.Text;
        novo.DataNasc = Convert.ToDateTime(txtDataNasc.Text);
        novo.TelefoneRes = txtTelefoneRes.Text;
        novo.TelefoneCel = txtTelefoneCel.Text;
        novo.Email = txtEmail.Text;

        return novo;
    }

    private bool ValidaDadosInformados()
    {

        bool stt = false;
        VoltaCoresCampos();

        if (txtNome.Text.Equals(string.Empty))
        {
            lblNome.BackColor = Color.LightCoral;
            stt = true;
        }

        if (rdlSexo.SelectedValue.Equals(string.Empty))
        {
            lblSexo.BackColor = Color.LightCoral;
            stt = true;
        }

        if (rdlPesTip.SelectedValue.Equals(string.Empty))
        {
            lblPesTip.BackColor = Color.LightCoral;
            stt = true;
        }

        if ((txtCpf.Text.Equals(string.Empty) && rdlPesTip.SelectedIndex.Equals(0)) ||
            (txtCpf.Text.Equals(string.Empty) && rdlPesTip.SelectedValue.Equals(string.Empty)))
        {
            lblCpf.BackColor = Color.LightCoral;
            stt = true;
        }

        if ((txtCnpj.Text.Equals(string.Empty) && rdlPesTip.SelectedIndex.Equals(1)) ||
           (txtCpf.Text.Equals(string.Empty) && rdlPesTip.SelectedValue.Equals(string.Empty)))
        {
            lblCnpj.BackColor = Color.LightCoral;
            stt = true;
        }

        if (txtDataNasc.Text.Equals(string.Empty))
        {
            lblDataNasc.BackColor = Color.LightCoral;
            stt = true;
        }

        if (txtCidade.Text.Equals(string.Empty))
        {
            lblCidade.BackColor = Color.LightCoral;
            stt = true;
        }

        if (txtUf.Text.Equals(string.Empty))
        {
            lblUf.BackColor = Color.LightCoral;
            stt = true;
        }

        if (txtBairro.Text.Equals(string.Empty))
        {
            lblBairro.BackColor = Color.LightCoral;
            stt = true;
        }

        if (txtCEP.Text.Equals(string.Empty))
        {
            lblCep.BackColor = Color.LightCoral;
            stt = true;
        }

        if (txtLogradouro.Text.Equals(string.Empty))
        {
            lblLograduro.BackColor = Color.LightCoral;
            stt = true;
        }

        if (txtNumero.Text.Equals(string.Empty))
        {
            lblNumero.BackColor = Color.LightCoral;
            stt = true;
        }

        if (txtTelefoneCel.Text.Equals(string.Empty) &&
            txtTelefoneRes.Text.Equals(string.Empty))
        {
            lblTelefoneRes.BackColor = Color.LightCoral;
            lblTelefoneCel.BackColor = Color.LightCoral;
            stt = true;
        }

        if (txtEmail.Text.Equals(string.Empty))
        {
            lblEmail.BackColor = Color.LightCoral;
            stt = true;
        }

        if (txtCarteiraNum.Text.Equals(string.Empty))
        {
            lblNumHab.BackColor = Color.LightCoral;
            stt = true;
        }

        if (txtCarteiraVal.Text.Equals(string.Empty))
        {
            lblValidadeHab.BackColor = Color.LightCoral;
            stt = true;
        }

        if (rblCarteiraCat.SelectedValue.Equals(string.Empty))
        {
            lblCategoria.BackColor = Color.LightCoral;
            stt = true;
        }

        if (txtNumCartao.Text.Equals(string.Empty))
        {
            lblNumCart.BackColor = Color.LightCoral;
            stt = true;
        }

        if (txtCartaoVal.Text.Equals(string.Empty))
        {
            lblValidadeCart.BackColor = Color.LightCoral;
            stt = true;
        }

        if (txtSenha.Text.Length < 6)
        {
            lblErroSenha.Text = "Mínimo 6 caracteres";
            lblSenha.BackColor = Color.LightCoral;
        }
        if (txtRepetirSenha.Text.Length < 6)
        {
            lblErroSenha.Text = "Mínimo 6 caracteres";
            lblSenha.BackColor = Color.LightCoral;
        }

        if (txtSenha.Text.Equals(string.Empty))
        {
            lblSenha.BackColor = Color.LightCoral;
            stt = true;
        }

        if (txtRepetirSenha.Text.Equals(string.Empty))
        {
            lblRepSenha.BackColor = Color.LightCoral;
            stt = true;
        }

        if (!txtRepetirSenha.Text.Equals(txtSenha.Text))
        {
            lblErroSenha.Text = "Senhas diferentes";
            lblErroSenha.ForeColor = Color.LightCoral;
            stt = true;
        }

        if (stt)
        {
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Alerta"
            , "javascript:Alerta('Campos destacados obrigatórios');", true);

        }
        else
        {
            lblErroSenha.Text = string.Empty;
            VoltaCoresCampos();
        }

        return stt;
    }

    private void VoltaCoresCampos()
    {
        lblNome.BackColor = Color.Empty;
        lblSexo.BackColor = Color.Empty;
        lblPesTip.BackColor = Color.Empty;
        lblCpf.BackColor = Color.Empty;
        lblCnpj.BackColor = Color.Empty;
        lblDataNasc.BackColor = Color.Empty;
        lblCidade.BackColor = Color.Empty;
        lblUf.BackColor = Color.Empty;
        lblBairro.BackColor = Color.Empty;
        lblCep.BackColor = Color.Empty;
        lblLograduro.BackColor = Color.Empty;
        lblNumero.BackColor = Color.Empty;
        lblTelefoneRes.BackColor = Color.Empty;
        lblTelefoneCel.BackColor = Color.Empty;
        lblEmail.BackColor = Color.Empty;
        lblNumHab.BackColor = Color.Empty;
        lblValidadeHab.BackColor = Color.Empty;
        lblCategoria.BackColor = Color.Empty;
        lblNumCart.BackColor = Color.Empty;
        lblValidadeCart.BackColor = Color.Empty;
        lblSenha.BackColor = Color.Empty;
        lblRepSenha.BackColor = Color.Empty;
        lblErroSenha.ForeColor = Color.Empty;
    }


    //protected void btnBuscar_Click(object sender, EventArgs e)
    //{

    //    if (!txtidCliente.Text.Equals(string.Empty))
    //    {
    //        int idCliente = Convert.ToInt32(txtidCliente.Text);

    //        BLL_ZipCar.Clientes Cliente = new BLL_ZipCar.Clientes();

    //        try
    //        {
    //            Cliente.getDadosCliente(idCliente);

    //            PopulaDadosTela(Cliente);
    //            Session["novoCliente"] = false;

    //        }
    //        catch (Exception ex)
    //        {
    //            throw ex;
    //        }

    //    }

    //}

    //protected void PopulaDadosTela(BLL_ZipCar.Clientes novo)
    //{

    //    IdCliente = novo.IdCliente;
    //    txtNome.Text = novo.Nome; 

    //    if (!novo.Sexo.Equals(null))
    //    {
    //        if (novo.Sexo.Equals('M'))
    //        {
    //            rdlSexo.SelectedIndex = 0;
    //        }
    //        else
    //        {
    //            rdlSexo.SelectedIndex = 1;
    //        }
    //    }

    //    txtCpf.Text = novo.Cpf;
    //    txtCidade.Text = novo.Cidade;
    //    txtUf.Text = novo.Uf;
    //    txtLogradouro.Text = novo.Logradouro;
    //    txtNumero.Text = novo.Numero.ToString();
    //    txtComplemento.Text = novo.Complemento;
    //    txtBairro.Text = novo.Bairro;
    //    txtCEP.Text = novo.Cep;
    //    txtDataNasc.Text = System.DateTime.Parse(novo.DataNasc.ToString()).ToString("dd/MM/yyyy");
    //    txtTelefoneRes.Text = novo.TelefoneRes;
    //    txtTelefoneCel.Text = novo.TelefoneCel;
    //    txtEmail.Text = novo.Email;
        
    //}

    protected void rdlPesTip_SelectedIndexChanged(object sender, EventArgs e)
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