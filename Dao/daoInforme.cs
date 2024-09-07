using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace Dao
{
    public class daoInforme
    {
        private Conexion cn = new Conexion();

        public string obtenerPorcentajes(Informe info)
        {
            cn.setearQuery("dbo.spObtenerPorcentajes");

            setParametros(info);

            cn.ejecutarQuery();

            string valor = cn.Cm.Parameters["@RETORNO"].Value.ToString();

            return valor;
        }


        public DataTable obtenerTablaPorc_PR_AU(Informe info)
        {
            SqlParameter[] parametros = new SqlParameter[] 
            {
                new SqlParameter("@TURNO", info.Turno),
                new SqlParameter("@DESDEDIA", info.Desde.Day),
                new SqlParameter("@HASTADIA", info.Hasta.Day),
                new SqlParameter("@DESDEMES", info.Desde.Month),
                new SqlParameter("@HASTAMES", info.Hasta.Month),
                new SqlParameter("@DESDEANIO", info.Desde.Year),
                new SqlParameter("@HASTAANIO", info.Hasta.Year),
               
            };

            DataTable dt = cn.ObtenerTablas("dbo.spObtenerPacientes_PR_AU", parametros);
            return dt;
        }

        public string obtenerCantTurnos(Informe info)
        {
            cn.setearQuery("dbo.spObtenerCantTurnos");

            setParametros(info);

            cn.ejecutarQuery();

            string valor = cn.Cm.Parameters["@RETORNO"].Value.ToString();

            return valor;
        }

        public DataTable obtenerTablaTurnos_A_PR_AU(Informe info)
        {
            SqlParameter[] parametros = new SqlParameter[] 
            {
                new SqlParameter("@TURNO", info.Turno),
                new SqlParameter("@DESDEDIA", info.Desde.Day),
                new SqlParameter("@HASTADIA", info.Hasta.Day),
                new SqlParameter("@DESDEMES", info.Desde.Month),
                new SqlParameter("@HASTAMES", info.Hasta.Month),
                new SqlParameter("@DESDEANIO", info.Desde.Year),
                new SqlParameter("@HASTAANIO", info.Hasta.Year),

            };

            DataTable dt = cn.ObtenerTablas("dbo.spObtenerTurnos_A_PR_AU", parametros);
            return dt;
        }

        public void setParametros(Informe info)
        {
            SqlParameter retorno = new SqlParameter("@RETORNO", DbType.Int32);
            retorno.Direction = ParameterDirection.ReturnValue;

            cn.Cm.Parameters.Add(retorno);
            cn.Cm.Parameters.AddWithValue("@TURNO", info.Turno);
            cn.Cm.Parameters.AddWithValue("@DESDEDIA", info.Desde.Day);
            cn.Cm.Parameters.AddWithValue("@HASTADIA", info.Hasta.Day);
            cn.Cm.Parameters.AddWithValue("@DESDEMES", info.Desde.Month);
            cn.Cm.Parameters.AddWithValue("@HASTAMES", info.Hasta.Month);
            cn.Cm.Parameters.AddWithValue("@DESDEANIO", info.Desde.Year);
            cn.Cm.Parameters.AddWithValue("@HASTAANIO", info.Hasta.Year);
        }

    }
}
