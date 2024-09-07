
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;


namespace Dao
{
    class Conexion
    {
        private string ruta = "Data Source=localhost\\sqlexpress;Initial Catalog=CLINICA_BD;Integrated Security=True";

        private SqlConnection cn;
        private SqlCommand cm;
        public SqlCommand Cm
        {
            get { return cm; }
        }

        public void setCommand (SqlCommand cmd)
        {
            cm = cmd;
        }


        public DataTable ObtenerTablas(string consultaSQL, string nombreTabla)
        {
            SqlConnection cn = new SqlConnection(ruta);
            cn.Open();
            SqlDataAdapter adap = new SqlDataAdapter(consultaSQL, cn);
            DataSet ds = new DataSet();
            adap.Fill(ds,nombreTabla);
            cn.Close();
            return ds.Tables[nombreTabla];
        }

        public DataTable ObtenerTablas(string procAlm)
        {
            SqlConnection cn = new SqlConnection(ruta);
            cn.Open();
            cm = new SqlCommand(procAlm, cn);
            cm.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adap = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            cn.Close();
            return dt;
        }
        public DataTable ObtenerTablas(string procAlm, SqlParameter[] parametros = null)
        {
            SqlConnection cn = new SqlConnection(ruta);
            cn.Open();
            cm = new SqlCommand(procAlm, cn);
            cm.CommandType = CommandType.StoredProcedure;

            if (parametros != null)
            {
                cm.Parameters.AddRange(parametros);
            }

            SqlDataAdapter adap = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            adap.Fill(dt);
            cn.Close();
            return dt;
        }



        public void setearQuery(string query)
        {
            cn = new SqlConnection(ruta);
            cm = new SqlCommand(query, cn);
            cm.CommandType = CommandType.StoredProcedure;
        }

        public int ejecutarQuery()
        {
            cn.Open();
            int filas = cm.ExecuteNonQuery();
            cn.Close();

            return filas;
        }
    }
}
