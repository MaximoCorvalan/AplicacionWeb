<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListaMedicos.aspx.cs" Inherits="TPIntegrador.AdminMedicos.ListaMedicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="StyleLista.css" rel="stylesheet" />
    <title>Lista de Médicos</title>
     
    <style>
        dialog {
    position: fixed;
    background-color: transparent;
    width: 100vw;
    height: 100vh;
    border: none;
    box-sizing: border-box;
}

        .modal__content {
    margin: auto;
    border-radius: 10px;
    border: 2px solid black;
    margin-top: 70px;
    padding: 3px;
    background-color: aliceblue;
    width: 30%;
    text-align: center;
    height: 20%;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
           <dialog open id="dialogo"  runat="server" visible="false">
                <div class="modal__content" runat="server" style="border-radius:60px">
                    <h2 class="modal-titulo" runat="server">
                        <asp:Label ID="lblDialog" runat="server" Text="¿Estás seguro que deseas eliminar este registro ?"></asp:Label>
                    </h2>
                    <asp:Button ID="btnAceptarDialog" runat="server" Text="aceptar" Height="32px" Width="72px" CssClass="auto-style3" OnClick="btnAceptarDialog_Click" />
                     <asp:Button ID="btnCancelarDialog" runat="server" Text="Cancelar" Height="32px" Width="70px" OnClick="BtnCancelarDialog_Click" CssClass="auto-style4" />
       
               </div>
            </dialog>

         <div class="auto-style1">
             <asp:Label ID="lblUsuario" runat="server" Text="Usuario:"></asp:Label>
            <h2 class="header">Lista de Médicos</h2>
             <asp:LinkButton ID="inicio" runat="server" ForeColor="#006600" PostBackUrl="~/Inicio/Inicio.aspx">INICIO</asp:LinkButton>
            <asp:Button ID="btnFiltros" runat="server" Text="Filtrar" CssClass="auto-style5" OnClick="btnFiltros_Click"/>

           <div class="form-grid">
            <asp:GridView ID="gvMedicos" runat="server" AutoGenerateColumns="False" CssClass="table" AutoGenerateSelectButton="True" OnSelectedIndexChanging="gvMedicos_SelectedIndexChanging" AllowPaging="True" OnPageIndexChanging="gvMedicos_PageIndexChanging" PageSize="5">
                <Columns>
                    <asp:BoundField DataField="Legajo" HeaderText="Legajo" />
                    <asp:BoundField DataField="DNI" HeaderText="DNI" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" />
                    <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                    <asp:BoundField DataField="Correo" HeaderText="Correo" />
                    <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                    <asp:BoundField DataField="Especialidad" HeaderText="Especialidad" />
                    <asp:BoundField DataField="Dias" HeaderText="Días" />
                    <asp:BoundField DataField="Horario" HeaderText="Horario" />
                </Columns>
            </asp:GridView>
           </div>
            <br />
            <asp:LinkButton ID="lkbtnAgregar" runat="server" BorderStyle="None" ForeColor="#006600" OnClick="lkbtnAgregar_Click">Agregar</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lkbtnModificar" runat="server" ForeColor="#006600" OnClick="lkbtnModificar_Click">Modificar</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lkbtnEliminar" runat="server" ForeColor="#006600" OnClick="lkbtnEliminar_Click">Eliminar</asp:LinkButton>
             <br />
             <br />
             Buscar por:
             <asp:DropDownList ID="ddlBuscar" runat="server" Height="25px" Width="122px" AutoPostBack="True" OnSelectedIndexChanged="ddlBuscar_SelectedIndexChanged">
                 <asp:ListItem Value="Nombre" Selected="True">Nombre</asp:ListItem>
                 <asp:ListItem>Apellido</asp:ListItem>
                 <asp:ListItem>Legajo</asp:ListItem>
                 <asp:ListItem Value="DNI">DNI</asp:ListItem>
             </asp:DropDownList>
             &nbsp;&nbsp;&nbsp;&nbsp; Ingrese valor:
             <asp:TextBox ID="txtvalor" runat="server" Height="21px" Width="130px"></asp:TextBox>
             &nbsp;&nbsp;
             &nbsp;&nbsp;
             <asp:Label ID="lblFiltro" runat="server" Text="Filtrar por" Visible="False"></asp:Label>
             <asp:DropDownList ID="ddlFiltro" runat="server" CssClass="auto-style6" Height="37px" Visible="False" Width="129px">
                 <asp:ListItem>Especialidad</asp:ListItem>
             </asp:DropDownList>
             <asp:Label ID="lblFiltroValor" runat="server" Text="Ingrese especialidad" Visible="False"></asp:Label>
             &nbsp;<asp:DropDownList ID="ddlEspecialidad" runat="server" CssClass="auto-style7" Height="37px" Visible="False" Width="119px">
                 <asp:ListItem>Especialidad</asp:ListItem>
             </asp:DropDownList>
             <asp:Button ID="btnBuscar" runat="server" CssClass="auto-style2" Height="28px" OnClick="btnBuscar_Click" Text="Buscar" Width="84px" ValidationGroup="grupo1" />
        </div>
            <asp:Label ID="lblErrorGrilla" runat="server" ForeColor="Red" Text="ERROR DE CARGADO DE GRILLA"></asp:Label>
        <asp:ValidationSummary ID="ValidationSummary" runat="server" HeaderText="Requisitos" ShowMessageBox="True" ShowSummary="False" ValidationGroup="grupo1" />
    </form>
</body>
</html>
