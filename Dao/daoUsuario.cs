using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Entidades;
using System.Data;

namespace Dao
{
    public class DaoUsuario
    {
        private Conexion conexion = new Conexion();


        public Usuario obtenerUsuarioPorId(int id)
        {
            SqlParameter[] parametros = new SqlParameter[]
          {
                new SqlParameter("@ID", id)
          };
            DataTable dt = conexion.ObtenerTablas("dbo.spObtenerUsuarioPorId", parametros);

            Usuario u;
            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];
                string usuario= row["usuario_U"].ToString();
                string contrasena = row["contrasena_U"].ToString();
                int i= Convert.ToInt32(row["idUsuario_U"]);
                int idRol = Convert.ToInt32(row["idRol_U"]);

                u = new Usuario(idRol, usuario, contrasena,i);
                return u;

            }
            return null;
            

        }
        public Usuario ObtenerUsuario(string usuario, string contrasena)
        {
          
            string query = "SELECT idUsuario_U,idRol_U, usuario_U, contrasena_U FROM USUARIOS WHERE usuario_U = '"+usuario+"' AND contrasena_U = '"+contrasena+"'";

            DataTable dt = conexion.ObtenerTablas(query, "Usuarios");

            if (dt.Rows.Count > 0 )
            {
                DataRow row = dt.Rows[0];
                int idUsuario = Convert.ToInt32(row["idUsuario_U"]);
                int idRol_U = Convert.ToInt32(row["idRol_U"]);
                string usuario_U = row["usuario_U"].ToString();
                string contrasena_U = row["contrasena_U"].ToString();
                return new Usuario(idRol_U, usuario_U, contrasena_U, idUsuario);
            }
            else
            {
                return null;
            }
        }
        public void altaUsuario(Usuario u)
        {
            conexion.setearQuery("dbo.spAltaUsuario");
            setParametros(u);
            conexion.ejecutarQuery();
        }
        public void setParametros(Usuario u)
        {
            conexion.Cm.Parameters.Add(new SqlParameter("@IDROL", u.IdRol_U));
            conexion.Cm.Parameters.Add(new SqlParameter("@USUARIO", u.Usuario_U));
            conexion.Cm.Parameters.Add(new SqlParameter("@CONTRASEÑA", u.Contrasena_U));

        }
        public int buscarIDUsuario(string usuario, string contraseña)
        {
            int id = 0;

            string procAlm = "spObtenerIDUsuario"; // Reemplaza con el nombre correcto de tu procedimiento almacenado

            SqlParameter[] parametros = new SqlParameter[]
            {
             new SqlParameter("@usuario", usuario),
             new SqlParameter("@contrasena", contraseña)
            };

            DataTable dt = conexion.ObtenerTablas(procAlm, parametros);

            if (dt.Rows.Count > 0)
            {
                id = Convert.ToInt32(dt.Rows[0]["idUsuario_U"]);
            }

            return id;
        }
        public void modificarUsuario(Usuario u)
        {
            conexion.setearQuery("dbo.spModificarUsuario");
            conexion.Cm.Parameters.Add(new SqlParameter("@IDUSUARIO", u.IdUsuario));
            conexion.Cm.Parameters.Add(new SqlParameter("@USUARIO", u.Usuario_U));
            conexion.Cm.Parameters.Add(new SqlParameter("@CON", u.Contrasena_U));
            conexion.ejecutarQuery();
        }
       


    }
}
