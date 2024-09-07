<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="asignacionTurnos.aspx.cs" Inherits="TPIntegrador.AsignacionTurno.asignacionTurnos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="style.css" rel="stylesheet" />
    <title>ASIIGNACION TURNOS</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
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
            margin-right: 39px;
            margin-top: 2px;
        }
       
        
        .auto-style4 {
            height: 262px;
        }
       
        
    </style>
    </head>
<body>
    <form id="form1" runat="server">
            <div class="conteiner">
               
            <h2>ASIGNACION DE TURNOS</h2>
                <dialog open id="dialogo" runat="server" visible="false">
        <div class="modal__content" runat="server" style="border-radius:30px">
            <h3 runat="server" style="font-size: 24px">
                <asp:Label ID="lblDialog" runat="server" Text=""></asp:Label>
            </h3>
            <asp:Button ID="btnAceptarDialog" runat="server" Text="aceptar" Height="32px" Width="72px" CssClass="auto-style3" OnClick="btnAceptarDialog_Click" />

        </div>
                  
    </dialog>
      
                <asp:Label ID="lblUsuario" runat="server" Text="Usuario:"></asp:Label><br />

  
            <label for="">Seleccione una especialidad:</label>
             <asp:DropDownList ID="ddlEspecialidad" CssClass="ddl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlEspecialidad_SelectedIndexChanged"></asp:DropDownList>

            <label for="">Seleccione un Medico:</label>
             <asp:DropDownList ID="ddlMedico"  CssClass="ddl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlMedico_SelectedIndexChanged"></asp:DropDownList>

            &nbsp;<label for="">Seleccione un horario:</label>
             <asp:DropDownList ID="ddlHorario"  CssClass="ddl" runat="server"></asp:DropDownList>

            <label for="">Seleccione un paciente<br />
                <br />
                </label>&nbsp;<asp:DropDownList ID="ddlPaciente"  CssClass="ddl" runat="server"></asp:DropDownList>


                <label for="">Seleccione una fecha</label><div>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style4"></td>
                            <td class="auto-style4"></td>
                            <td class="auto-style4"><asp:Calendar ID="Calendar1"   runat="server" BackColor="White" BorderColor="Black" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" OnDayRender="Calendar1_DayRender" Width="330px" BorderStyle="Solid" CellSpacing="1" CssClass="calendario" OnSelectionChanged="Calendar1_SelectionChanged">
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                    <DayStyle BackColor="#CCCCCC" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="White" Font-Bold="True" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TitleStyle BackColor="#333399" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" BorderStyle="Solid" />
                    <TodayDayStyle BackColor="#999999" ForeColor="White" />
                </asp:Calendar>


                            </td>
                        </tr>
                    </table>
                    &nbsp;<asp:Button ID="btnAceptar"  CssClass="btn" runat="server" Text="Aceptar" Width="95px" OnClick="btnAceptar_Click" />
                    <asp:Button ID="btnCancelar" CssClass="btn" runat="server" Text="Cancelar" Width="95px" OnClick="btnCancelar_Click" />
                </div>
                
            
    </div>


    </form>
</body>
</html>
