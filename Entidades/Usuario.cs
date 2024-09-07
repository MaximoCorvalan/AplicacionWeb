using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuario
    {
        private int idUsuario;
        private int idRol_U;
        private string usuario_U;
        private string contrasena_U;

        public Usuario(int idRol_U, string usuario_U, string contrasena_U )
        {
            this.idRol_U = idRol_U;
            this.usuario_U = usuario_U;
            this.contrasena_U = contrasena_U;
        
        }
        public Usuario(int idRol_U, string usuario_U, string contrasena_U, int idusuario)
        {
            this.idRol_U = idRol_U;
            this.usuario_U = usuario_U;
            this.contrasena_U = contrasena_U;
            this.idUsuario = idusuario;
        }

        public Usuario(string usuario_U, string contrasena_U, int idus)
        {
            this.idUsuario = idus;
            this.usuario_U = usuario_U;
            this.contrasena_U = contrasena_U;
        }

        public int IdUsuario { get => idUsuario; set => idUsuario = value; }
        public int IdRol_U { get => idRol_U; set => idRol_U = value; }
        public string Usuario_U { get => usuario_U; set => usuario_U = value; }
        public string Contrasena_U { get => contrasena_U; set => contrasena_U = value; }
    }
}
