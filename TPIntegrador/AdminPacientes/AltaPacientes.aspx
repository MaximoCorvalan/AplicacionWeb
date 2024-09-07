<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AltaPacientes.aspx.cs" Inherits="TPIntegrador.AdminPacientes.AltaPacientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="StylePacientes.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            padding: 4px;
            margin: 13px;
        }
            dialog {
     position: fixed;
    background-color: transparent;
    width: 100vw;
     height: 100vh;
     border:none;
    box-sizing: border-box;
   }

    .modal__content {
    margin: auto;
    border-radius: 10px;
    border:2px solid black;
    margin-top: 70px;
    padding: 3px;
    background-color: aliceblue;
    width: 30%;
    text-align: center;
    height: 20%;
}
      .auto-style3 {
            margin-right: 0px;
            margin-top: 21px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
                                     <dialog open id="dialogo" runat="server" visible="false">
        <div class="modal__content" runat="server" style="border-radius:30px">
            <h3 runat="server" style="font-size: 24px">
                <asp:Label ID="lblDialog" runat="server" Text="Agregado correctamente"></asp:Label>
            </h3>
            <asp:Button ID="btnAceptarDialog" runat="server" Text="aceptar" Height="32px" Width="72px" CssClass="auto-style3" OnClick="btnAceptarDialog_Click" />

        </div>
                  
    </dialog>
         <div class="conteiner">

    <h2>Alta pacientes</h2>
                 <asp:Label ID="lblUsuario" runat="server" Text="Usuario:"></asp:Label>
    <h3>Datos personales</h3>
         
        <div class="datos">
                    <label for="txtNombre">
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Ingrese un nombre." ForeColor="#FF3300" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Ingrese un nombre válido." ForeColor="#FF3300" ValidationExpression="^[a-zA-Z]+$" ValidationGroup="grupo1">*</asp:RegularExpressionValidator>
                    </label>
            <asp:TextBox ID="txtNombre"  runat="server" CssClass="TextBox"></asp:TextBox>
            <asp:TextBox ID="txtApellido" runat="server" CssClass="TextBox"></asp:TextBox>
                    <label for="txtApellido">
                    <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" ErrorMessage="Ingrese un apellido." ForeColor="#FF3300" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
            <label for="txtNombre"><asp:RegularExpressionValidator ID="revApellido" runat="server" ControlToValidate="txtApellido" ErrorMessage="Ingrese un apellido válido." ForeColor="#FF3300" ValidationExpression="^[a-zA-Z]+$" ValidationGroup="grupo1">*</asp:RegularExpressionValidator>
                    </label>
                    </label>
        </div>

        <div class="datos">
                    <label for="txtDNI">
                    <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI" ErrorMessage="Ingrese un DNI." ForeColor="#FF3300" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
             <asp:RegularExpressionValidator ID="revDNI" runat="server" ControlToValidate="txtDNI" ErrorMessage="Ingrese un DNI válido." ForeColor="#FF3300" ValidationExpression="^[0-9]*$" ValidationGroup="grupo1">*</asp:RegularExpressionValidator>
                    </label>
             <asp:TextBox ID="txtDni"   runat="server" CssClass="auto-style1" Width="220px"></asp:TextBox>
            <asp:DropDownList ID="ddlSexo"  runat="server" CssClass="TextBox">
                <asp:ListItem Selected="True">-- Seleccione sexo --</asp:ListItem>
                <asp:ListItem>Masculino</asp:ListItem>
                <asp:ListItem>Femenino</asp:ListItem>
                <asp:ListItem>Otro</asp:ListItem>
            </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="ddlSexo" ErrorMessage="Seleccione un sexo." ForeColor="#FF3300" InitialValue="-- Seleccione sexo --" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
        </div>

        <div class="datos">
                    <label for="txtTelefono"> <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtNumber" ErrorMessage="Ingrese un número de teléfono." ForeColor="#FF3300" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txtNumber" ErrorMessage="Ingrese solo números." ForeColor="#FF3300" ValidationExpression="^[0-9]*$" ValidationGroup="grupo1">*</asp:RegularExpressionValidator>
            </label>
            <asp:TextBox ID="txtNumber" runat="server" CssClass="TextBox"></asp:TextBox>
            <asp:TextBox ID="txtNacionalidad" runat="server" CssClass="TextBox"></asp:TextBox>
                    <label for="txtNacionalidad">
                    <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="txtNacionalidad" ErrorMessage="Ingrese una nacionalidad." ForeColor="#FF3300" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
            <label for="txtNombre"><asp:RegularExpressionValidator ID="revNacionalidad" runat="server" ControlToValidate="txtNacionalidad" ErrorMessage="Ingrese una nacionalidad válida." ForeColor="#FF3300" ValidationExpression="^[a-zA-Z]+$" ValidationGroup="grupo1">*</asp:RegularExpressionValidator>
                    </label>
                    </label>
        </div>

        <div class="datos">
            <asp:DropDownList ID="ddlProvincia" runat="server" CssClass="auto-style1" Width="220px" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged">
                <asp:ListItem>-- Seleccione Provincia --</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" ControlToValidate="ddlProvincia" ErrorMessage="Seleccione una provincia." ForeColor="#FF3300" InitialValue="-- Seleccione Provincia --" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
            <asp:DropDownList ID="ddLocalidad" runat="server" CssClass="auto-style1" Width="220px">
            </asp:DropDownList>
        </div>

        <div class="datos">
                    <label for="txtCorreoElectronico">
                    <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtEmail" ErrorMessage="Ingrese un correo electrónico." ForeColor="#FF3300" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revCorreo" runat="server" ControlToValidate="txtEmail" ErrorMessage="Ingrese un correo electrónico válido." ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="grupo1">*</asp:RegularExpressionValidator>
                    </label>
           <asp:TextBox ID="txtEmail" runat="server" CssClass="TextBox" EnableTheming="True"></asp:TextBox>
           <asp:TextBox ID="txtDireccion" runat="server" CssClass="TextBox"></asp:TextBox>
                    <label for="txtDireccion">
                    <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Ingrese una direccion." ForeColor="#FF3300" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Ingrese una dirección válida." ForeColor="#FF3300" ValidationExpression="\w+(\s\w+)" ValidationGroup="grupo1">*</asp:RegularExpressionValidator>
                    </label>
        </div>

        <div class="date">
            <p>Ingrese fecha de nacimiento:<label for="txtNacionalidad"><asp:RequiredFieldValidator ID="rfvFechanacimiento" runat="server" ControlToValidate="fecha" ErrorMessage="Ingrese una fecha de nacimiento." ForeColor="#FF3300" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                    </label>
                    </p>
            <input type="date" CssClass="TextBox" id="fecha"  runat="server"/>
        </div>

        <div>
            <asp:Button ID="btnAceptar"  CssClass="btn" runat="server" Text="Aceptar" Width="95px" OnClick="btnAceptar_Click" ValidationGroup="grupo1" />
            <asp:Button ID="btnCancelar" CssClass="btn" runat="server" Text="Cancelar" Width="95px" OnClick="btnCancelar_Click" />
        </div>
    </div>
        <asp:ValidationSummary ID="ValidationSummary" runat="server" HeaderText="Requisitos" ShowMessageBox="True" ShowSummary="False" ValidationGroup="grupo1" />
   </form>
</body>
</html>
