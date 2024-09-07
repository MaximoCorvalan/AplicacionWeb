using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
   public class Paciente
    {
   
        private string _nombre;
        private string _apellido;
        private string _dni;
        private DateTime _fechaNacimiento;
        string _sexo;
        private string _nacionalidad;
        private string _direccion;
        private string _email;
        private int _localidad;
        private int _provincia;
        private string _telefono;

        public Paciente(string nombre, string apellido, string dni, DateTime fechaNacimiento, string sexo, string nacionalidad, string direccion, string email, int localidad, int provincia, string telefono)
        {
            _nombre = nombre;
            _apellido = apellido;
            _dni = dni;
            _fechaNacimiento = fechaNacimiento;
            _sexo = sexo;
            _nacionalidad = nacionalidad;
            _direccion = direccion;
            _email = email;
            _localidad = localidad;
            _provincia = provincia;
            _telefono = telefono;
        }

        public int localidad
        {
            get { return _localidad; }
           
        }

        public int provincia
        {
            get { return _provincia; }
            
        }

        public string Nombre
        {
            get { return _nombre; }
           
        }

        public string Apellido
        {
            get { return _apellido; }
          
        }

        public string Dni
        {
            get { return _dni; }
            
        }

        public DateTime FechaNacimiento
        {
            get { return _fechaNacimiento; }
           
        }

        public string Sexo
        {
            get { return _sexo; }
           
        }

        public string Nacionalidad
        {
            get { return _nacionalidad; }
            
        }

        public string Direccion
        {
            get { return _direccion; }
            
        }

        public string Email
        {
            get { return _email; }
         
        }

        public string Telefono
        {
            get { return _telefono; }
        
        }


    }
}
