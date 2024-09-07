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
    public class daoMedico
    {
        private Conexion cn = new Conexion();

        public DataTable obtenerMedicos()
        {
            DataTable dt = cn.ObtenerTablas("dbo.spObtenerMedicos");
            return dt;
        }

        public int altaMedico(Medico m)
        {
            cn.setearQuery("dbo.spAltaMedico");

            setParametros(m);

            int filas = cn.ejecutarQuery();

            return filas;
        }

        public int modificarMedico(Medico m)
        {
            cn.setearQuery("dbo.spModificarMedico");

            setParametros(m);

            int filas = cn.ejecutarQuery();

            return filas;
        }

        public DataTable obtenerMedicosFiltros(string valor, string campo,string valorFiltro)
        {
            DataTable dt;
            SqlParameter[] parametros = new SqlParameter[2];
            SqlParameter p = new SqlParameter("@Especialidad", valorFiltro);
            parametros[1] = p;

            switch (campo)
            {

                case "Nombre":
                    parametros[0] = new SqlParameter("@Nombre", valor);
                    dt = cn.ObtenerTablas("dbo.spObtenerMedicoPorNombreFiltrado", parametros);
                    return dt;


                case "Apellido":
                    parametros[0] = new SqlParameter("@Apellido", valor);
                    dt = cn.ObtenerTablas("dbo.spObtenerMedicoPorApellidoFiltrado", parametros);
                    return dt;

                default:
                    return null;
            }

        }

        public DataTable obtenerMedicosBusqueda(string valor , string campo)
        {
            DataTable dt;
            SqlParameter[] parametros = new SqlParameter[1];

            switch (campo)
            {
                case "DNI":
                    parametros[0] = new SqlParameter("@DNI", valor);
                    dt = cn.ObtenerTablas("dbo.spObtenerMedicoPorDni", parametros);
                    return dt;


                case "Nombre":
                    parametros[0] = new SqlParameter("@Nombre", valor);
                    dt = cn.ObtenerTablas("dbo.spObtenerMedicoPorNombre", parametros);
                    return dt;


                case "Apellido":
                    parametros[0] = new SqlParameter("@Apellido", valor);
                    dt = cn.ObtenerTablas("dbo.spObtenerMedicoPorApellido", parametros);
                    return dt;

                case "Legajo":
                    parametros[0] = new SqlParameter("@Legajo", valor);
                    dt = cn.ObtenerTablas("dbo.spObtenerMedicoPorLegajo", parametros);
                    return dt;


                default:
                    return null;
            }

        }

        public void setParametros(Medico m)
        {
            cn.Cm.Parameters.Add(new SqlParameter("@LEGAJO", m.Legajo));
            cn.Cm.Parameters.Add(new SqlParameter("@SEXO", m.Sexo));
            cn.Cm.Parameters.Add(new SqlParameter("@IDUSUARIO", m.idUsuario));
            cn.Cm.Parameters.Add(new SqlParameter("@LOCALIDAD", m.Localidad));
            cn.Cm.Parameters.Add(new SqlParameter("@PROVINCIA", m.Provincia));
            cn.Cm.Parameters.Add(new SqlParameter("@ESPECIALIDAD", m.Especialidad));
            cn.Cm.Parameters.Add(new SqlParameter("@NOMBRE", m.Nombre));
            cn.Cm.Parameters.Add(new SqlParameter("@APELLIDO", m.Apellido));
            cn.Cm.Parameters.Add(new SqlParameter("@DNI", m.DNI));
            cn.Cm.Parameters.Add(new SqlParameter("@FECHANAC", m.FechaNacimiento));
            cn.Cm.Parameters.Add(new SqlParameter("@DIRECCION", m.Direccion));
            cn.Cm.Parameters.Add(new SqlParameter("@CORREO", m.Email));
            cn.Cm.Parameters.Add(new SqlParameter("@TELEFONO", m.Telefono));
            cn.Cm.Parameters.Add(new SqlParameter("@DIAS", m.Dias));
            cn.Cm.Parameters.Add(new SqlParameter("@HORARIOS", m.Horarios));
            cn.Cm.Parameters.Add(new SqlParameter("@NACIONALIDAD", m.Nacionaldad));
        }
        public DataTable obtenerProvincias()
        {
            DataTable dt = cn.ObtenerTablas("dbo.spObtenerProvincias");
            return dt;
        }
        public DataTable obtenerEspecialidades()
        {
            DataTable dt = cn.ObtenerTablas("dbo.spObtenerEspecialidades");
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
        public int BajaMedico(string legajo)
        {
            cn.setearQuery("spBajaMedico");

            cn.Cm.Parameters.Add(new SqlParameter("@LEGAJO", legajo));

            int filas = cn.ejecutarQuery();

            return filas;
        }
        public DataTable obtenerMedicoPorEspecialidad(int idEspecialidad)
        {
            SqlParameter[] parametros = new SqlParameter[]
            {
                new SqlParameter("@IDESPECIALIDAD", idEspecialidad)
            };
            DataTable dt = cn.ObtenerTablas("dbo.spObtenerMedicoPorIdEspecialidad", parametros);
            return dt;
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
                
                Medico m = new Medico(legajo,sexo,idLocalidad,idProvincia,idEspecialidad,nombre,apellido,dni,fechaNac,direccion,email,telefono,dias,horario,nacionalidad,idUsuario);
           

                return m;

         
            }
            else
            {
                Medico m = new Medico();
                return m;
            }
            
        }

        public bool DniRepetido(string dni)
        {

            SqlParameter[] parametros = new SqlParameter[]
            {
                new SqlParameter("@DNI", dni)
            };

            DataTable dt = cn.ObtenerTablas("dbo.spBuscarDniRepetidoMedico", parametros);

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

        public bool LegajoRepetido(string legajo)
        {

            SqlParameter[] parametros = new SqlParameter[]
            {
                new SqlParameter("@LEGAJO", legajo)
            };

            DataTable dt = cn.ObtenerTablas("dbo.spBuscarLegajoRepetidoMedico", parametros);

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

        public bool BuscarEstadoMedico(int ID)
        {
            SqlParameter[] parametros = new SqlParameter[]
            {
              new SqlParameter("@ID" ,ID)
            };

                 DataTable dt = cn.ObtenerTablas("dbo.spObtenerEstadoMedico", parametros);
                
            // Verificar si el DataTable tiene filas
            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];
                bool Estado =  bool.Parse(row["Estado_M"].ToString());
                return Estado;
            }
            else
            {
                return false;
            }
        }

    }

}
