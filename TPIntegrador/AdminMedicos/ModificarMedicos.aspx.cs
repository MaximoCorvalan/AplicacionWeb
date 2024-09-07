using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;
using System.Data;

namespace TPIntegrador.AdminMedicos
{

    public partial class ModificarMedicos : System.Web.UI.Page
    {
        private negocioMedico negM = new negocioMedico();
        private NegocioUsuario negU = new NegocioUsuario();
        private Medico Medico;
        private Usuario usuario;

        private int index;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)//Primera cargada
            {
                cargarEspecialidades();
                cargarMOD();
                cargarProvincias();
                cargarLocalidades();
            }
        }

        public void cargarProvincias()//Carga las provincias en el desplegable
        {
            DataTable dtProvincias = negM.obtenerProvincias();

            ddlProvincia.DataSource = dtProvincias;
            ddlProvincia.DataTextField = "nombre_PR";
            ddlProvincia.DataValueField = "idProvincia_PR";
            ddlProvincia.DataBind();
        }
        public void cargarEspecialidades()//Carga las especialidades en el desplegable
        {
            DataTable dtEspecialidades = negM.obtenerEspecialidades();

            ddlEspecialidad.DataSource = dtEspecialidades;
            ddlEspecialidad.DataTextField = "nombre_E";
            ddlEspecialidad.DataValueField = "idEsp_E";
            ddlEspecialidad.DataBind();
        }
        public void cargarLocalidades()//carga las localidades en el desplegable
        {

            ddlLocalidad.Items.Clear();
            int IDProvincia = Convert.ToInt32(ddlProvincia.SelectedValue);

            DataTable dtLocalidades = negM.obtenerLocalidades(IDProvincia);//obtiene localidades dependiendo la provincia seleccionada

            ddlLocalidad.DataSource = dtLocalidades;
            ddlLocalidad.DataTextField = "nombre_L";
            ddlLocalidad.DataValueField = "idLocalidad_L";
            ddlLocalidad.DataBind();

        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargarLocalidades();//vuelve a cagar las localidades al cambiar provincia
        }

        public void cargarMOD()
        {
            Medico m  = negM.obtenerMedicoPorLegajo(Application["Legajo"].ToString());//Obtenemos Medico, usando el legajo seleccionado de la lista.

            //cargamos a los controles sus valores
            txtLegajo.Text = m.Legajo;
            txtDNI.Text = m.DNI;
            txtNombre.Text = m.Nombre;
            txtApellido.Text = m.Apellido;
            ddlSexo.SelectedValue = m.Sexo;
            txtNacionalidad.Text = m.Nacionaldad;
            inputFecha.Value = m.FechaNacimiento.ToString("yyyy-MM-dd");
            txtDireccion.Text = m.Direccion;
            txtCorreoElectronico.Text = m.Email;
            usuario = negU.buscarUsuarioPorId(m.idUsuario);
            Application["IDUsuario"] = usuario.IdUsuario;//guardado ya que lo necesitamos y se pierde.
            txtContrasena.Text = usuario.Contrasena_U;
            txtTelefono.Text = m.Telefono;
            ddlEspecialidad.SelectedValue = m.Especialidad.ToString();
            ddlProvincia.SelectedValue = m.Provincia.ToString();
            ddlLocalidad.SelectedValue = m.Localidad.ToString();
            

        
            string dias = m.Dias;
            foreach (ListItem item in cblDias.Items)
            {
                if (dias.Contains(item.Text))//si contiene el dia entonces lo selecciona
                {
                    item.Selected = true;
                }
            }

            string horario = m.Horarios;
            foreach (ListItem item in rblHorarios.Items)
            {
                if (horario.Contains(item.Text))//si contiene el horario entonces lo selecciona
                {
                    item.Selected = true;
                }
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {

            Server.Transfer("ListaMedicos.aspx");
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            dialogo.Visible = true;
        }

        protected void btnAceptarDialog_Click(object sender, EventArgs e)
        {
            string legajo = txtLegajo.Text;
            string sexo = ddlSexo.SelectedValue;
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            string dni = txtDNI.Text;
            string direccion = txtDireccion.Text;
            int provincia = Convert.ToInt32(ddlProvincia.SelectedValue);
            int localidad = Convert.ToInt32(ddlLocalidad.SelectedValue);
            int especialidad = Convert.ToInt32(ddlEspecialidad.SelectedValue);
            string telefono = txtTelefono.Text;
            string email = txtCorreoElectronico.Text;
            string nacionalidad = txtNacionalidad.Text;
            string fechaN = inputFecha.Value;

            int idusuario = (int)Application["IDUsuario"];
            DateTime.TryParse(fechaN, out DateTime fechaNacimiento);//pasamos fechaN a fechanacimiento

            List<string> selectedItems = new List<string>();
            foreach (ListItem item in cblDias.Items)
            {
                if (item.Selected)//los items seleccionados son estos.
                {
                    selectedItems.Add(item.Text);
                }
            }
            string dias = string.Join("-", selectedItems);//Se usa el método string.Join para concatenar todos los elementos en selectedItems, separándolos con un guion (-).
            string horarios = rblHorarios.SelectedItem.Text;

            Usuario u = new Usuario(nombre, txtContrasena.Text, idusuario);
            negU.modUS(u);//Modificamos primero usuario.
            Medico = new Medico(legajo, sexo, localidad, provincia, especialidad, nombre, apellido, dni, fechaNacimiento, direccion, email, telefono, dias, horarios, nacionalidad, idusuario);
         
            if (negM.ModificarMedico(Medico))
            {

                dialogo.Visible = false;//abre el cuadro de dialogo

                Server.Transfer("ListaMedicos.aspx");

            }
            else//en caso que hubo un error al modificar
            {
                lblDialog.Text = "ERROR AL MODIFICAR REGISTRO";
            }

        }

        protected void BtnCancelarDialog_Click(object sender, EventArgs e)
        {
            dialogo.Visible = false;
        }
    }
} 