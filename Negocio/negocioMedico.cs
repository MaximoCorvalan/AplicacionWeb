using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Dao;
using Entidades;
using System.Data.SqlClient;

namespace Negocio
{
    public class negocioMedico
    {
        private daoMedico daoMedico = new daoMedico();

        public DataTable ObtenerMedicoFiltros(string valor, string campo,string valorFiltro,bool filtro)
        {

            if (filtro == false) { return daoMedico.obtenerMedicosBusqueda(valor, campo); }//Si esta en false, ejecuta una Busqueda

            return daoMedico.obtenerMedicosFiltros(valor, campo,valorFiltro);//si esta en filtro = true, ejecuta un filtro.


        }
        public DataTable buscarMedico(string valor, string campo)
        {
            return daoMedico.obtenerMedicosBusqueda(valor, campo);
        }

        public DataTable obtenerMedicos()
        {
            return daoMedico.obtenerMedicos();
        }

        public bool AltaMedicos(Medico m)
        {
            if (daoMedico.altaMedico(m) != 0)
            {
                return true;
            }
            else return false;
        }

        public bool ModificarMedico(Medico m)
        {
            if (daoMedico.modificarMedico(m) != 0)
            {
                return true;
            }
            else return false;
        }
        public DataTable obtenerProvincias()
        {
            return daoMedico.obtenerProvincias();
        }
        public DataTable obtenerEspecialidades()
        {
            return daoMedico.obtenerEspecialidades();
        }
        public DataTable obtenerLocalidades(int num)
        {
            return daoMedico.obtenerLocalidades(num);
        }
        public bool bajaMedico(string l)
        {
            if (daoMedico.BajaMedico(l) != 0)
            {
                return true;
            }
            else return false;
        }
        public DataTable obtenerMedicoPorEspecialidad(int idEspecialidad)
        {
            return daoMedico.obtenerMedicoPorEspecialidad(idEspecialidad);
        }
        public Medico obtenerMedicoPorLegajo(string legajo)
        {
            return daoMedico.obtenerMedicoPorLegajo(legajo);
        }
        public bool DniRepetido(string dni)
        {

            return daoMedico.DniRepetido(dni);
        }
        public bool LegajoRepetido(string legajo)
        {
            return daoMedico.LegajoRepetido(legajo);
        }
        public bool BuscarEstadoxIDusuario (int idusuario)
        {
            return daoMedico.BuscarEstadoMedico(idusuario);
        }
    }
}
