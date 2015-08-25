using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL_ZipCar
{
    class ReservarCarro
    {

        public DateTime DataRetirada { get; set; }
        public DateTime DataEntrega { get; set; }
        public int idGaragemRetirada { get; set; }
        public int idGaragemEntrega { get; set; }

    }
}
