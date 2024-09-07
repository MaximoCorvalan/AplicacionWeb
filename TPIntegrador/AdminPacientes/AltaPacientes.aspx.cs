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
    public partial class AltaPacientes : System.Web.UI.Page
    {
        private negocioPaciente negP = new negocioPaciente();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)//primer cargado
            {
                Usuario u = (Usuario)Application["Usuario"];//agarra el usuario de paginas anteriores
                lblUsuario.Text += u.Usuario_U;
                cargarPlacheHolder();//carga el atributo holder
                cargarProvincias();
                cargarLocalidades();
            }
            
        }

        public void cargarPlacheHolder()//es un atributo HTML que proporciona una pista sobre lo que se espera que el usuario ingrese en un campo de texto.
        {
            txtDni.Attributes["placeholder"] = "Ingrese DNI";
            txtEmail.Attributes["placeholder"] = "Ingrese Email";
            txtNacionalidad.Attributes["placeholder"] = "Ingrese Nacionalidad";
            txtNombre.Attributes["placeholder"] = "Ingrese Nombre";
            txtNumber.Attributes["placeholder"] = "Ingrese número telefónico";
            txtDireccion.Attributes["placeholder"] = "Ingrese dirección";
            txtApellido.Attributes["placeholder"] = "Ingrese Apellido";

        }
        public void cargarProvincias()//carga provincias en el desplegable
        {
            DataTable dtProvincias = negP.obtenerProvincias();

            ddlProvincia.DataSource = dtProvincias;
            ddlProvincia.DataTextField = "nombre_PR";
            ddlProvincia.DataValueField = "idProvincia_PR";
            ddlProvincia.DataBind();
        }
        public void cargarLocalidades()//carga localidades en el desplegable
        {

            ddLocalidad.Items.Clear();
            int IDProvincia = Convert.ToInt32(ddlProvincia.SelectedValue);

            DataTable dtLocalidades = negP.obtenerLocalidades(IDProvincia);//obtiene localidades dependiendo la provincia seleccionada

            ddLocalidad.DataSource = dtLocalidades;
            ddLocalidad.DataTextField = "nombre_L";
            ddLocalidad.DataValueField = "idLocalidad_L";
            ddLocalidad.DataBind();

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            
            string dni = txtDni.Text;

            if (negP.DniRepetido(dni))//Validacion de dniRepetido, en el caso que  es asi, debera ingresa otro dni.
            {
                txtDni.Text = string.Empty;
                txtDni.Attributes["placeholder"] = "Ingrese otro DNI";
                return;
                
            }

            string nombre = txtNombre.Text;
            string apellido = txtApellido.Text;
            string direccion = txtDireccion.Text;
            int provincia = Convert.ToInt32(ddlProvincia.SelectedValue);
            int localidad = Convert.ToInt32(ddLocalidad.SelectedValue);
            string sexo = ddlSexo.SelectedValue;
            string telefono = txtNumber.Text;
            string email = txtEmail.Text;
            string nacionalidad = txtNacionalidad.Text;
            string fechaN = fecha.Value;
            DateTime.TryParse(fechaN, out DateTime fechaNacimiento);

            Paciente p = new Paciente(nombre, apellido, dni, fechaNacimiento, sexo, nacionalidad, direccion, email, localidad, provincia, telefono);

            if (negP.altaPacientes(p))
            {
                lblDialog.Text = "REGISTRO INGRESADO EXITOSAMENTE";
                
            }
            else
            {
                lblDialog.Text = "ERROR AL INGRESAR REGISTRO";
            }

            dialogo.Visible = true;//Abre cuadro de dialogo

        }


        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargarLocalidades();//carga las localidades de nuevo cuando se selecciona otra provincia
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("listaPacientes.aspx");
        }

        protected void btnAceptarDialog_Click(object sender, EventArgs e)
        {
            borrarPlace();//bora los controles
            dialogo.Visible = false;

        }

        private void borrarPlace()
        {
            foreach (Control c in form1.Controls)//recorre todos los controles  y los vacia
            {
                if (c is TextBox)
                {
                    ((TextBox)c).Text = string.Empty;
                }
            }
        }
    }
}