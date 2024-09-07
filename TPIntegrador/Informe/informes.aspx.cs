using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using Negocio;
using Entidades;
using System.Web.UI.DataVisualization.Charting;

namespace TPIntegrador
{
    public partial class informes : System.Web.UI.Page
    {
        private negocioInforme negInforme = new negocioInforme();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)//primer cargado
            {
                Usuario u = (Usuario)Application["Usuario"];//agarramos el usuario de las paginas anteriores
                lblUsuario.Text += u.Usuario_U;
            }

            ValidarFechas();
        }

        protected void rblTipo_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (rblTipo.SelectedValue == "Porcentaje")
            {
                ddlTurnos.Items.Clear();
                ddlTurnos.Items.Add("Presentes");
                ddlTurnos.Items.Add("Ausentes");
            }
            else //en el caso que sea cantidad
            {
                ddlTurnos.Items.Clear();
                ddlTurnos.Items.Add("Presentes");
                ddlTurnos.Items.Add("Ausentes");
                ddlTurnos.Items.Add("Asignados");
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Informe info = SetearValores();

            string textoInicial = setearTextoInit(info);

            if (info.Tipo == "Porcentaje")
            {
                casoPorcentajes(info, textoInicial);

            }
            else
            {
                casoCantidades(info, textoInicial);
            }
        }


        private void ValidarFechas()
        {
            // Obtener los valores de los inputs
            string desdeValue = inputDesde.Value;
            string hastaValue = inputHasta.Value;

            // Convertir a objetos de fecha para comparación
            DateTime desdeDate = DateTime.Parse(desdeValue);
            DateTime hastaDate = DateTime.Parse(hastaValue);

            // Comparar las fechas
            if (desdeDate > hastaDate)
            {
                // Si desde es mayor que hasta, ajustar inputHasta
                inputHasta.Value = desdeValue;
            }
        }

        protected Informe SetearValores()
        {
            string tipo = rblTipo.SelectedValue;
            string dato = ddlTurnos.SelectedValue;
            string desdeCadena = inputDesde.Value;
            DateTime.TryParse(desdeCadena, out DateTime desdeDate);
            string hastaCadena = inputHasta.Value;
            DateTime.TryParse(hastaCadena, out DateTime hastaDate);

            //cargamos una variable de tipo informe
            Informe info = new Informe(tipo, dato, desdeDate, hastaDate);

            return info;
        }

        public string setearTextoInit(Informe info)
        {
            CultureInfo cultInf = new CultureInfo("es-ES");//Es una variable que sirve para cambiarlo a espanol

            string desde = info.Desde.Day.ToString() + " de " + cultInf.DateTimeFormat.GetMonthName(info.Desde.Month) + " del " + info.Desde.Year.ToString();//fecha desde

            string hasta = info.Hasta.Day.ToString() + " de " + cultInf.DateTimeFormat.GetMonthName(info.Hasta.Month) + " del " + info.Hasta.Year.ToString();//fecha hasta

            string texto = "Desde el " + desde + " hasta el " + hasta + " hubo ";

            return texto;
        }

        public void casoPorcentajes(Informe info, string textoInit)
        {
            string porcentaje;

            porcentaje = negInforme.obtenerPorcentajes(info);

            lblInforme.Text = textoInit + "un %" + porcentaje + " de pacientes " + info.Turno;

            try//Intenta obtenes las tablas
            {
                bindChart(info);
                grdInforme.DataSource = negInforme.obtenerTablaPorc_PR_AU(info);
                grdInforme.DataBind();
                Application["Carga"] = negInforme.obtenerTablaPorc_PR_AU(info);//guardar los datos/table del informe
            }
            catch (Exception ex)
            {
                lblErrorGrilla.Text += ex.ToString();
                lblErrorGrilla.Visible = true;
            }
        }

        public void bindChart(Informe info)//El grafico
        {
            Informe a = new Informe("Cantidad", "Presentes", info.Desde, info.Hasta);
            Informe b = new Informe("Cantidad", "Ausentes", info.Desde, info.Hasta);
            int x = int.Parse(negInforme.obtenerCantTurnos(a));//Obtenemos cantidad de turnos de los presentes
            int y = int.Parse(negInforme.obtenerCantTurnos(b));//obtenemos cantidad de turnos de los ausentes


            int[] ytotal = { x, y };//asignamos la cantidad
            string[] xtotal = { "PRESENTES", "AUSENTES" };//asignamos los nombres

            Grafico.Series["Series1"].Points.DataBindXY(xtotal, ytotal);//Setear datos de las cantidades
            Grafico.Series["Series1"].Points[0].Color = System.Drawing.Color.CadetBlue;//Le agregamos un color
            Grafico.Series["Series1"].Points[1].Color = System.Drawing.Color.Lavender;//le agregamos un color
            Grafico.Series["Series1"].BorderWidth = 1;
            Grafico.Series["Series1"].BorderColor = System.Drawing.Color.Black;

            for (int i = 0; i < xtotal.Length; i++)
            {
                DataPoint point = Grafico.Series["Series1"].Points[i];//aca en el elemento point: Presnetes o Ausentes
                point.LegendText = "" + xtotal[i] + ": " + ytotal[i] + "";
            }

        }

        public void casoCantidades(Informe info, string textoInit)
        {
            string cantidad = negInforme.obtenerCantTurnos(info);
            
            lblInforme.Text = textoInit + cantidad + " turnos " + info.Turno;

            try//intenta obtener las tablas
            {
                grdInforme.DataSource = negInforme.obtenerTablaTurnos_A_PR_AU(info);
                grdInforme.DataBind();
                Application["Carga"] = negInforme.obtenerTablaTurnos_A_PR_AU(info);//guardar los datos/tabla del informe
                bindChart(info);//le mandamos informacion a el grafico
            }
            catch (Exception ex)
            {
                lblErrorGrilla.Text += ex.ToString();
                lblErrorGrilla.Visible = true;
            }
        }

        protected void grdInforme_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdInforme.PageIndex = e.NewPageIndex;//actualizacion de pagina

            grdInforme.DataSource = Application["Carga"];
            grdInforme.DataBind();

        }
    }
}