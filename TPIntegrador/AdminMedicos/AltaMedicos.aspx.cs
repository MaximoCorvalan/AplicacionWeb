using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

using System.Net;
using System.Reflection.Emit;
using static System.Net.Mime.MediaTypeNames;

namespace TPIntegrador.AdminMedicos
{
    
    public partial class AltaMedicos : System.Web.UI.Page
    {
        private negocioMedico negM = new negocioMedico();
        private NegocioUsuario negU = new NegocioUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
            if (!IsPostBack)//El primer cargado
            {
                
                cargarPlacheHolder();
                cargarProvincias();
                cargarEspecialidades();
                cargarLocalidades();
            }
        }
        public void cargarPlacheHolder()//es un atributo HTML que proporciona una pista sobre lo que se espera que el usuario ingrese en un campo de texto.
        {
            txtCorreoElectronico.Attributes["placeholder"] = "Ingrese Email";
            txtNacionalidad.Attributes["placeholder"] = "Ingrese Nacionalidad";
            txtNombre.Attributes["placeholder"] = "Ingrese Nombre";
            txtTelefono.Attributes["placeholder"] = "Ingrese número telefónico";
            txtDireccion.Attributes["placeholder"] = "Ingrese dirección";
            txtApellido.Attributes["placeholder"] = "Ingrese Apellido";
            txtContrasena.Attributes["placeholder"] = "Ingrese Contraseña";
            txtLegajo.Attributes["placeholder"] = "Ingrese legajo";
        }
        public void cargarProvincias()//Cargar provincias en el desplegable
        {
            DataTable dtProvincias = negM.obtenerProvincias();

            ddlProvincia.DataSource = dtProvincias;
            ddlProvincia.DataTextField = "nombre_PR";
            ddlProvincia.DataValueField = "idProvincia_PR";
            ddlProvincia.DataBind();
        }
        public void cargarEspecialidades()//cargar especialidades en el desplegable
        {
            DataTable dtEspecialidades = negM.obtenerEspecialidades();

            ddlEspecialidad.DataSource = dtEspecialidades;
            ddlEspecialidad.DataTextField = "nombre_E";
            ddlEspecialidad.DataValueField = "idEsp_E";
            ddlEspecialidad.DataBind();
        }
        public void cargarLocalidades()//cargar localidades en el desplegable
        {

            ddlLocalidad.Items.Clear();
            int IDProvincia = Convert.ToInt32(ddlProvincia.SelectedValue);

            DataTable dtLocalidades = negM.obtenerLocalidades(IDProvincia);//Trae localidades, dependiendo el id Provincia seleccionado.

            ddlLocalidad.DataSource = dtLocalidades;
            ddlLocalidad.DataTextField = "nombre_L";
            ddlLocalidad.DataValueField = "idLocalidad_L";
            ddlLocalidad.DataBind();

        }
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
           
            string legajo = txtLegajo.Text;
            string dni = txtDNI.Text;
            if (negM.LegajoRepetido(legajo))//Validacion si el legajo esta repetido en la base de datos, ingrese otro
            {
                txtLegajo.Text = string.Empty;
                txtLegajo.Attributes["placeholder"] = "Ingrese otro Legajo";
                return;

            }
            if (negM.DniRepetido(dni))//Validacion si el DNI esta repetido en la base de datos, ingrese otro
            {
                txtDNI.Text = string.Empty;
                txtDNI.Attributes["placeholder"] = "Ingrese otro DNI";
                return;

            }
            

            string sexo = ddlSexo.SelectedValue;
            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            string direccion = txtDireccion.Text;
            int provincia = Convert.ToInt32(ddlProvincia.SelectedValue);
            int localidad = Convert.ToInt32(ddlLocalidad.SelectedValue);
            int especialidad = Convert.ToInt32(ddlEspecialidad.SelectedValue);
            string telefono = txtTelefono.Text;
            string email = txtCorreoElectronico.Text;
            string nacionalidad = txtNacionalidad.Text;
            string fechaN = inputFecha.Value;
            DateTime.TryParse(fechaN, out DateTime fechaNacimiento);//Lo de FechaN, se lo pasamos a un DateTime a fechanacimiento

            List<string> selectedItems = new List<string>();
            foreach (ListItem item in cblDias.Items)
            {
                if (item.Selected)//checkeamos si esta seleccionado el item, si es asi. Lo agrega.
                {
                    selectedItems.Add(item.Text);
                }
            }
            string dias = string.Join("-", selectedItems);//Se usa el método string.Join para concatenar todos los elementos en selectedItems, separándolos con un guion (-).
            string horarios = rblHorarios.SelectedItem.Text;

            Usuario u = new Usuario(2, nombre, txtContrasena.Text);
            negU.altaUsuario(u);//Primero hacemo el alta usuario, para poder conseguir el IDUsuario y cargarlo a medico.
            int idusuario = negU.buscarIDUsuario(nombre, txtContrasena.Text);//Obtenemos idusuario
            Medico m = new Medico(legajo,  sexo,  localidad,  provincia,  especialidad,  nombre, apellido, dni, fechaNacimiento,direccion,email,telefono,dias,horarios,nacionalidad,idusuario);

             

            if (negM.AltaMedicos(m))
            {
                
            }
            else
            {
                lblDialog.Text = "ERROR AL INSERTAR REGISTRO EN LA BASE DE DATOS";//cambia el mensaje del cuadro del dialogo
            }
                 dialogo.Visible = true;//Abre el cuadro de dialogo
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
           // estado.Visible = true;
            cargarLocalidades();//cargar de nuevo localidades, en el caso que cambie de provincia
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
         
         
           Response.Redirect("ListaMedicos.aspx");

        }

        protected void btnAceptarDialog_Click(object sender, EventArgs e)
        {
            borrarPlace();//Borra los campos
            cargarPlacheHolder();//Cargar los holder predeterminados
            dialogo.Visible = false;
         
        }

        private void borrarPlace()
        {
            foreach (Control c in  form1.Controls)//Re corre todos los controles del form y los vacia.
            {
                if (c is TextBox)
                {
                    ((TextBox)c).Text = string.Empty;
                }
            }
            inputFecha.Value = string.Empty;//vaciamos fecha

            foreach (ListItem item in cblDias.Items)//sacamos lo seleccionado
            {
                item.Selected = false;
            }
            foreach (ListItem item in rblHorarios.Items)//sacamos lo seleccionado
            {
                item.Selected = false;
            }

        }
    }

}
