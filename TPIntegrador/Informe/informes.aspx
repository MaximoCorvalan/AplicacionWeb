<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Informes.aspx.cs" Inherits="TPIntegrador.informes" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="StyleInformes.css">
    <title>INFORMES</title>
    </head>
<body>

    <form id="form1" runat="server">

    <div class="conteiner">
        <h2>INFORMES</h2>
        <div class="form-column">
        <div class="form-group">
            <div>
                <asp:LinkButton ID="Inicio" runat="server" PostBackUrl="~/Inicio/Inicio.aspx">Inicio</asp:LinkButton><br />
            <asp:Label ID="lblUsuario" runat="server" Text="Usuario:"></asp:Label><br />
            </div>
            <div > 
                <label for="rblTipo">Tipo:
                <asp:RadioButtonList ID="rblTipo" runat="server"  RepeatDirection="Horizontal" CellSpacing="20" AutoPostBack="True" OnSelectedIndexChanged="rblTipo_SelectedIndexChanged" Width="300px">
                    <asp:ListItem>Cantidad</asp:ListItem>
                    <asp:ListItem>Porcentaje</asp:ListItem>

                </asp:RadioButtonList> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="rblTipo" ErrorMessage="-Seleccione un tipo " ValidationGroup="1" ForeColor="#CC3300">-Seleccione un tipo</asp:RequiredFieldValidator>

                </label>
                 
          </div>
           <div >

               <label for="ddlDato">Turnos: 
               <asp:DropDownList ID="ddlTurnos" runat="server" Height="25px" Width="140px" >
                   <asp:ListItem>-----------</asp:ListItem>
               </asp:DropDownList>

               </label>
            </div>
            <div class="form-column">

                <label for="inputDesde">Desde:
                <input ID="inputDesde" type="date" runat="server" min="2020-01-01" value="2022-01-01" required CssClass="TextBox"/>
                </label>
                <label for="inputHasta">Hasta:&nbsp;
                <input ID="inputHasta" type="date" runat="server" min="2020-01-01" value="2024-01-01" required CssClass="TextBox"/>&nbsp;
                </label>

            </div>
            <div>

                <asp:Button ID="btnAceptar" CssClass="btn" runat="server" Text="Aceptar" OnClick="btnAceptar_Click" ValidationGroup="1" />

            </div>
            </div>
           <div class="divgrafico">
                <h3 class="header2" > HISTORICO PRESENTES/AUSENTES</h3>
            <asp:Chart ID="Grafico" runat="server" Class="grafico" BackImageAlignment="Center" BorderlineColor="Transparent" BorderlineDashStyle="Solid" BorderlineWidth="2" Width="476px" Height="250px">
                <Series>
                    <asp:Series Name="Series1" ChartType="Pie"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="Presentes"></asp:ChartArea>    
                    
                </ChartAreas>     
                  <Legends>
                <asp:Legend Name="Legend1" Alignment="Center" Docking="Right"></asp:Legend>
               </Legends>
          
            </asp:Chart>

           </div>
          
           <div class="form-grid">

                <asp:Label ID="lblInforme" runat="server"></asp:Label>
                <asp:GridView ID="grdInforme" CssClass="table" runat="server"  AllowPaging="True" style="margin-top: 19px" OnPageIndexChanging="grdInforme_PageIndexChanging" PageSize="5">
                </asp:GridView>
                <asp:Label ID="lblErrorGrilla" runat="server" Enabled="False"></asp:Label>

           </div>
       </div>
    </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ValidationGroup="1" Visible="False" />
    </form>
    
</body>
</html>