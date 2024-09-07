using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Informe
    {
        private string _tipo;
        private string _turno;
        private DateTime _desde;
        private DateTime _hasta;

        public Informe()
        {
        }

        public Informe(string turno)
        {
            _turno = turno;
        }
        public Informe(string tipo, string dato, DateTime desde, DateTime hasta)
        {
            _tipo = tipo;
            _turno = dato;
            _desde = desde;
            _hasta = hasta;
        }

        public string Tipo
        {
            get { return _tipo; }
        }

        public string Turno
        {
            get { return _turno; }
        }

        public DateTime Desde
        {
            get { return _desde; }
        }

        public DateTime Hasta
        {
            get { return _hasta; }
        }
    }
}
