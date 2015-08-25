using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL_ZipCar;

namespace BLL_ZipCar
{
    public class Usuarios
    {

        public string usuario { get; set; }
        public string senha { get; set; }
        public int IdCliente { get; set; }
        public int tipo { get; set; }

        public void Inserir()
        {
            ZipCarDataContext db = new ZipCarDataContext();

            Usuario u = new Usuario();

            u = PopulaDadosUsuario(u);

            db.Usuarios.InsertOnSubmit(u);

            db.SubmitChanges();

        }

        protected Usuario PopulaDadosUsuario(Usuario u)
        {
            u.idCliente = this.IdCliente;
            u.usuario = this.usuario;
            u.senha = this.senha;
            u.tipo = this.tipo;
            
            return u;
        }


    }
}
