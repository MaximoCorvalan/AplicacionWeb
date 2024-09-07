using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;
namespace TPIntegrador
{
    public partial class InicioAdministrador : System.Web.UI.Page
    {
        private negocioMedico negM = new negocioMedico();
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario u = (Usuario)Application["Usuario"];//agarramos el usuario de la pagina Login
            lbNombre.Text = u.Usuario_U;

            if (u.IdRol_U == 2 )
            {
                if (negM.BuscarEstadoxIDusuario(u.IdUsuario) == false)//Esto es en el caso que el Medico esta dado de baja
                {
                    btnPacientes.Visible = false;
                    btnMedicos.Visible = false;
                    btnInformes.Visible = false;
                    btnTurnos.Visible = false;
                    lbNombre.Text = "SU USUARIO FUE DADO DE BAJA";  
                }
                else//En el caso que es solamente un Medico con acceso al sistema
                {
                btnPacientes.Visible = false;
                btnMedicos.Visible = false;
                btnTurnos.PostBackUrl = "../UsuarioMedico/usuarioMedico.aspx";
                
                }
              
            }
         }

        protected void btnPacientes_Click(object sender, EventArgs e)
        {

        }
    }
}