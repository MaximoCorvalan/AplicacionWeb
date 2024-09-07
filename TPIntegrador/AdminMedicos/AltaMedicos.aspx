<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AltaMedicos.aspx.cs" Inherits="TPIntegrador.AdminMedicos.AltaMedicos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="StyleMedicos.css" rel="stylesheet" />
     <title>Agregar Médico</title>
    <style type="text/css">
        .estado{
           font-size:20px;
           
            margin:auto;
            margin-top:20px;
            text-align:center;
        }
        .auto-style1 {
            border-radius: 5px;
            padding: 10px;
            margin-left: 160px;
            background-color: #4CAF50;
            margin-top: 18px;
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
            margin-top: 2px;
        }

    </style>
</head>
<body id="body" runat="server">
   
    <form id="form1" runat="server">
         
    <div class="form-container">
        
       <h2>Agregar Médico</h2>
             <dialog open id="dialogo" runat="server" visible="false">
        <div class="modal__content" runat="server" style="border-radius:30px">
            <h3 runat="server" style="font-size: 24px">
                <asp:Label ID="lblDialog" runat="server" Text="Agregado correctamente"></asp:Label>
            </h3>
            <asp:Button ID="btnAceptarDialog" runat="server" Text="aceptar" Height="32px" Width="72px" CssClass="auto-style3" OnClick="btnAceptarDialog_Click" ValidationGroup="Grupo40" />

        </div>
                  
    </dialog>
          <div class="form-group">
                <div>
                    <label for="txtLegajo">Legajo:
                    <asp:RequiredFieldValidator ID="rfvLegajo" runat="server" ControlToValidate="txtLegajo" ErrorMessage="Ingrese un legajo." ForeColor="#FF3300" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                    <label for="txtTelefono"><asp:RegularExpressionValidator ID="revLegajo" runat="server" ControlToValidate="txtLegajo" ErrorMessage="Ingrese un legajo válido." ForeColor="#FF3300" ValidationExpression="^[0-9]*$" ValidationGroup="grupo1">*</asp:RegularExpressionValidator>
                    </label>
                    </label>
&nbsp;<asp:TextBox ID="txtLegajo" runat="server" />
                </div>
                <div>
                    <label for="txtDNI">DNI:
                    <asp:RequiredFieldValidator ID="rfvDNI" runat="server" ControlToValidate="txtDNI" ErrorMessage="Ingrese un DNI." ForeColor="#FF3300" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revDNI" runat="server" ControlToValidate="txtDNI" ErrorMessage="Ingrese un DNI válido." ForeColor="#FF3300" ValidationExpression="^[0-9]*$" ValidationGroup="grupo1">*</asp:RegularExpressionValidator>
                    </label>
&nbsp;<asp:TextBox ID="txtDNI" runat="server" />
                </div>
                <div>
                    <label for="txtNombre">Nombre:
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Ingrese un nombre." ForeColor="#FF3300" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="Ingrese un nombre válido." ForeColor="#FF3300" ValidationExpression="^[a-zA-Z]+$" ValidationGroup="grupo1">*</asp:RegularExpressionValidator>
                    </label>
&nbsp;<asp:TextBox ID="txtNombre" runat="server" />
                </div>
                <div>
                    <label for="txtApellido">Apellido:
                    <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" ErrorMessage="Ingrese un apellido." ForeColor="#FF3300" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                    <label for="txtNombre"><asp:RegularExpressionValidator ID="revApellido" runat="server" ControlToValidate="txtApellido" ErrorMessage="Ingrese un apellido válido." ForeColor="#FF3300" ValidationExpression="^[a-zA-Z]+$" ValidationGroup="grupo1">*</asp:RegularExpressionValidator>
                    </label>
                    </label>
                    &nbsp;<asp:TextBox ID="txtApellido" runat="server" />
                </div>
             
                <div>
                    <label for="ddlSexo">Sexo:</label>
                        <asp:DropDownList ID="ddlSexo" runat="server" Width="335px">
                            <asp:ListItem>-- Seleccione sexo --</asp:ListItem>
                        <asp:ListItem Text="Masculino" Value="M" />
                        <asp:ListItem Text="Femenino" Value="F" />
                            <asp:ListItem>Otro</asp:ListItem>
                    </asp:DropDownList>
                &nbsp;<asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="ddlSexo" ErrorMessage="Seleccione un sexo." ForeColor="#FF3300" InitialValue="-- Seleccione sexo --" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                </div>
                <div>
                    <label for="txtNacionalidad">Nacionalidad:
                    <asp:RequiredFieldValidator ID="rfvNacionalidad" runat="server" ControlToValidate="txtNacionalidad" ErrorMessage="Ingrese una nacionalidad." ForeColor="#FF3300" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                    <label for="txtNombre"><asp:RegularExpressionValidator ID="revNacionalidad" runat="server" ControlToValidate="txtNacionalidad" ErrorMessage="Ingrese una nacionalidad válida." ForeColor="#FF3300" ValidationExpression="^[a-zA-Z]+$" ValidationGroup="grupo1">*</asp:RegularExpressionValidator>
                    </label>
                    </label>
                    &nbsp;<asp:TextBox ID="txtNacionalidad" runat="server" />
                </div>
                <div class="date">
                    <label for="inputFecha">Fecha de Nacimiento:&nbsp;&nbsp; </label>
                    <label for="txtNacionalidad">
                    <asp:RequiredFieldValidator ID="rfvFechanacimiento" runat="server" ControlToValidate="inputFecha" ErrorMessage="Ingrese una fecha de nacimiento." ForeColor="#FF3300" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                    </label>
                    &nbsp;<input ID="inputFecha" type="date" runat="server" CssClass="TextBox" />
                </div>
                <div>
                    <label for="txtDireccion">Dirección:
                    <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Ingrese una direccion." ForeColor="#FF3300" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="Ingrese una dirección válida." ForeColor="#FF3300" ValidationExpression="\w+(\s\w+)" ValidationGroup="grupo1">*</asp:RegularExpressionValidator>
                    </label>
                    &nbsp;<asp:TextBox ID="txtDireccion" runat="server" />
                </div>
                <div>
                    <label for="ddlLocalidad">Localidad:</label>
                    <asp:DropDownList ID="ddlLocalidad" runat="server" Width="335px">
                    </asp:DropDownList>
                </div>
                <div>
                    <label for="ddlProvincia">Provincia:</label>
                    <asp:DropDownList ID="ddlProvincia" runat="server" Width="335px" AutoPostBack="True" OnSelectedIndexChanged="ddlProvincia_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
                <div>
                    <label for="txtCorreoElectronico">Correo Electrónico:
                    <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtCorreoElectronico" ErrorMessage="Ingrese un correo electrónico." ForeColor="#FF3300" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revCorreo" runat="server" ControlToValidate="txtCorreoElectronico" ErrorMessage="Ingrese un correo electrónico válido." ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="grupo1">*</asp:RegularExpressionValidator>
                    </label>
                    &nbsp;<asp:TextBox ID="txtCorreoElectronico" runat="server" TextMode="Email" />
                </div>
                <div>
                    <label for="txtContrasena">Contraseña:
                    <asp:RequiredFieldValidator ID="rfvContrasena" runat="server" ControlToValidate="txtContrasena" ErrorMessage="Ingrese una contraseña." ForeColor="#FF3300" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revContrasena" runat="server" ControlToValidate="txtContrasena" ErrorMessage="La contraseña debe contener mínimo 8 caracteres, al menos una letra y un número. " ForeColor="#FF3300" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" ValidationGroup="grupo1">*</asp:RegularExpressionValidator>
                    </label>
                    &nbsp;<asp:TextBox ID="txtContrasena" runat="server" TextMode="Password" />
                </div>
                <div>
                    <label for="txtContrasenaRep">Repita la contraseña:
                    <asp:RequiredFieldValidator ID="rfvContrasenaRep" runat="server" ControlToValidate="txtContrasenaRep" ErrorMessage="Repita la contraseña." ForeColor="#FF3300" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvContrasenaRep" runat="server" ControlToCompare="txtContrasena" ErrorMessage="Contraseña incorrecta." ControlToValidate="txtContrasenaRep" ForeColor="#FF3300" ValidationGroup="grupo1">*</asp:CompareValidator>
                    </label>
                    &nbsp;<asp:TextBox ID="txtContrasenaRep" runat="server" TextMode="Password" />
                </div>
                <div>
                    <label for="txtTelefono">Teléfono: <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Ingrese un número de teléfono." ForeColor="#FF3300" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="Ingrese solo números." ForeColor="#FF3300" ValidationExpression="^[0-9]*$" ValidationGroup="grupo1">*</asp:RegularExpressionValidator>
                    </label>
&nbsp;<asp:TextBox ID="txtTelefono" runat="server" TextMode="Phone" />
                </div>
                <div>
                    <label for="ddlEspecialidad">Especialidad:</label>
                    <asp:DropDownList ID="ddlEspecialidad" runat="server" Width="335px">
                    </asp:DropDownList>
                </div>
                <div>
                    <label for="txtDias">Días: </label>
                    <br />
                   
                    
                    <asp:CheckBoxList ID="cblDias" runat="server" Height="22px" Width="354px" CssClass="dias" RepeatDirection="Horizontal" TextAlign="Left" >
                        <asp:ListItem>Lunes</asp:ListItem>
                        <asp:ListItem>Martes</asp:ListItem>
                        <asp:ListItem>Miercoles</asp:ListItem>
                        <asp:ListItem>Jueves</asp:ListItem>
                        <asp:ListItem>Viernes</asp:ListItem>
                        <asp:ListItem>Sabado</asp:ListItem>
                    </asp:CheckBoxList>
                </div>
                <div>
                    <label for="txtHorario">Horario:</label>
                    <asp:RequiredFieldValidator ID="rfvHorarios" runat="server" ControlToValidate="rblHorarios" ErrorMessage="Seleccione un horario." ForeColor="#FF3300" ValidationGroup="grupo1">*</asp:RequiredFieldValidator>                    <br />
                    <asp:RadioButtonList ID="rblHorarios" runat="server" CellPadding="12" Font-Size="9pt" RepeatDirection="Horizontal">
                        <asp:ListItem>9-12</asp:ListItem>
                        <asp:ListItem>12-15</asp:ListItem>
                        <asp:ListItem>15-18</asp:ListItem>
                        <asp:ListItem>18-21</asp:ListItem>
                    </asp:RadioButtonList>
                   
                    
                </div>
                <div>
                    <asp:Button ID="btnAceptar"  CssClass="auto-style1" runat="server" Text="Aceptar" Width="95px" OnClick="btnAceptar_Click" ValidationGroup="grupo1" />
                    <asp:Button ID="btnCancelar" CssClass="btn" runat="server" Text="Cancelar" Width="95px" OnClick="btnCancelar_Click" />
                    
                </div>
          </div>
                 
     </div>
    <asp:ValidationSummary ID="ValidationSummary" runat="server" HeaderText="Requisitos" ShowMessageBox="True" ShowSummary="False" ValidationGroup="grupo1" />
    </form>
</body>
</html>
