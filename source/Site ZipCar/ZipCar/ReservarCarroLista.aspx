<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="~/ReservarCarroLista.aspx.cs" Inherits="Forms_Clientes" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .field
        {
            height: 38px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" EnableScriptGlobalization="true" EnableScriptLocalization="true"
        runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <br />
            <br />
            <br />
            <div class="FormPadrao">
                <h3>
                    Lista de Veículos para Reserva
                </h3>

                    <div class="field">
                        <asp:Label ID="lblDataRetirada" class="label" Text="Data Retirada:" 
                            runat="server" Width="150px" />
                        <asp:Label ID="lblConsDataRetirada" class="label" runat="server" />
                    </div>

                    <div class="field">
                        <asp:Label ID="lblGaragemRetirada" class="label" Text="Garagem Retirada:" 
                            runat="server" Width="150px" />
                        <asp:Label ID="lblConsGaragemRetirada" class="label" runat="server" />
                    </div>

                    <div class="field">
                        <asp:Label ID="lblDataEntrega" class="label" Text="Data Entrega:" 
                            runat="server" Width="150px" />
                        <asp:Label ID="lblConsDataEntrega" class="label" runat="server" />

                    </div>
                    <div class="field">
                        <asp:Label ID="lblGaragemEntrega" class="label" Text="Garagem Entrega:" runat="server"  Width="150px"/>
                        <asp:Label ID="lblConsGaragemEntrega" class="label" runat="server" />
                    </div>


                <p>
                    <asp:GridView ID="gridCarros" runat="server" AutoGenerateColumns="False" 
                        BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" 
                        CellPadding="4" CellSpacing="2" ForeColor="Black" Height="169px" 
                        Width="498px">
                        <Columns>
                            <asp:BoundField HeaderText="Marca" DataField="marca" />
                            <asp:BoundField HeaderText="Modelo" DataField="modelo" />
                            <asp:BoundField HeaderText="Placa" DataField="placa" />
                            <asp:BoundField HeaderText="Ano" DataField="ano" />
                            <asp:ButtonField Text="Reservar" ButtonType="Button" />
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
                </p>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <div id="Layer1" style="position: absolute; z-index: 1; left: 45%; top: 70%;">
                Processando . . .
                <br />
                <asp:Image ID="image1" ImageUrl="~/Images/loading.gif" runat="server" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
