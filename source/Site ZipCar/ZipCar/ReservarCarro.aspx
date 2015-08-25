<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="~/ReservarCarro.aspx.cs" Inherits="Forms_Clientes" %>

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
                    Reserva de Veículos
                </h3>
                <p>
                    <div class="field">
                        <asp:Label ID="Label2" class="label" Text="Garagem Retirada:" runat="server" 
                            Width="203px" />
                        <asp:DropDownList class="input" ID="dropGaragemRetirada" runat="server">
                        </asp:DropDownList>
                    </div>
              
                    <div class="field">
                        <asp:Label ID="lblDataRetirada" class="label" Text="Data Retirada:" 
                            runat="server" Width="203px" />
                        <asp:TextBox ID="txtDataRetirada" class="inputData" runat="server" Columns="10" MaxLength="10"
                            onKeyDown="formataData(this,event)"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender" runat="server" PopupButtonID="imgCalendario"
                            TargetControlID="txtDataRetirada" />
                        <asp:Image ID="imgCalendario" ImageUrl="~/Images/07_calendar.ico" Width="20px" Height="20px"
                            runat="server" />
                    </div>
                    <div class="field">
                        <asp:Label ID="Label1" class="label" Text="Garagem Entrega:" runat="server" Width="202px" />
                        <asp:DropDownList ID="dropGaragemEntrega" runat="server" class="input">
                        </asp:DropDownList>
                    </div>
                    <div class="field">
                        <asp:Label ID="lblDataEntrega" class="label" Text="Data Entrega:" 
                            runat="server" Width="203px" />
                        <asp:TextBox ID="txtDataEntrega" class="inputData" runat="server" Columns="10" MaxLength="10"
                            onKeyDown="formataData(this,event)"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender2" runat="server" PopupButtonID="imgCalendario2"
                            TargetControlID="txtDataEntrega" />
                        <asp:Image ID="imgCalendario2" ImageUrl="~/Images/07_calendar.ico" Width="20px" Height="20px"
                            runat="server" />
                    </div>
                    <asp:Button class="button" Text="Consultar" ID="btnConsultar" runat="server" 
                        OnClick="btnConsultar_Click" />
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
            <div id="Layer1" style="position: absolute; z-index: 1; left: 45%; top: 70%;">
                Processando . . .
                <br />
                <asp:Image ID="image1" ImageUrl="~/Images/loading.gif" runat="server" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>
