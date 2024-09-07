using Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dao
{
    public class daoTurno
    {
        private  Conexion cn = new Conexion();

        public DataTable obtnerPacientesPorDNI(string dni,int IDUSUARIO)
        {
            string query ="select HORARIO_T as Horario , fecha_T as Fecha , observacion_T as Observacion, presencialidad_T as Presencialidad ,nombre_P as NombrePacientes,idTurno_T as turno,DNI_P as DNI from TURNOS" +
                          " join PACIENTES on PACIENTES.DNI_P = TURNOS.DniPac_T "+
                         " join MEDICOS on MEDICOS.legajo_M = TURNOS.legajoMedico_T "+
                         " join USUARIOS on MEDICOS.idUsuario_M = USUARIOS.idUsuario_U where USUARIOS.idUsuario_U = "+IDUSUARIO+" AND DNI_P = '"+dni+"'";

            return cn.ObtenerTablas(query,"pacientePorDni");
        }

        public DataTable obtenerPacientesAusentes(int IDUSUARIO)
        {
            string query= "select HORARIO_T as Horario , fecha_T as Fecha , observacion_T as Observacion, presencialidad_T as Presencialidad ,nombre_P as NombrePacientes,idTurno_T as turno,DNI_P as DNI from TURNOS" +
                          " join PACIENTES on PACIENTES.DNI_P = TURNOS.DniPac_T " +
                         " join MEDICOS on MEDICOS.legajo_M = TURNOS.legajoMedico_T " +
                         " join USUARIOS on MEDICOS.idUsuario_M = USUARIOS.idUsuario_U where USUARIOS.idUsuario_U = "+IDUSUARIO+" AND presencialidad_T='ausente' ";

            return cn.ObtenerTablas(query, "pacientesAusentes");
        }

        public DataTable obtenerPacientesPresentes(int IDUSUARIO)
        {
            string query = "select HORARIO_T as Horario , fecha_T as Fecha , observacion_T as Observacion, presencialidad_T as Presencialidad ,nombre_P as NombrePacientes,idTurno_T as turno,DNI_P as DNI from TURNOS" +
                          " join PACIENTES on PACIENTES.DNI_P = TURNOS.DniPac_T " +
                         " join MEDICOS on MEDICOS.legajo_M = TURNOS.legajoMedico_T " +
                         " join USUARIOS on MEDICOS.idUsuario_M = USUARIOS.idUsuario_U where USUARIOS.idUsuario_U = "+IDUSUARIO+" AND presencialidad_T='presente' ";

            return cn.ObtenerTablas(query, "pacientesPresentes");
        }


        public void cambiarMedicoTurno(int id,string observacion,string presencialidad)
        {
            SqlParameter[] parametro = new SqlParameter[3];
            parametro[0] = new SqlParameter("@idTurno", id);
            parametro[1] = new SqlParameter("@observacion", observacion);
            parametro[2] = new SqlParameter("presencialidad", presencialidad);
            cn.setearQuery("dbo.spcambiarMedicoTurno");
            cn.Cm.Parameters.AddRange(parametro);
            cn.ejecutarQuery();

        }
        public int altaTurno(Turno t)
        {
            cn.setearQuery("dbo.spAltaTurno");

            setParametros(t);

            return cn.ejecutarQuery();
        }

        public DataTable obtenerPacientes(int idUsuario)
        {
            SqlParameter[] parametro = new SqlParameter[1];
            parametro[0] = new SqlParameter("@idUsuario", idUsuario);

            DataTable d=cn.ObtenerTablas("spObtenerPacientesTurno",parametro);
            return d;
        }
        public void setParametros(Turno t)
        {
            cn.Cm.Parameters.Add(new SqlParameter("@IDESPECIALIDAD", t.Especialidad));
            cn.Cm.Parameters.Add(new SqlParameter("@LEGAJO", t.Legajo));
            cn.Cm.Parameters.Add(new SqlParameter("@DNI", t.Dni));
            cn.Cm.Parameters.Add(new SqlParameter("@FECHA", t.Fecha));
            cn.Cm.Parameters.Add(new SqlParameter("@HORARIO", t.Horario));
        }
        public DataTable obtenerEspecialidades()
        {
            DataTable dt = cn.ObtenerTablas("dbo.spObtenerEspecialidades");
            return dt;
        }
        public DataTable ObtenerTurnosFiltrados(string paciente, string tipoTurno, string horario, DateTime? fecha)
        {
            SqlParameter[] parametros = new SqlParameter[]
            {
            new SqlParameter("@Paciente", string.IsNullOrEmpty(paciente) ? (object)DBNull.Value : paciente),
            new SqlParameter("@TipoTurno", string.IsNullOrEmpty(tipoTurno) ? (object)DBNull.Value : tipoTurno),
            new SqlParameter("@Horario", string.IsNullOrEmpty(horario) ? (object)DBNull.Value : horario),
            new SqlParameter("@Fecha", fecha.HasValue ? (object)fecha.Value : (object)DBNull.Value)
            };

            return cn.ObtenerTablas("dbo.spFiltrarTurnos", parametros);
        }
        public DataTable ObtenerTurnos_FECHA(DateTime desde, DateTime hasta, string leg )
        {
            SqlParameter[] parametros = new SqlParameter[]
            {
                new SqlParameter("@DESDEDIA", desde.Day),
                new SqlParameter("@HASTADIA", hasta.Day),
                new SqlParameter("@DESDEMES", desde.Month),
                new SqlParameter("@HASTAMES", hasta.Month),
                new SqlParameter("@DESDEANIO", desde.Year),
                new SqlParameter("@HASTAANIO", hasta.Year),
                new SqlParameter("@legajo",leg)
            };
          return cn.ObtenerTablas("spObtenerTurnos_FECHA", parametros);
        }

        public DataTable obtenerTurnosP(int idUsuario)
        {
            SqlParameter[] parametro = new SqlParameter[1];
            parametro[0] = new SqlParameter("@idUsuario", idUsuario);

            DataTable d = cn.ObtenerTablas("spObtenerPacientesTurno", parametro);
            return d;
        }

        
        public DataTable ObtenerHorarioDeTurno(string legajo, DateTime fecha) //MODIFICACIÓN 13/07
        {
            SqlParameter[] parametros = new SqlParameter[]
            {
            new SqlParameter("@LEGAJO", legajo),
            new SqlParameter("@FECHA", fecha)
            };

            return cn.ObtenerTablas("dbo.spObtenerHorarioDeTurno", parametros);
        }
        public DataTable ObtenerTurnoPacienteXMedicoAsignado(string legajo, string dni)
        {
            SqlParameter[] parametros = new SqlParameter[]
            {
            new SqlParameter("@LEGAJO", legajo),
            new SqlParameter("@DNI", dni)
            };

            return cn.ObtenerTablas("dbo.spObtenerTurnoPacienteXMedicoAsignado", parametros);
        }

    }
}
