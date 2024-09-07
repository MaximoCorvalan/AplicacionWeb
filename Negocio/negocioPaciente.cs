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
    public class negocioPaciente
    {
        private daoPaciente daoPaciente = new daoPaciente();

        public DataTable obtenerPacientes()
        {
            return daoPaciente.obtenerPacientes();
        }

        public bool bajaPacientes(string DNI)
        {
            if (daoPaciente.bajaPaciente(DNI) != 0)
            {
                return true;
            }
            else return false;
        }

        public bool altaPacientes(Paciente p)
        {
            if (daoPaciente.altaPaciente(p) != 0)
            {
                return true;
            } 
            else return false;
        }

        public bool modificarPaciente(Paciente p)
        {
            if (daoPaciente.modificarPaciente(p) != 0)
            {
                return true;
            }
            else return false;
        }
        public DataTable obtenerProvincias()
        {
            return daoPaciente.obtenerProvincias();
        }
        public DataTable obtenerLocalidades(int num)
        {
            return daoPaciente.obtenerLocalidades(num);
        }

        public  DataTable obtenerPacientesBusqueda(string campo, string valor,bool estadoFiltro, int ProvinciaID,int localidadID)
        {
            if (estadoFiltro == false)
            {
                return daoPaciente.obtenerPacientesBusqueda(campo, valor);
            }
            return daoPaciente.obtenerPacientesFiltro(campo, valor, ProvinciaID, localidadID);
        }
        public DataTable obtenerPacientesBusqueda(string campo,string valor)
        {

            return daoPaciente.obtenerPacientesBusqueda(campo, valor);
        }
        public bool DniRepetido(string dni)
        {
            return daoPaciente.DniRepetido(dni);
        }
    }
}
