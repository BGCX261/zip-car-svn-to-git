<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="~/Clientes.aspx.cs" Inherits="Forms_Clientes" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
   <asp:ScriptManager ID="ScriptManager1" EnableScriptGlobalization="true" EnableScriptLocalization="true" runat="server">
   </asp:ScriptManager>

   <asp:UpdatePanel ID="UpdatePanel1" runat="server">      

        <ContentTemplate>
            <br />
            <br />
            <br />

            <div class="FormPadrao">
                
                <h3>
                    Cadastro de Clientes
                </h3>
                
                <p>
  <%--                  <div class="field">
                        <asp:Label ID="Label1" class="label" Text="ID Cliente:" runat="server" />
                        <asp:TextBox class="input" Width="20%" ID="txtidCliente" runat="server" onKeydown="mascara(this,soNumeros)" />
                        <asp:Button class="button" Text="Buscar" runat="server" ID="btnBuscar" 
                            onclick="btnBuscar_Click"/>
                    <div />--%>

                    <div class="field">
                        <asp:Label ID="lblNome" class="label" Text="Nome:" runat="server"  />
                        <asp:TextBox class="input" ID="txtNome" runat="server"  MaxLength="50"/>
                    </div>

                    <div class="field">
                        <asp:Label ID="lblSexo" class="label" Text="Sexo:" runat="server" />
                        <asp:RadioButtonList class="input" ID="rdlSexo" runat="server" RepeatDirection="Horizontal" >
                            <asp:ListItem>Masculino</asp:ListItem>
                            <asp:ListItem>Feminino</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>

                    <div class="field">
                        <asp:Label ID="lblPesTip" class="label" Text="Tipo pessoa:" runat="server" />
                        <asp:RadioButtonList class="input" ID="rdlPesTip" runat="server" 
                            RepeatDirection="Horizontal" 
                            onselectedindexchanged="rdlPesTip_SelectedIndexChanged" 
                            AutoPostBack="true" >
                            <asp:ListItem>Física</asp:ListItem>
                            <asp:ListItem>Jurídica</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>

                    <div class="field">
                        <asp:Label ID="lblCpf" class="label" Text="CPF:" runat="server" />
                        <asp:TextBox class="input" ID="txtCpf" Width="150px" runat="server" Columns="14" MaxLength="14" onKeydown="formataCPF(this,event)" />
                    </div>

                    <div class="field">
                        <asp:Label ID="lblCnpj" class="label" Text="CNPJ:" runat="server" />
                        <asp:TextBox class="input" ID="txtCnpj" Width="150px" runat="server" Columns="18" MaxLength="18"  onKeydown="formataCNPJ(this,event)" />
                    </div>

  <%--                  <div class="field">
                        <asp:Label ID="Label4" class="label" Text="RG:" runat="server" />
                        <asp:TextBox class="input" ID="txtRG" Width="100px" runat="server" Columns="12" MaxLength="12" />
                    </div--%>

                    <div class="field">
                        <asp:Label ID="lblDataNasc" class="label" Text="Data Nasc:" runat="server" />
                        <asp:TextBox ID="txtDataNasc" class="inputData" runat="server" Columns="10" MaxLength="10" onKeyDown="formataData(this,event)"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender" runat="server" PopupButtonID="imgCalendario" TargetControlID="txtDataNasc"/>
                        <asp:Image ID="imgCalendario" ImageUrl="~/Images/07_calendar.ico" Width="20px" Height="20px" runat="server" />
                    </div>

                    <div class="field">
                        <asp:Label ID="lblCidade" class="label" Text="Cidade:" runat="server" />
                        <asp:TextBox class="input" ID="txtCidade" runat="server" />
                    </div>

                    <div class="field">
                        <asp:Label ID="lblBairro" class="label" Text="Bairro:" runat="server" />
                        <asp:TextBox class="input" ID="txtBairro" runat="server" MaxLength="40" />
                    </div>

                    <div class="field">
                        <asp:Label ID="lblUf" class="label" Text="UF:" runat="server" />
                        <asp:TextBox class="input" ID="txtUf" runat="server" Columns="2" MaxLength="2" Width="30px" />
                    </div>

                    <div class="field">
                        <asp:Label ID="lblCep" class="label" Text="CEP:" runat="server" />
                        <asp:TextBox class="input" ID="txtCEP" runat="server" Columns="9" MaxLength="9" Width="100px"  onKeydown="formataCEP(this,event)"/>
                    </div>

                    <div class="field">
                        <asp:Label ID="lblLograduro" class="label" Text="Logradouro:" runat="server" />
                        <asp:TextBox class="input" ID="txtLogradouro" runat="server" MaxLength="40" />
                    </div>

                    <div class="field">
                        <asp:Label ID="lblNumero" class="label" Text="Número:" runat="server" />
                        <asp:TextBox class="input" ID="txtNumero" runat="server" Columns="10" MaxLength="7" Width="100px" onKeydown="mascara(this,soNumeros)" />
                    </div>

                    <div class="field">
                        <asp:Label ID="lblComplemento" class="label" Text="Complemento:" 
                            runat="server" />
                        <asp:TextBox class="input" ID="txtComplemento" runat="server" MaxLength="20" />
                    </div>

                    <div class="field">
                        <asp:Label ID="lblTelefoneRes" class="label" Text="Telefone Res:" 
                            runat="server" />
                        <asp:TextBox class="input" ID="txtTelefoneRes" runat="server" MaxLength="14" onKeydown="formataTelefone(this,event)" />
                    </div>

                    <div class="field">
                        <asp:Label ID="lblTelefoneCel" class="label" Text="Telefone Cel:" 
                            runat="server" />
                        <asp:TextBox class="input" ID="txtTelefoneCel" runat="server" MaxLength="14" onKeydown="formataTelefone(this,event)" />
                    </div>

                    <div class="field">
                        <asp:Label ID="lblEmail" class="label" Text="Email" runat="server" />
                        <asp:TextBox class="input" ID="txtEmail" runat="server" onKeydown="checkMail(this)" />
                    </div>

                    <div class="field">
                        <asp:Label ID="lblNumHab" class="label" Text="Num. Habilitação" 
                            runat="server" />
                        <asp:TextBox class="input" ID="txtCarteiraNum" runat="server" onKeydown="mascara(this,soNumeros)" MaxLength="11"/>
                    </div>

                    <div class="field">
                        <asp:Label ID="lblValidadeHab" class="label" Text="Validade:" runat="server" />
                        <asp:TextBox ID="txtCarteiraVal" class="inputData" runat="server" Columns="10" MaxLength="10" onKeyDown="formataData(this,event)"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="imgCalendario2" TargetControlID="txtCarteiraVal"/>
                        <asp:Image ID="imgCalendario2" ImageUrl="~/Images/07_calendar.ico" Width="20px" Height="20px" runat="server" />
                    </div>

                    <div class="field">
                        <asp:Label ID="lblCategoria" class="label" Text="Categoria:" runat="server" />
                        <asp:RadioButtonList class="input" ID="rblCarteiraCat" runat="server" 
                            RepeatDirection="Horizontal" >
                            <asp:ListItem>B</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                            <asp:ListItem>E</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>

                    <div class="field">
                        <asp:Label ID="lblNumCart" class="label" Text="Num. Cartão:" runat="server" />
                        <asp:TextBox class="input" ID="txtNumCartao" runat="server" onKeydown="mascara(this,soNumeros)" MaxLength="16" />
                    </div>

                    <div class="field">
                        <asp:Label ID="lblValidadeCart" class="label" Text="Validade:" runat="server" />
                        <asp:TextBox ID="txtCartaoVal" class="inputData" runat="server" Columns="7" MaxLength="7" onKeyDown="formataDataMMYYYY(this,event)"></asp:TextBox>
                    </div>

                    <%--<div class="field">
                        <asp:Label ID="lblUsuario" class="label" Text="Usuario:" runat="server" />
                        <asp:TextBox class="input" ID="txtUsuario" runat="server" />
                    </div>--%>

                    <div class="field">
                        <asp:Label ID="lblSenha" class="label" Text="Senha:" runat="server" />
                        <asp:TextBox class="input" ID="txtSenha" runat="server" MaxLength="16" TextMode="Password" />
                    </div>

                    <div class="field">
                        <asp:Label ID="lblRepSenha" class="label" Text="Repetir Senha:" 
                            runat="server" />
                        <asp:TextBox class="input" ID="txtRepetirSenha" runat="server" 
                            TextMode="Password" />
                        <asp:Label ID="lblErroSenha" Text="" runat="server" />
                    </div>
                    
                    <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>

                    <%--<asp:Button class="button" Text="Novo" ID="btnNovo" runat="server" 
                            onclick="btnNovo_Click" />--%>
                    <%--&nbsp;&nbsp;&nbsp;--%>
                    <asp:Button class="button" Text="Salvar" ID="btnSalvar" runat="server" 
                            onclick="btnSalvar_Click" />

                    <p>
                    </p>

                    <p>
                    </p>

                </p>

            </div>
            
         </ContentTemplate>
            
     </asp:UpdatePanel>

    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <div id="Layer1" style="position:absolute; z-index:1; left:45%; top:70%;">   
                Processando . . .
                <br />
                <asp:Image ID="image1" ImageUrl="~/Images/loading.gif" runat="server" />
            </div>
        </ProgressTemplate>
    
    </asp:UpdateProgress>
</asp:Content>

