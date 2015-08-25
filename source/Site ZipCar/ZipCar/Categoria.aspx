<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Categoria.aspx.cs" Inherits="Categoria" %>

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
                    Cadastro de categoria de carros
                </h3>
                
                <p>
                    
                    <div class="field">
                        <asp:Label ID="Label2" class="label" Text="Descrição:" runat="server" />
                        <asp:TextBox class="input" ID="txtDescricao" runat="server" Width="391px"/>
                    </div>

                    <asp:GridView runat="server" class="input" ID="grvCategorias" 
                        AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" 
                        BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" 
                        ForeColor="Black" onrowcommand="grvCategorias_RowCommand" Width="536px" 
                        AllowPaging="True" OnPageIndexChanging="GridView_PageIndexChanging" > 
                        <Columns>
                            <asp:BoundField DataField="idCategoria" HeaderText="ID" >
                                <HeaderStyle Width="50px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="descricao" HeaderText="Descrição" /> 
                                
                            <asp:ButtonField ButtonType="Button" Text="Selecionar" >
                                <HeaderStyle Width="100px" />
                            </asp:ButtonField>
                            <asp:ButtonField ButtonType="Button" Text="Excluir" />
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

                    <asp:Button class="button" Text="Salvar" ID="btnSalvar" runat="server" 
                        onclick="btnSalvar_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button class="button" Text="Novo" ID="btNovo" runat="server" 
                        onclick="btNovo_Click" />


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