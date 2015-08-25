<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="~/ClientesADM.aspx.cs" Inherits="Forms_ClientesADM" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

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
                    Visualização de Clientes
                </h3>
                
                <p>
  <%--                  <div class="field">
                        <asp:Label ID="Label1" class="label" Text="ID Cliente:" runat="server" />
                        <asp:TextBox class="input" Width="20%" ID="txtidCliente" runat="server" onKeydown="mascara(this,soNumeros)" />
                        <asp:Button class="button" Text="Buscar" runat="server" ID="btnBuscar" 
                            onclick="btnBuscar_Click"/>
                    <div />--%>

                    <div class="field">
                        <asp:Label ID="Label2" class="label" Text="Nome:" runat="server" />
                        <asp:TextBox class="input" ID="txtNome" runat="server"/>
                        <asp:Button class="button" Text="Buscar" ID="btnBuscar" runat="server" 
                            onclick="btnBuscar_Click"  />
                        <asp:Button class="button" Text="Limpar" ID="btnLimpar" runat="server" 
                            onclick="btnLimpar_Click"   />
                        <ajaxToolkit:AutoCompleteExtender 
                                ServiceMethod="SearchClientes"
                                MinimumPrefixLength="2"
                                CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                TargetControlID="txtNome"
                                ID="AutoCompleteExtender1" runat="server" FirstRowSelected = "true" />

                    </div>

                    <div class="field">
                        <asp:Label ID="Label14" class="label" Text="Sexo:" runat="server" />
                        <asp:RadioButtonList class="input" ID="rdlSexo" runat="server" RepeatDirection="Horizontal" >
                            <asp:ListItem>Masculino</asp:ListItem>
                            <asp:ListItem>Feminino</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>

                    <div class="field">
                        <asp:Label ID="Label20" class="label" Text="Tipo pessoa:" runat="server" />
                        <asp:RadioButtonList class="input" ID="rdlPesTip" runat="server" 
                            RepeatDirection="Horizontal" 
                            AutoPostBack="true" >
                            <asp:ListItem>Física</asp:ListItem>
                            <asp:ListItem>Jurídica</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>

                    <div class="field">
                        <asp:Label ID="Label3" class="label" Text="CPF:" runat="server" />
                        <asp:TextBox class="input" ID="txtCpf" Width="150px" runat="server" Columns="14" MaxLength="14" ReadOnly="true" onkeydown="formataCPF(this,event)" />
                    </div>

                    <div class="field">
                        <asp:Label ID="Label19" class="label" Text="CNPJ:" runat="server" />
                        <asp:TextBox class="input" ID="txtCnpj" Width="150px" runat="server" Columns="18" MaxLength="18" ReadOnly="true" onkeydown="formataCNPJ(this,event)" />
                    </div>

  <%--                  <div class="field">
                        <asp:Label ID="Label4" class="label" Text="RG:" runat="server" />
                        <asp:TextBox class="input" ID="txtRG" Width="100px" runat="server" Columns="12" MaxLength="12" ReadOnly="true"/>
                    </div>--%>

                    <div class="field">
                        <asp:Label ID="Label6" class="label" Text="Data Nasc:" runat="server" />
                        <asp:TextBox ID="txtDataNasc" class="inputData" runat="server" Columns="10" MaxLength="10" ReadOnly="true"></asp:TextBox>
                        
                    </div>

                    <div class="field">
                        <asp:Label ID="Label5" class="label" Text="Cidade:" runat="server" />
                        <asp:TextBox class="input" ID="txtCidade" runat="server" ReadOnly="true"/>
                    </div>

                    <div class="field">
                        <asp:Label ID="Label11" class="label" Text="Bairro:" runat="server" />
                        <asp:TextBox class="input" ID="txtBairro" runat="server" ReadOnly="true"/>
                    </div>

                    <div class="field">
                        <asp:Label ID="Label7" class="label" Text="UF:" runat="server" />
                        <asp:TextBox class="input" ID="txtUf" runat="server" Columns="2" MaxLength="2" Width="30px" ReadOnly="true"/>
                    </div>

                    <div class="field">
                        <asp:Label ID="Label12" class="label" Text="CEP:" runat="server" />
                        <asp:TextBox class="input" ID="txtCEP" runat="server" Columns="9" MaxLength="9" Width="100px"  ReadOnly="true"/>
                    </div>

                    <div class="field">
                        <asp:Label ID="Label8" class="label" Text="Logradouro:" runat="server" />
                        <asp:TextBox class="input" ID="txtLogradouro" runat="server" ReadOnly="true"/>
                    </div>

                    <div class="field">
                        <asp:Label ID="Label9" class="label" Text="Número:" runat="server" />
                        <asp:TextBox class="input" ID="txtNumero" runat="server" Columns="10" MaxLength="10" Width="100px" ReadOnly="true" />
                    </div>

                    <div class="field">
                        <asp:Label ID="Label10" class="label" Text="Complemento:" runat="server" />
                        <asp:TextBox class="input" ID="txtComplemento" runat="server" ReadOnly="true"/>
                    </div>

                    <div class="field">
                        <asp:Label ID="Label15" class="label" Text="Telefone Res:" runat="server" />
                        <asp:TextBox class="input" ID="txtTelefoneRes" runat="server" ReadOnly="true"/>
                    </div>

                    <div class="field">
                        <asp:Label ID="Label16" class="label" Text="Telefone Cel:" runat="server" />
                        <asp:TextBox class="input" ID="txtTelefoneCel" runat="server" ReadOnly="true"/>
                    </div>

                    <div class="field">
                        <asp:Label ID="Label17" class="label" Text="Email" runat="server" />
                        <asp:TextBox class="input" ID="txtEmail" runat="server" ReadOnly="true"/>
                    </div>

                    <div class="field">
                        <asp:Label ID="Label21" class="label" Text="Num. Habilitação" runat="server" />
                        <asp:TextBox class="input" ID="txtCarteiraNum" runat="server" ReadOnly="true"/>
                    </div>

                    <div class="field">
                        <asp:Label ID="Label22" class="label" Text="Validade:" runat="server" />
                        <asp:TextBox ID="txtCarteiraVal" class="inputData" runat="server" Columns="10" MaxLength="10" ReadOnly="true"></asp:TextBox>
                    </div>

                    <div class="field">
                        <asp:Label ID="Label23" class="label" Text="Categoria:" runat="server" />
                        <asp:RadioButtonList class="input" ID="rblCarteiraCat" runat="server"
                            RepeatDirection="Horizontal">
                            <asp:ListItem>B</asp:ListItem>
                            <asp:ListItem>C</asp:ListItem>
                            <asp:ListItem>D</asp:ListItem>
                            <asp:ListItem>E</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>

                    <div class="field">
                        <asp:Label ID="Label24" class="label" Text="Num. Cartão:" runat="server" />
                        <asp:TextBox class="input" ID="txtNumCartao" runat="server" ReadOnly="true" />
                    </div>

                    <div class="field">
                        <asp:Label ID="Label25" class="label" Text="Validade:" runat="server" />
                        <asp:TextBox ID="txtCartaoVal" class="inputData" runat="server" Columns="10" MaxLength="10" ReadOnly="true"></asp:TextBox>
                    </div>

                    <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>

                    <%--<asp:Button class="button" Text="Novo" ID="btnNovo" runat="server" 
                            onclick="btnNovo_Click" />--%>
                    <%--&nbsp;&nbsp;&nbsp;--%>
<%--                    <asp:Button class="button" Text="Salvar" ID="btnSalvar" runat="server" 
                            onclick="btnSalvar_Click" />--%>

                    <p>
                    </p>

                    <p>
                    </p>

                    <p>
                    </p>

                    <p>
                    </p>

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

