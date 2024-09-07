using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPIntegrador.AsignacionTurno
{
    public partial class asignacionTurnos : System.Web.UI.Page
    {
        private negocioMedico negM = new negocioMedico();
        private negocioTurno negT = new negocioTurno();
        private negocioPaciente negP = new negocioPaciente();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)//cargar por primera vez
            {
                Usuario u = (Usuario)Application["Usuario"];//agarramos el usuario de las paginas anteriores
                lblUsuario.Text += u.Usuario_U;
                cargarEspecialidades();
                cargarMedicos();
                cargarPacientes();

                cargarHorario();
            }
            
        }
        public void cargarEspecialidades()//cargamos especialidades al desplegable
        {
            DataTable dtEspecialidades = negM.obtenerEspecialidades();

            ddlEspecialidad.DataSource = dtEspecialidades;
            ddlEspecialidad.DataTextField = "nombre_E";
            ddlEspecialidad.DataValueField = "idEsp_E";
            ddlEspecialidad.DataBind();
        }
        public void cargarPacientes()//cargamos pacientes al desplegable
        {
            DataTable dtPacientes = negP.obtenerPacientes();

            ddlPaciente.DataSource = dtPacientes;
            ddlPaciente.DataTextField = "Nombre";
            ddlPaciente.DataValueField = "DNI";
            ddlPaciente.DataBind();
        }
        public void cargarMedicos()//cargamos medicos al desplegabel
        {
            int IDEspecialidad = Convert.ToInt32(ddlEspecialidad.SelectedValue);
            DataTable dtPacientes = negM.obtenerMedicoPorEspecialidad(IDEspecialidad);//obtenemos medico dependiendo la especialidad seleccionada

            ddlMedico.DataSource = dtPacientes;
            ddlMedico.DataTextField = "Nombre";
            ddlMedico.DataValueField = "Legajo";
            ddlMedico.DataBind();
            cargarHorario();
        }
        
        

        public void cargarHorario()//cargamos horarios al desplegable
        {
            string legajo = ddlMedico.SelectedValue;
            Medico medic = negM.obtenerMedicoPorLegajo(legajo);//obtenemos medico por legajo
            string horario = medic.Horarios;

            ddlHorario.Items.Clear();
            //depediendo el horario carga todos sus horaios.
            
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



        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargarMedicos();//carga medicos de nuevo cuando se selecciona otra especialidad
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Inicio/Inicio.aspx");
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            
            string legajo = ddlMedico.SelectedValue;
            string dni = ddlPaciente.SelectedValue;
            int idEspecialidad = Convert.ToInt32(ddlEspecialidad.SelectedValue);
            string Horario = ddlHorario.SelectedItem.Text;

            DateTime fecha = Calendar1.SelectedDate; 

            DataTable dt = negT.ObtenerTurnoPacienteXMedicoAsignado(legajo, dni);//trae una tabla con un resutaldo 1 = Ya tiene un turno 0= no tiene un turno
            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];
                int resultado = Convert.ToInt32(row["Result"]);
                if (resultado == 1)//si tiene un turno entonces no permitira cargar el turno
                {
                    lblDialog.Text = "El paciente seleccionado ya tiene un turno asignado con el medico solicitado";
                    dialogo.Visible = true;
                    return;
                }
                
            }

            Turno t = new Turno(idEspecialidad,dni,legajo,Horario,fecha);
            int i = negT.altaTurno(t);//alta turno
            if(i==1)
            {
                lblDialog.Text = "Agregado Exitosamente";
            }
            else
            {
                lblDialog.Text = "Error al agregar";
            }
            dialogo.Visible = true;//abre cuadro de dialogo
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            string legajo = ddlMedico.SelectedValue;
            Medico medico = negM.obtenerMedicoPorLegajo(legajo);
            string diasM = medico.Dias;

            e.Day.IsSelectable = false;//desabilitamos todo, asi habilitamos los que tiene disponible el medico
            e.Cell.BackColor = System.Drawing.Color.Gray;//pone toda las celdas en gris


            //y aca activamos cada uno de los dia que trabaja el medico
            if (diasM.Contains("Lunes"))
            {
                if (e.Day.Date.DayOfWeek == DayOfWeek.Monday)
                {
                    
                    e.Day.IsSelectable = true;
                    e.Cell.BackColor = System.Drawing.Color.Green;
                }
            }
            if (diasM.Contains("Martes"))
            {
                if (e.Day.Date.DayOfWeek == DayOfWeek.Tuesday)
                {
                    
                    e.Day.IsSelectable = true;
                    e.Cell.BackColor = System.Drawing.Color.Green;
                }
            }
            if (diasM.Contains("Miercoles"))
            {
                if (e.Day.Date.DayOfWeek == DayOfWeek.Wednesday)
                {
                    
                    e.Day.IsSelectable = true;
                    e.Cell.BackColor = System.Drawing.Color.Green;
                }
            }
            if (diasM.Contains("Jueves"))
            {
                if (e.Day.Date.DayOfWeek == DayOfWeek.Thursday)
                {
                    
                    e.Day.IsSelectable = true;
                    e.Cell.BackColor = System.Drawing.Color.Green;
                }
            }
            if (diasM.Contains("Viernes"))
            {
                if (e.Day.Date.DayOfWeek == DayOfWeek.Friday)
                {
                   
                    e.Day.IsSelectable = true;
                    e.Cell.BackColor = System.Drawing.Color.Green;
                }
            }
            if (diasM.Contains("Sabado"))
            {
                if (e.Day.Date.DayOfWeek == DayOfWeek.Saturday)
                {
                    
                    e.Day.IsSelectable = true;
                    e.Cell.BackColor = System.Drawing.Color.Green;
                }
            }
            if (diasM.Contains("Domingo"))
            {
                if (e.Day.Date.DayOfWeek == DayOfWeek.Sunday)
                {
                    
                    e.Day.IsSelectable = true;
                    e.Cell.BackColor = System.Drawing.Color.Green;
                }
            }


        }

        protected void ddlMedico_SelectedIndexChanged(object sender, EventArgs e)
        {
            Calendar1.DataBind();//cargamos de nuevo el calendar. un refresh
            cargarHorario();//cargamos de nuevo el horario cuando se selecciona un medico
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            string legajo = ddlMedico.SelectedValue;
            DateTime fecha = Calendar1.SelectedDate;

            DataTable dt = negT.ObtenerHorarioDeTurno(legajo, fecha);

            cargarHorario();
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    string horario = row["HORARIO_T"].ToString();
                    
                    if (horario != null)//si el horario es diferente, remueve el horario
                    {
                        ddlHorario.Items.Remove(horario);
                    }
                }
            }     
        }  

        protected void btnAceptarDialog_Click(object sender, EventArgs e)
        {
            dialogo.Visible = false;
        }
    }
}