<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListaPacientes.aspx.cs" Inherits="TPIntegrador.AdminPacientes.ListaPacientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="StyleLista.css" rel="stylesheet" />
    <title>Lista de Pacientes</title>
    <style type="text/css">
        .auto-style9 {
            margin-right: 39px;
            margin-top: 0px;
            margin-left: 27px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
      <dialog open id="dialogo" runat="server" visible="false">
        <div class="modal__content" runat="server" style="border-radius:60px">
            <h2 class="modal-titulo" runat="server">
                <asp:Label ID="lblDialog" runat="server" Text="¿Estás seguro que deseas eliminar este registro ?"></asp:Label>
            </h2>
            <asp:Button ID="btnAceptarDialog" runat="server" Text="aceptar" Height="32px" Width="72px" CssClass="auto-style3" OnClick="btnAceptarDialog_Click" />
             <asp:Button ID="btnCancelarDialog" runat="server" Text="Cancelar" Height="32px" Width="70px" OnClick="BtnCancelarDialog_Click" />

        </div>    
     </dialog>

        <div class="auto-style1">
           
                <asp:Label ID="lblUsuario" runat="server" Text="Usuario:"></asp:Label>
            <h2 class="header">Lista de Pacientes</h2>
                         <asp:LinkButton ID="inicio" runat="server" ForeColor="#006600" PostBackUrl="~/Inicio/Inicio.aspx">INICIO</asp:LinkButton>
             <asp:Button ID="btnFiltros" runat="server" Text="Filtrar" CssClass="auto-style5" OnClick="btnFiltros_Click"/>
            <asp:GridView ID="gvPacientes" runat="server" AutoGenerateColumns="False" CssClass="table" AutoGenerateSelectButton="True" OnSelectedIndexChanging="gvPacientes_SelectedIndexChanging" AllowPaging="True" OnPageIndexChanging="gvPacientes_PageIndexChanging" PageSize="5">
                <Columns>
                    <asp:BoundField DataField="DNI" HeaderText="DNI" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                    <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                    <asp:BoundField DataField="Correo" HeaderText="Correo" />
                    <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                    <asp:BoundField DataField="Provincia" HeaderText="Provincia" />
                    <asp:BoundField DataField="Localidad" HeaderText="Localidad" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:LinkButton ID="lkbtnAgregar" runat="server" BorderStyle="None" ForeColor="#006600" PostBackUrl="~/AdminPacientes/AltaPacientes.aspx" OnClick="lkbtnAgregar_Click">Agregar</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lkbtnModificar" runat="server" ForeColor="#006600" OnClick="lkbtnModificar_Click">Modificar</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lkbtnEliminar" runat="server" ForeColor="#006600" OnClick="lkbtnEliminar_Click">Eliminar</asp:LinkButton>
            <br />
            <br />
            Buscar por:
            <asp:DropDownList ID="ddlBuscar" runat="server" Height="21px" Width="114px" AutoPostBack="True" OnSelectedIndexChanged="ddlBuscar_SelectedIndexChanged">
                <asp:ListItem Value="Nombre" Selected="True">Nombre</asp:ListItem>
                <asp:ListItem>Apellido</asp:ListItem>
                <asp:ListItem Value="DNI">DNI</asp:ListItem>
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ingrese valor:
            <asp:TextBox ID="txtvalor" runat="server" Height="16px" Width="112px" CssClass="auto-style6"></asp:TextBox>
             <asp:Label ID="lblFiltro" runat="server" Text="Elija provincia " Visible="False"></asp:Label>
            <asp:DropDownList ID="ddlProvincia" runat="server" Height="21px" Width="114px" AutoPostBack="True" CssClass="auto-style8" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged" Visible="False">
            </asp:DropDownList>
             <asp:Label ID="lblFiltroValor" runat="server" Text="elija localidad " Visible="False"></asp:Label>

            <asp:DropDownList ID="ddllocalidad" runat="server" Height="21px" Width="114px" CssClass="auto-style8" Visible="False">
            </asp:DropDownList>
            <asp:Button ID="btnBuscar" runat="server" CssClass="auto-style2" Height="28px" OnClick="btnBuscar_Click" Text="Buscar" Width="81px" ValidationGroup="grupo1" />


            </div>
       <asp:Label ID="lblErrorGrilla" runat="server" ForeColor="Red" Text="ERROR DE CARGADO DE GRILLA"></asp:Label>
        <asp:ValidationSummary ID="ValidationSummary" runat="server" HeaderText="Requisitos" ShowMessageBox="True" ShowSummary="False" ValidationGroup="grupo1" />
    </form>
</body>
</html>
