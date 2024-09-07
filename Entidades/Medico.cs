using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
   public class Medico
    {

        private string _legajo;
        private string _sexo;
        private int _localidad;
        private int _provincia;
        private int _especialidad;

        private int _idusuario;
        private string _nombre;
        private string _apellido;
        private string _DNI;
        private DateTime fechaNacimiento;
        private string _direccion;
        private string _Email;
        private string _telefono;
        private string _dias;
        private string _horarios;
        private string _nacionaldad;

        public Medico(string legajo, string sexo, int localidad, int provincia, int especialidad, string nombre, string apellido, string dNI, DateTime fechaNacimiento, string direccion, string email, string telefono, string dias, string horarios, string nacionaldad,int idusuario)
        {
            _legajo = legajo;
            _sexo = sexo;
            _localidad = localidad;
            _provincia = provincia;
            _especialidad = especialidad;
            _nombre = nombre;
            _apellido = apellido;
            _DNI = dNI;
            this.fechaNacimiento = fechaNacimiento;
            _direccion = direccion;
            _Email = email;
            _telefono = telefono;
            _dias = dias;
            _horarios = horarios;
            _nacionaldad = nacionaldad;
            _idusuario = idusuario;
        }
        public Medico()
        {

        }

        public string Legajo { get => _legajo; set => _legajo = value; }
        public string Sexo { get => _sexo; set => _sexo = value; }
        public int Localidad { get => _localidad; set => _localidad = value; }
        public int Provincia { get => _provincia; set => _provincia = value; }
        public int Especialidad { get => _especialidad; set => _especialidad = value; }
        public int idUsuario { get => _idusuario; set => _idusuario = value; }
        public string Nombre { get => _nombre; set => _nombre = value; }
        public string Apellido { get => _apellido; set => _apellido = value; }
        public string DNI { get => _DNI; set => _DNI = value; }
        public DateTime FechaNacimiento { get => fechaNacimiento; set => fechaNacimiento = value; }
        public string Direccion { get => _direccion; set => _direccion = value; }
        public string Email { get => _Email; set => _Email = value; }
        public string Telefono { get => _telefono; set => _telefono = value; }
        public string Dias { get => _dias; set => _dias = value; }
        public string Horarios { get => _horarios; set => _horarios = value; }
        public string Nacionaldad { get => _nacionaldad; set => _nacionaldad = value; }
    }
}
