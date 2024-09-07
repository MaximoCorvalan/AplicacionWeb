using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;
using System.Data;
using System.Web.UI.HtmlControls;

namespace TPIntegrador.UsuarioMedico
{
    public partial class usuarioMedico : System.Web.UI.Page
    {

        private Usuario u;
        private int i;
        private negocioMedico negM = new negocioMedico();
        private negocioTurno negT = new negocioTurno();
        protected void Page_Load(object sender, EventArgs e)
        {
            u = (Usuario)Application["Usuario"];
            lblNombre.Text = u.Usuario_U;
            i = u.IdUsuario;
            buscarLegajo();
            ValidarFechas();

            if (!IsPostBack)
            {
                FechaDesde.Visible = false;

                FechaHasta.Visible = false;
                cargarGrilla();
            }

        }

        public void cargarGrilla()
        {
            gvTurnos.DataSource = negT.obtenerPacientes(i);
            gvTurnos.DataBind();
        }

        public string buscarLegajo()
        {
            DataTable d = negM.obtenerMedicos();

            foreach (DataRow r in d.Rows)
            {
                string a = r["idUsuario_M"].ToString();
                if (r["idUsuario_M"].ToString() == u.IdUsuario.ToString())
                {
                    lblLegajo.Text = r["Legajo"].ToString();
                    string leg= r["Legajo"].ToString();
                    return leg;
                }
            }
            return null;
        }

        protected void gvTurnos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvTurnos.EditIndex = e.NewEditIndex;
            cargarGrilla();

        }

        protected void gvTurnos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvTurnos.EditIndex = -1;
            cargarGrilla();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string fechaN = FechaDesde.Value;
            DateTime.TryParse(fechaN, out DateTime fechaDesde);
            string fechaM = FechaHasta.Value;
            DateTime.TryParse(fechaM, out DateTime fechaHasta);
            string filtro = ddPacientes.SelectedValue;
            string nombre = txtValor.Text;


            if (ddlBusqueda.SelectedValue == "Pacientes")
            {
                if (ddPacientes.SelectedValue == "Especifico")
                {
                    gvTurnos.DataSource=negT.obtenerPacientesFiltrados("Especifico", txtValor.Text, i);
                    gvTurnos.DataBind();
                }
                else if (ddPacientes.SelectedValue == "Presentes")
                {

                    gvTurnos.DataSource = negT.obtenerPacientesFiltrados("Presentes", txtValor.Text, i);
                    gvTurnos.DataBind();
                }
                else
                {
                    gvTurnos.DataSource = negT.obtenerPacientesFiltrados("Ausentes", txtValor.Text, i);
                    gvTurnos.DataBind();
                }

            }
            else if(ddlBusqueda.SelectedValue == "Fechas")
            {
                string legajo = buscarLegajo();
                gvTurnos.DataSource = negT.FiltrarTurnosFECHA(fechaDesde, fechaHasta,legajo);
                gvTurnos.DataBind();
            }
            else if (ddlBusqueda.SelectedValue == "Proximos")
            {
                gvTurnos.DataSource = negT.obtenerTurnosP(u.IdUsuario);
                gvTurnos.DataBind();
            }

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlBusqueda.SelectedValue == "Fechas")
            {
                txtValor.Visible = false;
                ddPacientes.Visible = false;
                lblDesde.Visible = true;
                lblHasta.Visible = true;
                FechaDesde.Visible = true;
                FechaHasta.Visible = true;
                lblValor.Visible = false;
                lblFiltro.Visible = false;
            }
            if (ddlBusqueda.SelectedValue == "Pacientes")
            {
                txtValor.Visible = true;
                ddPacientes.Visible = true;
                lblDesde.Visible = false;
                lblHasta.Visible = false;
                FechaDesde.Visible = false;
                FechaHasta.Visible = false;
                lblValor.Visible = true;
                lblFiltro.Visible = true;
            }
            if (ddlBusqueda.SelectedValue == "Proximos")
            {
                txtValor.Visible = false;
                ddPacientes.Visible = false;
                lblDesde.Visible = false;
                lblHasta.Visible = false;
                FechaDesde.Visible = false;
                FechaHasta.Visible = false;
                lblValor.Visible = false;
                lblFiltro.Visible = false;
            }
        }

        protected void gvTurnos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label idTurn = (Label)gvTurnos.Rows[e.RowIndex].FindControl("IDTURNO");
            string idTurnot = idTurn.Text;
            int idTurno = int.Parse(idTurnot);
            TextBox txtEdit = (TextBox)gvTurnos.Rows[e.RowIndex].FindControl("txtEdit");
            string pbservacion = txtEdit.Text;
            CheckBoxList cbl =(CheckBoxList)gvTurnos.Rows[e.RowIndex].FindControl("cblPresencialidadEdit");
            string presencialidad = cbl.SelectedItem.Text;

            negT.cambiarMedicoTurno(idTurno, pbservacion, presencialidad);
            gvTurnos.EditIndex = -1;
            cargarGrilla();
        }

        protected void gvTurnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTurnos.PageIndex = e.NewPageIndex;
            cargarGrilla();
        }

        private void ValidarFechas()
        {
            // Obtener los valores de los inputs
            string desdeValue = FechaDesde.Value;
            string hastaValue = FechaHasta.Value;

            // Convertir a objetos de fecha para comparación
            DateTime desdeDate = DateTime.Parse(desdeValue);
            DateTime hastaDate = DateTime.Parse(hastaValue);

            // Comparar las fechas
            if (desdeDate > hastaDate)
            {
                // Si desde es mayor que hasta, ajustar inputHasta
                FechaHasta.Value = desdeValue;
            }
        }


        /*
public void cargarHorario()
{
u = (Usuario)Application["Usuario"];
DataTable medic = negM.buscarMedico(u.Usuario_U,"Nombre");
string  horario = medic.Rows[0]["Horario"].ToString();

ddlHorario.Items.Clear();

if (horario.Contains("9-12"))
{
ddlHorario.Items.Add("9");
ddlHorario.Items.Add("10");
ddlHorario.Items.Add("11");
ddlHorario.Items.Add("12");
}
else if (horario.Contains("12-15"))
{
ddlHorario.Items.Add("12");
ddlHorario.Items.Add("13");
ddlHorario.Items.Add("14");
ddlHorario.Items.Add("15");
}
else if (horario.Contains("15-18"))
{
ddlHorario.Items.Add("15");
ddlHorario.Items.Add("16");
ddlHorario.Items.Add("17");
ddlHorario.Items.Add("18");
}
else if (horario.Contains("18-21"))
{
ddlHorario.Items.Add("18");
ddlHorario.Items.Add("19");
ddlHorario.Items.Add("20");
ddlHorario.Items.Add("21");
}


}
protected void btnBuscar_Click(object sender, EventArgs e)
{
string paciente = txtPaciente.Text;
string tipoTurno = ddlAnteriores.SelectedValue;
string horario = ddlHorario.SelectedValue;
DateTime? fecha = Calendar2.SelectedDate == DateTime.MinValue ? (DateTime?)null : Calendar2.SelectedDate;

DataTable dtTurnos = negT.FiltrarTurnos(paciente, tipoTurno, horario, fecha);
gvTurnos.DataSource = dtTurnos;
gvTurnos.DataBind();
}

}
*/
    }
}