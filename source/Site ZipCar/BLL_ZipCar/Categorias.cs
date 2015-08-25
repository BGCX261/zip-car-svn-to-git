using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL_ZipCar;

namespace BLL_ZipCar
{
    public class Categorias
    {

        public int IdCategoria { get; set; }
        public string Descricao { get; set; }

        public void Inserir()
        {
            ZipCarDataContext db = new ZipCarDataContext();

            Categoria c = new Categoria();

            c = PopulaDadosCategoria(c);

            db.Categorias.InsertOnSubmit(c);

            db.SubmitChanges();

        }

        public void Alterar()
        {
            ZipCarDataContext db = new ZipCarDataContext();

            Categoria c = db.Categorias.FirstOrDefault(x => x.idCategoria.Equals(this.IdCategoria));

            c = PopulaDadosCategoria(c);

            db.SubmitChanges();

        }

        protected Categoria PopulaDadosCategoria(Categoria c)
        {

            c.idCategoria = this.IdCategoria;
            c.descricao = this.Descricao;

            return c;
        }

        protected void PopulaDadosClasse(Categoria c)
        {

            this.IdCategoria = c.idCategoria;
            this.Descricao = c.descricao;

        }

        public void getDadosCategoria(string descr)
        {
            ZipCarDataContext db = new ZipCarDataContext();

            Categoria c = db.Categorias.FirstOrDefault(x => x.descricao.Equals(descr));

            PopulaDadosClasse(c);

        }

        public static int BuscaMaxIdCategoria()
        {

            ZipCarDataContext db = new ZipCarDataContext();

            var id = (from c in db.Categorias
                      select c.idCategoria == null ? new Nullable<int>() : c.idCategoria).Max();

            return Convert.ToInt32(id == null ? 1 : ++id);
        }

        public IQueryable GetAllCategorias()
        {

            ZipCarDataContext dc = new ZipCarDataContext();

            var Categorias = dc.Categorias.Where(x => (x.idCategoria > 0));

            return Categorias;
        }


    }
}
