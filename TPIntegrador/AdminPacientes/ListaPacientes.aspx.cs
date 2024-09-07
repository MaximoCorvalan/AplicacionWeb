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
    public partial class ListaPacientes : System.Web.UI.Page
    {
        private negocioPaciente negP = new negocioPaciente();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)//primer cargado
            {
                Usuario u = (Usuario)Application["Usuario"];//agarra el usuario de la paginas anteriores
                lblUsuario.Text += u.Usuario_U;
                cargarProvincias();
                cargarLocalidades();
                Application["estadoFiltro"] = false;
                cargarGrilla();
                Application["index"] = null;
            }
        }
        protected void cargarGrilla()
        {
            try
            {
                gvPacientes.DataSource = negP.obtenerPacientes();
                gvPacientes.DataBind();
                lblErrorGrilla.Visible = false;
            }
            catch (Exception ex)
            {
                lblErrorGrilla.Text += ex.ToString();
                lblErrorGrilla.Visible = true;
            }

        }

        protected void gvPacientes_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
         
            Application["DNIPACIENTE"] = gvPacientes.Rows[e.NewSelectedIndex].Cells[1].Text;//En el caso de seleccionar algo, agarra su DNI y creamos un aplication
            string a = Application["DNIPACIENTE"].ToString();
        }

        protected void lkbtnEliminar_Click(object sender, EventArgs e)
        {
            btnCancelarDialog.Visible = true;
            if (Application["DNIPACIENTE"] == null)//en el caso que no selecciono nada
            {
                lblDialog.Text = "NO HAS SELECCIONADO NINGUN REGISTRO";
                btnCancelarDialog.Visible = false;
            }

            dialogo.Visible = true;
        }

        protected void lkbtnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AltaPacientes.aspx");
        }

        protected void lkbtnModificar_Click(object sender, EventArgs e)
        {
            btnCancelarDialog.Visible = true;
            if (Application["DNIPACIENTE"] == null)//en el caso que no selecciono nada
            {
                lblDialog.Text = "NO HAS SELECCIONADO NINGUN REGISTRO";

                btnCancelarDialog.Visible = false;
                dialogo.Visible = true;
            }
            else
            {
                Server.Transfer("ModificarPacientes.aspx");
            }


        
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string opcion = ddlBuscar.SelectedValue; //opciones : DNI   -  NOMBRE  - APELLIDO
            string valor = txtvalor.Text;
            int provincia = Convert.ToInt32( ddlProvincia.SelectedValue);
            int localidad = Convert.ToInt32(ddllocalidad.SelectedValue);
            bool estadoFiltro = (bool)Application["estadoFiltro"]; 


            if (negP.obtenerPacientesBusqueda(opcion, valor, estadoFiltro, provincia, localidad).Rows.Count > 0)
            {
                gvPacientes.DataSource = negP.obtenerPacientesBusqueda(opcion, valor, estadoFiltro, provincia, localidad);//carga lo necesario dependiendo a lo pedido.
                DataBind();
            }
            else
            {
                cargarGrilla();
            }

        }

        protected void btnAceptarDialog_Click(object sender, EventArgs e)
        {

            
                if(Application["DNIPACIENTE"]!=null)//si es que se selecciono algo
            {
                string DNIPACIENTES = Application["DNIPACIENTE"].ToString();
                if (!negP.bajaPacientes(DNIPACIENTES))
                {
                    lblDialog.Text = "ERROR AL INTENTAR ELIMINAR ESTE REGISTRO";
                    return;
                }
                
               
            }
            cargarGrilla();
            dialogo.Visible = false;
        }

        protected void BtnCancelarDialog_Click(object sender, EventArgs e)
        {
            dialogo.Visible = false;
        }


        protected void btnFiltros_Click(object sender, EventArgs e)
        {
            if ((bool)Application["estadoFiltro"] == true)//en caso que este true los desactive
            {
                lblFiltro.Visible = false;
                ddllocalidad.Visible = false;
                lblFiltroValor.Visible = false;
                ddlProvincia.Visible = false;
                Application["estadoFiltro"] = false;
                return;
            }//en caso que este false, los activa
            Application["estadoFiltro"] = true;
            lblFiltro.Visible = true;
            ddllocalidad.Visible = true;
            lblFiltroValor.Visible = true;
            ddlProvincia.Visible = true;

        }

        protected void ddlBuscar_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (ddlBuscar.SelectedValue == "DNI")//en caso de seleccionar dni, desactiva controles
            {
                btnFiltros.Enabled = false;
                lblFiltro.Visible = false;
                ddlProvincia.Visible = false;
                lblFiltroValor.Visible = false;
                ddllocalidad.Visible = false;
                Application["estadoFiltro"] = false;
                return;
            }
            else
            {
                btnFiltros.Enabled = true;
              
            }
        }

        public void cargarProvincias()//carga las provincias en el desplegable
        {
            DataTable dtProvincias = negP.obtenerProvincias();

            ddlProvincia.DataSource = dtProvincias;
            ddlProvincia.DataTextField = "nombre_PR";
            ddlProvincia.DataValueField = "idProvincia_PR";
            ddlProvincia.DataBind();
        }

        public void cargarLocalidades()//carga las localidades en el desplegable
        {

            ddllocalidad.Items.Clear();
            int IDProvincia = Convert.ToInt32(ddlProvincia.SelectedValue);

            DataTable dtLocalidades = negP.obtenerLocalidades(IDProvincia);//obtiene las localidades dependiendo la provincia seleccionada

            ddllocalidad.DataSource = dtLocalidades;
            ddllocalidad.DataTextField = "nombre_L";
            ddllocalidad.DataValueField = "idLocalidad_L";
            ddllocalidad.DataBind();

        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargarLocalidades();//carga las localidades de nuevo cuando se selecciona otra provincia
        }

        

        protected void gvPacientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPacientes.PageIndex = e.NewPageIndex;//actualizar pagina
            cargarGrilla();
        }
    }

}
 