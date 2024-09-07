using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Entidades;

namespace TPIntegrador
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;//Esto hace que las validaciones funcionen, por errores por el ASP .NET
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            NegocioUsuario negocio = new NegocioUsuario();
           
            string contrasena= txtContrasena.Text;
            string usuario = txtNombre.Text;
        
            Usuario usuarioValido = negocio.Login(usuario, contrasena);//trae el usuario
            Application["Usuario"] = usuarioValido;
       
          
             if (usuarioValido == null)
            {
                //Por si hay un error
                lblError.Visible = true;
            }
            else
            {
                Response.Redirect("../Inicio/inicio.aspx");
            }

        }

    }
}
    
