using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL_ZipCar;

namespace BLL_ZipCar
{
    public class Carros
    {
        public int IdCarro { get; set; }
        public int IdCategoria { get; set; }
        public string Marca { get; set; }
        public string Modelo { get; set; }
        public int Ano { get; set; }
        public string Placa { get; set; }
        public string Renavam { get; set; }
        public string Cor { get; set; }
        public string Ar { get; set; }
        public string Direcao { get; set; }
        public string QuatroPortas { get; set; }
        public string Gps { get; set; }
        public decimal ValorLoc { get; set; }
        public int? IdGaragem { get; set; }
        public string URLImagem { get; set; }

        public void Inserir()
        {
            ZipCarDataContext db = new ZipCarDataContext();

            Carro c = new Carro();

            c = PopulaDadosCarro(c);

            db.Carros.InsertOnSubmit(c);

            db.SubmitChanges();

            if (this.IdGaragem != null)
            {
                Carro_has_Garagem cg = new Carro_has_Garagem();

                cg.idGaragem = (int)this.IdGaragem;
                cg.idCarro = this.IdCarro;

                db.Carro_has_Garagems.InsertOnSubmit(cg);
                db.SubmitChanges();
            }
            
        }

        public void Alterar()
        {
            ZipCarDataContext db = new ZipCarDataContext();

            Carro c = db.Carros.FirstOrDefault(x => x.idCarro.Equals(this.IdCarro));

            c = PopulaDadosCarro(c);

            db.SubmitChanges();

            if (this.IdGaragem != null)
            {

                Carro_has_Garagem cg = db.Carro_has_Garagems.FirstOrDefault(x => x.idCarro.Equals(this.IdCarro));

                if (cg == null)
                {
                    InsereCarroNaGaragem();
                }
                else
                {
                    AtualizaCarroNaGaragem();
                }
            }

        }

        private void InsereCarroNaGaragem()
        {
            ZipCarDataContext db = new ZipCarDataContext();

            Carro_has_Garagem cg = new Carro_has_Garagem();

            cg.idGaragem = (int)this.IdGaragem;
            cg.idCarro = this.IdCarro;

            db.Carro_has_Garagems.InsertOnSubmit(cg);
            db.SubmitChanges();
        }

        private void AtualizaCarroNaGaragem()
        {
            ZipCarDataContext db = new ZipCarDataContext();

            Carro_has_Garagem cg = db.Carro_has_Garagems.FirstOrDefault(x => x.idCarro.Equals(this.IdCarro));

            cg.idGaragem = (int)this.IdGaragem;
            cg.idCarro = this.IdCarro;

            db.Carro_has_Garagems.DeleteOnSubmit(cg);

            db.SubmitChanges();
            InsereCarroNaGaragem();
        }

        protected Carro PopulaDadosCarro(Carro c)
        {
            c.idCarro = this.IdCarro;
            c.idCategoria = this.IdCategoria;
            c.marca = this.Marca;
            c.modelo = this.Modelo;
            c.ano = this.Ano;
            c.placa = this.Placa;
            c.renavam = this.Renavam;
            c.cor = this.Cor;
            c.ar = this.Ar;
            c.direcao = this.Direcao;
            c._4portas = this.QuatroPortas;
            c.gps = this.Gps;
            c.valorloc = this.ValorLoc;
            c.URLimagem = this.URLImagem;

            return c;
        }

        protected void PopulaDadosClasse(Carro c)
        {
            this.IdCarro = c.idCarro;
            this.IdCategoria = c.idCategoria;
            this.Marca = c.marca;
            this.Modelo = c.modelo;
            this.Ano = c.ano;
            this.Placa = c.placa;
            this.Renavam = c.renavam;
            this.Cor = c.cor;
            this.Ar = c.ar;
            this.Direcao = c.direcao;
            this.QuatroPortas = c._4portas;
            this.Gps = c.gps;
            this.ValorLoc = c.valorloc;
            this.IdGaragem = GetGaragemCarro();
            this.URLImagem = c.URLimagem;
        }

        private int? GetGaragemCarro()
        {

            int? idGaragem = null;

            ZipCarDataContext db = new ZipCarDataContext();

            Carro_has_Garagem Garagem = db.Carro_has_Garagems.FirstOrDefault(x => x.idCarro.Equals(this.IdCarro));

            if (Garagem != null)
            {
                idGaragem = Garagem.idGaragem;
            }

            return idGaragem;
        }

        public void getDadosCarro(int idCarro)
        {
            ZipCarDataContext db = new ZipCarDataContext();

            Carro c = db.Carros.FirstOrDefault(x => x.idCarro.Equals(idCarro));

            PopulaDadosClasse(c);

        }

        public static int BuscaMaxIdCarro()
        {

            ZipCarDataContext db = new ZipCarDataContext();

            var id = (from c in db.Carros
                      select c.idCarro == null ? new Nullable<int>() : c.idCarro).Max();

            return Convert.ToInt32(id == null ? 1 : ++id);
        }

        public static IQueryable GetAllCarros(int idCategoria)
        {

            ZipCarDataContext dc = new ZipCarDataContext();

            var carro = dc.Carros.Where(x => (x.idCarro > 0 && x.idCategoria.Equals(idCategoria)));

            return carro;
        }

  
    }
}
