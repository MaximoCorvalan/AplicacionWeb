<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="usuarioMedico.aspx.cs" Inherits="TPIntegrador.UsuarioMedico.usuarioMedico" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio Médico</title>
    <link rel="stylesheet" type="text/css" href="StyleUsuMed.css"/>

</head>
<body>
    <form id="form1" runat="server">
        <div class="wrapper">
            <div class="container">
                <aside class="profile-section">
                    <p>Bienvenido, 
                        <asp:Label ID="lblNombre" runat="server"></asp:Label>
                    </p>
                    <p>Legajo,<asp:Label ID="lblLegajo" runat="server"></asp:Label>
                    </p>
                    <nav class="menu">
                        Turnos Sin Atender:<br />
                        <br />
                        <asp:LinkButton ID="inicio" runat="server" ForeColor="White" PostBackUrl="~/Inicio/Inicio.aspx">INICIO</asp:LinkButton>
                    </nav>
                </aside>
                <div class="content">
                    <header>
                        <h1 id="content-title">Turnos</h1>
                    </header>
                    <asp:GridView ID="gvTurnos" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" CssClass="table-container" Width="774px" OnRowCancelingEdit="gvTurnos_RowCancelingEdit" OnRowEditing="gvTurnos_RowEditing" OnRowUpdating="gvTurnos_RowUpdating" PageSize="5" AllowPaging="True" Height="126px" OnPageIndexChanging="gvTurnos_PageIndexChanging">
                        <Columns>
                            <asp:TemplateField HeaderText="DNI">
                                <ItemTemplate>
                                    <asp:Label ID="lbldni" runat="server" Text='<%# Bind("DNI") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Paciente">
                                <ItemTemplate>
                                    <asp:Label ID="lblPacientes" runat="server" Text='<%# Bind("NombrePacientes") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Horario">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Horario") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fecha">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Fecha") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Presencialidad">
                                <EditItemTemplate>
                                    <asp:CheckBoxList ID="cblPresencialidadEdit" runat="server">
                                        <asp:ListItem>Presente</asp:ListItem>
                                        <asp:ListItem>Ausente</asp:ListItem>
                                    </asp:CheckBoxList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Presencialidad") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Observacion">
                                <EditItemTemplate>
                                    <asp:Label ID="IDTURNO" runat="server" Text='<%# Bind("Turno") %>' Visible="False"></asp:Label>
                                    <asp:TextBox ID="txtEdit" style="resize:none;margin:0;padding:10px;" runat="server" Height="100%" TextMode="MultiLine" Width="100%"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:TextBox ID="txtObservacion" style="resize:none;margin:0;padding:10px;" runat="server" Height="100%" ReadOnly="false" Text='<%# Bind("Observacion") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                                    &nbsp;
                                </ItemTemplate>
                                <ControlStyle Width="80px" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <br />
                    <table class="auto-style24">
                        <tr>
                            <td class="auto-style28">Buscar por:
                                <asp:DropDownList ID="ddlBusqueda" runat="server" Height="17px" Width="139px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                    <asp:ListItem>Pacientes</asp:ListItem>
                                    <asp:ListItem>Fechas</asp:ListItem>
                                    <asp:ListItem>Proximos</asp:ListItem>
                                </asp:DropDownList>
                            </td>

                            <td class="auto-style28">
                                <asp:Label ID="lblFiltro" runat="server" Text="Filtrar por:"></asp:Label>
                                <asp:DropDownList ID="ddPacientes" runat="server" Height="16px" Width="134px" CssClass="auto-style18">
                                    <asp:ListItem>Presentes</asp:ListItem>
                                    <asp:ListItem>Especifico</asp:ListItem>
                                    <asp:ListItem>Ausentes</asp:ListItem>
                                   
                                </asp:DropDownList>

                                <asp:Label ID="lblDesde" runat="server" Text="Desde:" Visible="False"></asp:Label>
                                <input ID="FechaDesde" runat="server" type="date" min="2020-01-01" value="2022-01-01" class="auto-style16" required="required"  />

                            </td>

                            <td class="auto-style22">
                                
                                <asp:Label ID="lblValor" runat="server" Text="Ingresar valor:"></asp:Label>
&nbsp;                          <asp:TextBox ID="txtValor" runat="server" Width="155px"></asp:TextBox>


&nbsp;                          <asp:Label ID="lblHasta" runat="server" Text="Hasta:" Visible="False"></asp:Label>
                                <input  ID="FechaHasta" type="date" runat="server" min="2020-01-01" value="2024-01-01" class="auto-style17" required="required" /></td>
                        </tr>
                        </table>
                    <br />
                    <table class="auto-style2">
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="btnBuscar" runat="server" Text="BUSCAR" CssClass="btn" OnClick="btnBuscar_Click" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    <br />
                </div>
            </div>
        </div>
        <br />
    </form>
</body>
</html>
