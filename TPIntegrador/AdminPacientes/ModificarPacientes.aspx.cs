using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;
using System.Data;

namespace TPIntegrador.AdminPacientes
{
    public partial class ModificarPacientes : System.Web.UI.Page
    {
        private negocioPaciente negP = new negocioPaciente();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)//carga por primera vez
            {
                Usuario u = (Usuario)Application["Usuario"];//agarra el usuario de las paginas anteriores
                lblUsuario.Text += u.Usuario_U;
                cargarProvincias();
                cargarLocalidades();
                Cargar();
           
            }
        }

        public void cargarProvincias()//cargar provincias en el desplegable
        {
            DataTable dtProvincias = negP.obtenerProvincias();

            ddlProvincia.DataSource = dtProvincias;
            ddlProvincia.DataTextField = "nombre_PR";
            ddlProvincia.DataValueField = "idProvincia_PR";
            ddlProvincia.DataBind();
        }
        public void cargarLocalidades()//cargar localidades en el desplegable
        {
            ddlLocalidad.Items.Clear();
            int IDProvincia = Convert.ToInt32(ddlProvincia.SelectedValue);

            DataTable dtLocalidades = negP.obtenerLocalidades(IDProvincia);//obtiene localidades dependiendo la provincia seleccionada

            ddlLocalidad.DataSource = dtLocalidades;
            ddlLocalidad.DataTextField = "nombre_L";
            ddlLocalidad.DataValueField = "idLocalidad_L";
            ddlLocalidad.DataBind();
        }

        public void Cargar()
        {

            string dni = Application["DNIPACIENTE"].ToString();//carga el dni Seleccionado se la pagina anterior


            DataTable d = negP.obtenerPacientesBusqueda("DNI", dni);//Obtiene paciente, depediendo el idpaciente
            DataRow r = d.Rows[0];//usamos datarow, porque es mas facil acceder a una fila especifica

            txtDni.Text = r["DNI"].ToString();
            txtEmail.Text = r["Correo"].ToString();
            txtNacionalidad.Text = r["nacionalidad_P"].ToString();
            txtNombre.Text = r["Nombre"].ToString();
            txtNumber.Text = r["Telefono"].ToString();
            txtDireccion.Text = r["Direccion"].ToString();
            txtApellido.Text = r["Apellido"].ToString();
    
            // Obtén el valor de la celda y conviértelo a DateTime
            DateTime fechaNacimiento = Convert.ToDateTime(r["fechaNacimiento_p"]);

            // Formatea la fecha y asígnala al input HTML
            fecha.Value = fechaNacimiento.ToString("yyyy-MM-dd");

            ddlSexo.SelectedValue = r["sexo_P"].ToString();
            ddlProvincia.SelectedValue = r["provincia_P"].ToString();
            ddlLocalidad.SelectedValue = r["localidad_P"].ToString();

            
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            dialogo.Visible = true;//abre el cuadro del dialogo
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("listaPacientes.aspx");
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargarLocalidades();
        }

        protected void btnAceptarDialog_Click(object sender, EventArgs e)
        {
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            string dni = txtDni.Text;
            string direccion = txtDireccion.Text;
            int provincia = int.Parse(ddlProvincia.SelectedValue.ToString());
            int localidad = int.Parse(ddlLocalidad.SelectedValue.ToString());
            string sexo = ddlSexo.SelectedValue;
            string telefono = txtNumber.Text;
            string email = txtEmail.Text;
            string nacionalidad = txtNacionalidad.Text;
            string fechaN = fecha.Value;
            DateTime.TryParse(fechaN, out DateTime fechaNacimiento);
            
            Paciente p = new Paciente(nombre, apellido, dni, fechaNacimiento, sexo, nacionalidad, direccion, email, localidad, provincia, telefono);

            if (negP.modificarPaciente(p))//modificamos paciente
            {        
                Response.Redirect("listaPacientes.aspx");
            }
            else
            {
                lblDialog.Text = "ERROR AL MODIFICAR REGISTRO";
            }

        }

        protected void btnCancelarDialog_Click(object sender, EventArgs e)
        {
            dialogo.Visible = false;
        }
    }
}