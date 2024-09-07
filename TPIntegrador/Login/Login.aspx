<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPIntegrador.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title> 
    <link href="Style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">

  <div class="wrapper">
                <h1>cCLINICA MEDICA</h1>
                
                    <img src="hospita.png"/>
             

          <div class="login">
               <h3>Inicie Sesión</h3>
                <div class="txt">
                    <label>Nombre:</label><br/>
                    <asp:TextBox ID="txtNombre" runat="server" Height="24px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNombre" ErrorMessage="*" Font-Size="15pt" ForeColor="#FF0066"></asp:RequiredFieldValidator>
                </div>

                <div class="txt">
                    <label>Contraseña:</label><br/>
                    <asp:TextBox ID="txtContrasena" runat="server" Height="23px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtContrasena" ErrorMessage="*" Font-Size="15pt" ForeColor="#FF0066"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="#FF3300" Text="CONSTRASEÑA O USUARIO INCORRECTOS" Visible="False" Width="226px"></asp:Label>
                </div>
                <div class="enviar">
                    <asp:Button ID="btn" CssClass="enviar" runat="server" Text="Aceptar" OnClick="btn_Click" />
                </div>
            

            </div>
        

        
    </div>
   </form>

    </body>
</html>
