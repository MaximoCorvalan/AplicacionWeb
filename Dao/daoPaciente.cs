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
    public class daoPaciente
    {
        private Conexion cn = new Conexion();

        public DataTable obtenerPacientes()
        {
            DataTable dt = cn.ObtenerTablas("dbo.spObtenerPacientes");
            return dt;
        }

        public DataTable obtenerPacientesBusqueda(string campo, string valor)
        {
            DataTable dt;
            SqlParameter[] parametros = new SqlParameter[1];

            switch (campo)
            {
                case "DNI":
                    parametros[0] = new SqlParameter("@DNI", valor);
                    dt = cn.ObtenerTablas("dbo.spObtenerPacientePorDni",parametros);
                    return dt;

                case "Nombre":
                    parametros[0] = new SqlParameter("@Nombre", valor);
                    dt = cn.ObtenerTablas("dbo.spObtenerPacientePorNombre",parametros);
                    return dt;

                case "Apellido":
                    parametros[0] = new SqlParameter("@Apellido", valor);
                    dt = cn.ObtenerTablas("dbo.spObtenerPacientePorApellido",parametros);
                     return dt;

                default:
                    return dt = cn.ObtenerTablas("dbo.spObtenerPacientes");

            }
        }
        public Medico obtenerMedicoPorLegajo(string legajo)
        {
            SqlParameter[] parametros = new SqlParameter[]
            {
                new SqlParameter("@Legajo", legajo)
            };
            DataTable dt = cn.ObtenerTablas("dbo.spObtenerMedicoPorLegajo", parametros);


            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];
                int idUsuario = int.Parse(row["idUsuario_M"].ToString());
                string legajoM = row["Legajo"].ToString();
                string dias = row["Dias"].ToString();
                string horario = row["Horario"].ToString();
                string nombre = row["Nombre"].ToString();
                string apellido = row["Apellido"].ToString();
                string direccion = row["Direccion"].ToString();
                DateTime.TryParse(row["fechaNacimiento_M"].ToString(), out DateTime fechaNac);
                int idEspecialidad = int.Parse(row["EspecialidadID"].ToString());
                int idLocalidad = int.Parse(row["localidad_M"].ToString());
                int idProvincia = int.Parse(row["provincia_M"].ToString());
                string dni = row["DNI"].ToString();
                string email = row["Correo"].ToString();
                string telefono = row["Telefono"].ToString();
                string nacionalidad = row["nacionalidad_M"].ToString();
                string sexo = row["sexo_M"].ToString();

                Medico m = new Medico(legajo, sexo, idLocalidad, idProvincia, idEspecialidad, nombre, apellido, dni, fechaNac, direccion, email, telefono, dias, horario, nacionalidad, idUsuario);


                return m;


            }
            else
            {
                Medico m = new Medico();
                return m;
            }

        }


        public DataTable obtenerPacientesFiltro(string campo, string valor,int Provincia,int Localidad)
        {
            DataTable dt;
            SqlParameter[] parametros = new SqlParameter[3];
            parametros[1] = new SqlParameter("@Provincia", Provincia);
            parametros[2] = new SqlParameter("@Localidad", Localidad);

            switch (campo)
            {
                
                case "Nombre":
                    parametros[0] = new SqlParameter("@Nombre", valor);
                    dt = cn.ObtenerTablas("dbo.spObtenerPacientePorNombreFiltrado", parametros);
                    return dt;


                case "Apellido":
                    parametros[0] = new SqlParameter("@Apellido", valor);
                    dt = cn.ObtenerTablas("dbo.spObtenerPacientePorApellidoFiltrado", parametros);
                    return dt;

                default:
                    return dt = cn.ObtenerTablas("dbo.spObtenerPacientes");

            }
        }

        public int altaPaciente(Paciente p)
        {
            cn.setearQuery("dbo.spAltaPaciente");

            setParametros(p);

            int filas = cn.ejecutarQuery();
            return filas;
        }

        public int modificarPaciente (Paciente p)
        {
            cn.setearQuery("dbo.spModificarPaciente");

            setParametros(p);

            int filas = cn.ejecutarQuery();
            return filas;
        }

        public int bajaPaciente(string DNI)
        {
            cn.setearQuery("spBajaPaciente");
            cn.Cm.Parameters.Add(new SqlParameter("@DNI", DNI));

            int filas = cn.ejecutarQuery();

            return filas;
        }
 

        public void setParametros(Paciente p)
        {
            cn.Cm.Parameters.Add(new SqlParameter("@DNI", p.Dni));
            cn.Cm.Parameters.Add(new SqlParameter("@SEXO", p.Sexo));
            cn.Cm.Parameters.Add(new SqlParameter("@LOCALIDAD", p.localidad));
            cn.Cm.Parameters.Add(new SqlParameter("@PROVINCIA", p.provincia));
            cn.Cm.Parameters.Add(new SqlParameter("@NOMBRE", p.Nombre));
            cn.Cm.Parameters.Add(new SqlParameter("@APELLIDO", p.Apellido));
            cn.Cm.Parameters.Add(new SqlParameter("@FECHANAC", p.FechaNacimiento));
            cn.Cm.Parameters.Add(new SqlParameter("@DIRECCION", p.Direccion));
            cn.Cm.Parameters.Add(new SqlParameter("@CORREO", p.Email));
            cn.Cm.Parameters.Add(new SqlParameter("@TELEFONO", p.Telefono));
            cn.Cm.Parameters.Add(new SqlParameter("@NACIONALIDAD", p.Nacionalidad));
        }
        public DataTable obtenerProvincias()
        {
            DataTable dt = cn.ObtenerTablas("dbo.spObtenerProvincias");
            return dt;
        }
        public DataTable obtenerLocalidades(int num)
        {
            SqlParameter[] parametros = new SqlParameter[]
            {
                new SqlParameter("@IDProvincia", num)
            };
            DataTable dt = cn.ObtenerTablas("dbo.spObtenerLocalidades", parametros);
            return dt;
        }

        public bool DniRepetido(string dni)
        {
            
            SqlParameter[] parametros = new SqlParameter[]
            {
                new SqlParameter("@DNI", dni)
            };

            DataTable dt = cn.ObtenerTablas("dbo.spBuscarDniRepetidoPaciente", parametros);

            // Verificar si el DataTable tiene filas
            if (dt.Rows.Count > 0)
            {
                // El DNI está repetido
                return true;
            }
            else
            {
                // El DNI no está repetido
                return false;
            }
        }
    }
}
