using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Text;
using DAL_ZipCar;

namespace BLL_ZipCar
{
    public class Garagens
    {

        public int IdGaragem { get; set; }
        public string Nome { get; set; }
        public string UF { get; set; }
        public string Cidade { get; set; }
        public string Bairro { get; set; }
        public string Cep { get; set; }
        public string Logradouro { get; set; }
        public int Num { get; set; }
        public string Complemento { get; set; }
        public int Capacidade { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }

        public void Inserir()
        {
            ZipCarDataContext db = new ZipCarDataContext();
            Garagem c = new Garagem();

            c = PopulaDadosGaragem(c);

            db.Garagems.InsertOnSubmit(c);

            db.SubmitChanges();

        }

        public void Alterar()
        {
            ZipCarDataContext db = new ZipCarDataContext();
            Garagem c = db.Garagems.FirstOrDefault(x => x.idGaragem.Equals(this.IdGaragem));

            c = PopulaDadosGaragem(c);

            db.SubmitChanges();

        }

        protected Garagem PopulaDadosGaragem(Garagem c)
        {
            c.idGaragem = this.IdGaragem;
            c.nome = this.Nome;
            c.UF = this.UF;
            c.cidade = this.Cidade;
            c.bairro = this.Bairro;
            c.cep = this.Cep;
            c.logradouro = this.Logradouro;
            c.num = this.Num;
            c.complemento = this.Complemento;
            c.capacidade = this.Capacidade;
            c.latitude = this.Latitude;
            c.longitude = this.Longitude;

            return c;
        }

        protected void PopulaDadosClasse(Garagem c)
        {
            this.IdGaragem = c.idGaragem;
            this.Nome = c.nome;
            this.UF = c.UF;
            this.Cidade = c.cidade;
            this.Bairro = c.bairro;
            this.Cep = c.cep;
            this.Logradouro = c.logradouro;
            this.Num = c.num;
            this.Complemento = c.complemento;
            this.Capacidade = Convert.ToInt16(c.capacidade);
            this.Latitude = c.latitude;
            this.Longitude = c.longitude;

        }

        public static int BuscaMaxIdGaragem()
        {

            ZipCarDataContext db = new ZipCarDataContext();

            var id = (from c in db.Garagems
                      select c.idGaragem == null ? new Nullable<int>() : c.idGaragem).Max();

            return Convert.ToInt32(id == null ? 1 : ++id);
        }

        public void GetDadosGaragem(string nome)
        {
            ZipCarDataContext dc = new ZipCarDataContext();

            Garagem garagens = dc.Garagems.FirstOrDefault(x => (x.nome.Equals(nome)));

            PopulaDadosClasse(garagens);
        }


        public string GetNomeGaragem(int codigo)
        {
            ZipCarDataContext dc = new ZipCarDataContext();

            Garagem garagens = dc.Garagems.FirstOrDefault(x => (x.idGaragem.Equals(codigo)));

            PopulaDadosClasse(garagens);

            return this.Nome;
        }


        public IQueryable GetAllGaragens()
        {

            ZipCarDataContext dc = new ZipCarDataContext();

            var Garagens = dc.Garagems.Where(x => (x.idGaragem > 0));

            return Garagens;
        }

    }
}
