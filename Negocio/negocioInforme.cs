using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dao;
using Entidades;
using System.Data;

namespace Negocio
{
    public class negocioInforme
    {
        private daoInforme daoInforme = new daoInforme();


     
        public string obtenerPorcentajes(Informe info)
        {
            return daoInforme.obtenerPorcentajes(info);
        }
        public DataTable obtenerTablaPorc_PR_AU(Informe info)
        {
            return daoInforme.obtenerTablaPorc_PR_AU(info);
        }

        public string obtenerCantTurnos(Informe info)
        {
            return daoInforme.obtenerCantTurnos(info);
        }

        public DataTable obtenerTablaTurnos_A_PR_AU(Informe info)
        {
            return daoInforme.obtenerTablaTurnos_A_PR_AU(info);
        }


    }
}
