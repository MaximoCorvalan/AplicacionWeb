<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="TPIntegrador.InicioAdministrador" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8"/>
    <title>Inicio Administrador</title>
    <link rel="stylesheet" type="text/css" href="StyleInicioAD.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <aside class="profile-section">
                <div class="profile">
                    <img src="perfil.jpg" alt="Perfil" class="profile-pic"/>
                    <p>Bienvenido, <asp:Label ID="lbNombre" runat="server"></asp:Label></p>
                </div>
                <nav class="menu">

                        <asp:Button ID="btnMedicos" runat="server" Text="Medicos" class="menu-button" PostBackUrl="~/AdminMedicos/ListaMedicos.aspx"/>
         
                        <asp:Button ID="btnPacientes" runat="server" Text="Pacientes" class="menu-button" PostBackUrl="~/AdminPacientes/ListaPacientes.aspx"/>
       
      
                        <asp:Button ID="btnTurnos" runat="server" Text="Turnos" class="menu-button" PostBackUrl="~/AsignacionTurno/asignacionTurnos.aspx"/>
    

                        <asp:Button ID="btnInformes" runat="server" Text="Informes" class="menu-button" PostBackUrl="~/Informe/informes.aspx"/>
  
                </nav>
            </aside>
            <div class="content">
                <header>
                    <h1>INICIO</h1>
                </header>
                <main>
                    <h2>Bienvenido a la página de inicio</h2>
                </main>
            </div>
        </div>
    </form>
</body>
</html>