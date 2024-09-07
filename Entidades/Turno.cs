using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Turno
    {
        private int _idTurno;
        private int _idEspecialidad;
        private string _dniPaciente;
        private string _legajoMedico;
        private string _horario;
        private DateTime _fecha; //MODIFICACIÓN 13/07

        public Turno(int idEspecialidad, string dniPaciente,string legajo,string horario, DateTime fecha)
        {
            _idEspecialidad = idEspecialidad;
            _dniPaciente = dniPaciente;
            _legajoMedico = legajo;
            _horario = horario;
            _fecha = fecha;
        }

        public int Especialidad { get => _idEspecialidad; set => _idEspecialidad = value; }
        public string Dni { get => _dniPaciente; set => _dniPaciente = value; }
        public string Legajo { get => _legajoMedico; set => _legajoMedico = value; }
        public string Horario { get => _horario; set => _horario = value; }
        public DateTime Fecha { get => _fecha; set => _fecha = value; } //MODIFICACIÓN 13/07

    }
}
