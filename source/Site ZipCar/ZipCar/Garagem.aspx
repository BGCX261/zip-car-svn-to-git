<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Garagem.aspx.cs" Inherits="Garagem" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <asp:ScriptManager ID="ScriptManager1" EnableScriptGlobalization="true" EnableScriptLocalization="true" runat="server" EnablePageMethods = "true">
   </asp:ScriptManager>

   <asp:UpdatePanel ID="UpdatePanel1" runat="server">      

        <ContentTemplate>
            <br />
            <br />
            <br />

            <div class="FormPadrao">
                
                <h3>
                    Cadastro de Garagens
                </h3>
                
                <p>
                    <div class="field">
                        <asp:Label ID="Label2" class="label" Text="Nome:" runat="server" />
                        <asp:TextBox class="input" ID="txtNome" runat="server"/>
                        <asp:Button class="button" Text="Buscar" ID="btnBuscar" runat="server" onclick="btnBuscar_Click" />
                        <ajaxToolkit:AutoCompleteExtender 
                                ServiceMethod="SearchGaragens"
                                MinimumPrefixLength="2"
                                CompletionInterval="100" EnableCaching="false" CompletionSetCount="10"
                                TargetControlID="txtNome"
                                ID="AutoCompleteExtender1" runat="server" FirstRowSelected = "true" />
                        
                    </div>

                    <div class="field">
                        <asp:Label ID="Label5" class="label" Text="Cidade:" runat="server" />
                        <asp:TextBox class="input" ID="txtCidade" runat="server" />
                    </div>

                    <div class="field">
                        <asp:Label ID="Label11" class="label" Text="Bairro:" runat="server" />
                        <asp:TextBox class="input" ID="txtBairro" runat="server" />
                    </div>

                    <div class="field">
                        <asp:Label ID="Label7" class="label" Text="UF:" runat="server" />
                        <asp:TextBox class="input" ID="txtUf" runat="server" Columns="2" MaxLength="2" Width="30px" />
                    </div>

                    <div class="field">
                        <asp:Label ID="Label12" class="label" Text="CEP:" runat="server" />
                        <asp:TextBox class="input" ID="txtCEP" runat="server" Columns="9" MaxLength="9" Width="100px"  onKeydown="formataCEP(this,event)"/>
                    </div>

                    <div class="field">
                        <asp:Label ID="Label8" class="label" Text="Logradouro:" runat="server" />
                        <asp:TextBox class="input" ID="txtLogradouro" runat="server" />
                    </div>

                    <div class="field">
                        <asp:Label ID="Label9" class="label" Text="Número:" runat="server" />
                        <asp:TextBox class="input" ID="txtNumero" runat="server" Columns="7" MaxLength="7" Width="100px" onKeydown="mascara(this,soNumeros)" />
                    </div>

                    <div class="field">
                        <asp:Label ID="Label10" class="label" Text="Complemento:" runat="server" />
                        <asp:TextBox class="input" ID="txtComplemento" runat="server" MaxLength="20" />
                    </div>

                    <div class="field">
                        <asp:Label ID="Label1" class="label" Text="Capacidade:" runat="server" />
                        <asp:TextBox class="input" ID="txtCapacidade" runat="server" Columns="10" MaxLength="4" Width="100px" onKeydown="mascara(this,soNumeros)" />
                    </div>
                    
                    <div class="field">
                        <asp:Label ID="Label3" class="label" Text="Latitude:" runat="server" />
                        <asp:TextBox class="input" ID="txtLatitude" runat="server" Columns="10" MaxLength="10" Width="100px" />
                    </div>

                    <div class="field">
                        <asp:Label ID="Label4" class="label" Text="Longitude:" runat="server" />
                        <asp:TextBox class="input" ID="txtLongitude" runat="server" Columns="10" MaxLength="10" Width="100px" />
                    </div>

                    <asp:Button class="button" Text="Salvar" ID="btnSalvar" runat="server" 
                        onclick="btnSalvar_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <asp:Button class="button" Text="Limpar" ID="btnLimpar" runat="server" 
                        onclick="btnLimpar_Click" />
                
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

