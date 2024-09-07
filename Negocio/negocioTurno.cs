using Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dao;

namespace Negocio
{
    public class negocioTurno
    {
        private daoTurno turnoDao = new daoTurno();
        public int altaTurno(Turno t)
        {
            return turnoDao.altaTurno(t);
        }
        public DataTable obtenerEspecialidades()
        {
            return turnoDao.obtenerEspecialidades();
        }

        public void cambiarMedicoTurno(int idTurno,string observacion,string presencialidad)
        {
            turnoDao.cambiarMedicoTurno(idTurno, observacion, presencialidad);
        }

        public DataTable obtenerPacientes(int idUsuario)
        {
            return turnoDao.obtenerPacientes(idUsuario);
        }

        public DataTable obtenerPacientesFiltrados(string tipoPacientes , string dni, int idUSUARIO)
        {
          
            switch(tipoPacientes)
            {
                case "Especifico":

                   return turnoDao.obtnerPacientesPorDNI(dni, idUSUARIO);
                    
                    break;

                case "Ausentes":
                   return turnoDao.obtenerPacientesAusentes(idUSUARIO);

                    break;

                case "Presentes":
                    return   turnoDao.obtenerPacientesPresentes(idUSUARIO);

                    break;

                default:

                break;


            }
            
            
            return null;

        }
        public DataTable FiltrarTurnosFECHA(DateTime desde, DateTime hasta, string leg)
        {
            return turnoDao.ObtenerTurnos_FECHA(desde,hasta,leg);
        }
        public DataTable obtenerTurnosP(int idUsuario)
        {
            return turnoDao.obtenerTurnosP( idUsuario);
        }

        public DataTable ObtenerHorarioDeTurno(string legajo, DateTime fecha) //MODIFICACIÓN 13/07
        {
            return turnoDao.ObtenerHorarioDeTurno(legajo, fecha);
        }
        public DataTable ObtenerTurnoPacienteXMedicoAsignado(string legajo, string dni)
        {
            return turnoDao.ObtenerTurnoPacienteXMedicoAsignado(legajo, dni);
        }
    }
}
