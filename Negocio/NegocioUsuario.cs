using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dao;
using Entidades;
namespace Negocio
{
    public class NegocioUsuario
    {
        private DaoUsuario daoUsuario = new DaoUsuario();

        public Usuario Login(string usuario, string contrasena)
        {
            return daoUsuario.ObtenerUsuario(usuario, contrasena);
        }
        public void altaUsuario(Usuario u)
        {
            daoUsuario.altaUsuario(u);
        }
        public int buscarIDUsuario(string usuario, string contraseña)
        {
            return daoUsuario.buscarIDUsuario(usuario, contraseña);
        }
        public Usuario buscarUsuarioPorId(int id)
        {
            return daoUsuario.obtenerUsuarioPorId(id);
        }

        public void modUS(Usuario us)
        {
            daoUsuario.modificarUsuario(us);
        }
    }
}
