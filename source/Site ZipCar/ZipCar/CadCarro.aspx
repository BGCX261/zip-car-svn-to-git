<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="~/CadCarro.aspx.cs" Inherits="CadCarro" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:ScriptManager ID="ScriptManager1" EnableScriptGlobalization="true" EnableScriptLocalization="true" runat="server">
   </asp:ScriptManager>

   <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">      
        
     <%--   <Triggers>
            <asp:PostBackTrigger ControlID="btnSalvar" /> // Não lembro por que botei isso.
        </Triggers>--%>

        <ContentTemplate>
            
            <br />
            <br />
            <br />

            <div class="FormPadrao">
                
                <h3>
                    Cadastro de carros
                </h3>
                
                <p>
                    
                <div class="field">
                    <asp:Label class="label" ID="Label3" Text="Categoria:   " runat="server" />
	                <asp:DropDownList class="input" ID="ddlCategoria" runat="server" 
                        AutoPostBack="True" onselectedindexchanged="ddlCategoria_SelectedIndexChanged"> </asp:DropDownList>
                </div>

                <div class="field">
                    <asp:Label ID="Label5" class="label" Text="Marca:" runat="server" />
                    <asp:TextBox class="input" ID="txtMarca" runat="server" MaxLength="40" />
                </div>
                <div class="field">
                    <asp:Label ID="Label1" class="label" Text="Modelo:" runat="server" />
                    <asp:TextBox class="input" ID="txtModelo" runat="server" />
                </div>
                <div class="field">
                    <asp:Label ID="Label6" class="label" Text="Ano:" runat="server" />
                    <asp:TextBox ID="txtAno" class="inputData" runat="server" Columns="10" MaxLength="4"></asp:TextBox>
                </div>
                <div class="field">
                    <asp:Label ID="Label2" class="label" Text="Placa:" runat="server" />
                    <asp:TextBox class="input" ID="txtPlaca" name="txtPlaca" runat="server" MaxLength="8" onkeyup="formataPlaca(this,event);" />
                </div>
                <div class="field">
                    <asp:Label ID="Label4" class="label" Text="Renavam:" runat="server" />
                    <asp:TextBox class="input" ID="txtRenavam" runat="server" MaxLength="9" />
                </div>
                <div class="field">
                    <asp:Label ID="Label7" class="label" Text="Cor:" runat="server" />
                    <asp:TextBox class="input" ID="txtCor" runat="server" MaxLength="10"/>
                </div>
                <div class="field">
                    <asp:Label ID="Label8" class="label" Text="Complementos:" runat="server" />
                    <asp:CheckBoxList CssClass="input" ID="chklistEspecificacoes" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Text="Ar" />
                        <asp:ListItem Text="Direção" />
                        <asp:ListItem Text="4 Portas" />
                        <asp:ListItem Text="GPS" />
                    </asp:CheckBoxList>
                </div>

                <div class="field">
                    <asp:Label class="label" ID="Label9" Text="Valor Locação:" runat="server" />
	                <asp:TextBox class="input" ID="txtValorloc" Width="20%" Text="" runat="server" MaxLength="6" onkeyup="formataValor(this,event);"/>
                </div>

                <div class="field">
                    <asp:Label class="label" ID="Label11" Text="Garagem:   " runat="server" />
	                <asp:DropDownList class="input" ID="ddlGaragem" runat="server" AutoPostBack="True">  </asp:DropDownList>
                </div>

                <div class="field">
                    <asp:Label class="label" ID="Label10" Text="URL Imagem" runat="server" />
                    <asp:FileUpload ID="FileUploadURL" runat="server" CssClass="input"/>
                </div>

                <asp:Button class="button" Text="Salvar" ID="btnSalvar" runat="server" 
                        onclick="btnSalvar_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button class="button" Text="Novo" ID="btNovo" runat="server" 
                        onclick="btNovo_Click"  />

                <div class="field">
                    <asp:GridView runat="server" class="input" ID="grvCarros" 
                            AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" 
                            BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" 
                            ForeColor="Black" onrowcommand="grvCarros_RowCommand" Width="536px" 
                            AllowPaging="True" OnPageIndexChanging="GridView_PageIndexChanging"
                            PageSize="5"> 
                            <Columns>
                                <asp:BoundField DataField="idCarro" HeaderText="ID" >
                                    <HeaderStyle Width="50px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="marca" HeaderText="Marca"> 
                                    <HeaderStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="modelo" HeaderText="Modelo"> 
                                    <HeaderStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ano" HeaderText="Ano"> 
                                    <HeaderStyle Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="cor" HeaderText="Cor"> 
                                    <HeaderStyle Width="50px" />
                                </asp:BoundField>
                                <asp:ButtonField ButtonType="Button" Text="Selecionar" >
                                    <HeaderStyle Width="50px" />
                                </asp:ButtonField>
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="#4b6c9e" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                            <RowStyle BackColor="White" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
                    </div>
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

