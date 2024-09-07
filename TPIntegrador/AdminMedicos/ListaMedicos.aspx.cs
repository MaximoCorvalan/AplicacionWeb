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
    public partial class ListaMedicos : System.Web.UI.Page
    {
        private negocioMedico negM = new negocioMedico();


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)//Si carga por primera vez
            {
                Usuario u = (Usuario)Application["Usuario"];//Cargamos usuario que viene de las paginas anteriores
                lblUsuario.Text += u.Usuario_U;
                cargarEspecialidades();
                Application["estadoFiltro"] = false;
                Application["index"] = null;
                cargarGrilla();
            }
        }

        protected void cargarGrilla()
        {
            try
            {
                gvMedicos.DataSource = negM.obtenerMedicos();//Obtiene medico con estado = true y los trae y los setea al datasource.
                gvMedicos.DataBind();
                lblErrorGrilla.Visible = false;
            }
            catch (Exception ex)
            {
                lblErrorGrilla.Text += ex.ToString();
                lblErrorGrilla.Visible = true;
            }

        }

        public void cargarEspecialidades()
        {
            DataTable dtEspecialidades = negM.obtenerEspecialidades();//Obtiene las especialidades y las setea en el datatable

            ddlEspecialidad.DataSource = dtEspecialidades;
            ddlEspecialidad.DataTextField = "nombre_E";
            ddlEspecialidad.DataValueField = "nombre_E";
            ddlEspecialidad.DataBind();
        }

        protected void lkbtnEliminar_Click(object sender, EventArgs e)
        {
            btnCancelarDialog.Visible = true;
            if (Application["Legajo"] == null)//en caso que no selecciono nada
            {
                lblDialog.Text = "NO HAS SELECCIONADO NINGUN REGISTRO";

                btnCancelarDialog.Visible = false;
              
            }
            cargarGrilla();
            btnCancelarDialog.Visible = false;
            dialogo.Visible = true;//Abre el cuadro de dialogo
        }

        protected void gvMedicos_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
           
         
            
            Application["Legajo"] = gvMedicos.Rows[e.NewSelectedIndex].Cells[1].Text; //Creamos el legajo, del medico seleccionado en la lista
     
       
        }

        protected void lkbtnAgregar_Click(object sender, EventArgs e)
        {
            Server.Transfer("AltaMedicos.aspx");
        }

        protected void lkbtnModificar_Click(object sender, EventArgs e)
        {
            btnCancelarDialog.Visible = true;
            if (Application["Legajo"] == null)//en caso que no selecciono nada
            {
                lblDialog.Text = "NO HAS SELECCIONADO NINGUN REGISTRO";

                btnCancelarDialog.Visible = false;
                dialogo.Visible = true;
            }
            else//Si se selecciono, lo redirecciona a ModificarMedicos
            {
                Server.Transfer("ModificarMedicos.aspx");
            }

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            bool estadoFiltro = (bool)Application["estadoFiltro"];//Para si activar o desactivar los controles
            string campo = ddlBuscar.SelectedValue;//Campos: DNI  -   NOMBRE  - APELLIDO  - LEGAJO
            string valor = txtvalor.Text;
            string valorFiltro = ddlEspecialidad.SelectedValue;

            if (negM.ObtenerMedicoFiltros(valor, campo, valorFiltro, estadoFiltro).Rows.Count > 0)
            {
                gvMedicos.DataSource = negM.ObtenerMedicoFiltros(valor, campo, valorFiltro, estadoFiltro);//Le pasamos los parametros y dependiendo la sitaucion, trae lo necesario.
                gvMedicos.DataBind();

            }
            else
            {
                cargarGrilla();
            }


        }

        protected void btnAceptarDialog_Click(object sender, EventArgs e)
        {


            if (Application["Legajo"] != null)//Si esta null, no se selecciono nada.
            {
                string legajo = Application["Legajo"].ToString();
                if (!negM.bajaMedico(legajo))
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
            if ((bool)Application["estadoFiltro"] == true)//Si esta en tru  desactiva los controles
            {
                lblFiltro.Visible = false;
                ddlEspecialidad.Visible = false;
                lblFiltroValor.Visible = false;
                ddlFiltro.Visible = false;
                Application["estadoFiltro"] = false;
                return;
            }//si esta en false, activa los controles
            Application["estadoFiltro"] = true;
            lblFiltro.Visible = true;
            ddlEspecialidad.Visible = true;
            lblFiltroValor.Visible = true;
            ddlFiltro.Visible = true;


        }

        protected void ddlBuscar_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (ddlBuscar.SelectedValue == "Legajo" || ddlBuscar.SelectedValue == "DNI")//En el caso que se seleccione Legajo o Dni, desactivamos controles
            {
                btnFiltros.Enabled = false;
                lblFiltro.Visible = false;
                ddlEspecialidad.Visible = false;
                lblFiltroValor.Visible = false;
                ddlFiltro.Visible = false;
                Application["estadoFiltro"] = false;

            }
            else
            {
                btnFiltros.Enabled = true;
            }
        }

    
        protected void gvMedicos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMedicos.PageIndex = e.NewPageIndex; //Actualizacion de la pagina
            cargarGrilla();
        }
    }
}