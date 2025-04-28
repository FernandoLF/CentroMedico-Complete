namespace CentroMedico.Helpers
{
    public class GeneralUtils
    {
        /// <summary>
        /// El método recibe una Lista y con base al Orden los devuelven en orden
        /// Ascendente si Orden = 'A' o Descendente si Orden = 'D'
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="lista"></param>
        /// <param name="clave"></param>
        /// <param name="orden"></param>
        /// <returns></returns>
        public static List<T> OrdenarLista<T>(List<T> lista, Func<T, object> clave, char orden)
        {
            return orden == 'D'
                ? lista.OrderByDescending(clave).ToList()
                : lista.OrderBy(clave).ToList();
        }


    }
}
