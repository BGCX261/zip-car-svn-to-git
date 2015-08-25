using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Text;
using DAL_ZipCar;

namespace BLL_ZipCar
{
    public class Clientes
    {

        public int IdCliente { get; set; }
        public string  Nome { get; set; }
        public string Cpf { get; set; }
        public char PesTip { get; set; }
        public DateTime DataNasc { get; set; }
        public string CarteiraNum { get; set; }
        public DateTime CarteiraVal { get; set; }
        public char CarteiraCat { get; set; }
        public string NumCartao { get; set; }
        public DateTime CartaoVal { get; set; }
        public string TelefoneRes { get; set; }
        public string TelefoneCel { get; set; }
        public string Status { get; set; }
        public string Cidade { get; set; }
        public string Uf { get; set; }
        public string Logradouro { get; set; }
        public int?    Numero { get; set; }
        public string Complemento { get; set; }
        public string Bairro { get; set; }
        public string Cep { get; set; }
        public char?   Sexo { get; set; }
        public string Email { get; set; }
        
        public void Inserir()
        {
            ZipCarDataContext db = new ZipCarDataContext();

            Cliente c = new Cliente();

            c = PopulaDadosCliente(c);

            db.Clientes.InsertOnSubmit(c);

            db.SubmitChanges();

        }

        public void Alterar()
        {
            ZipCarDataContext db = new ZipCarDataContext();

            Cliente c = db.Clientes.FirstOrDefault(x => x.idCliente.Equals(this.IdCliente));

            c = PopulaDadosCliente(c);

            db.SubmitChanges();

        }

        protected Cliente PopulaDadosCliente(Cliente c)
        {
            c.idCliente = this.IdCliente;
            c.nome = this.Nome;
            c.CPFCNPJ = this.Cpf;
            c.pesTip = this.PesTip.ToString();
            c.datanasc = this.DataNasc;
            c.carteiraNum = this.CarteiraNum;
            c.carteiraVal = this.CarteiraVal;
            c.carteiraCat = this.CarteiraCat.ToString();
            c.numCartao = this.NumCartao;
            c.cartaoVal = this.CartaoVal;
            c.telefoneRes = this.TelefoneRes;
            c.telefoneCel = this.TelefoneCel;
            c.status = "A";
            c.cidade = this.Cidade;
            c.uf = this.Uf;
            c.logradouro = this.Logradouro;
            c.numero = (Int32)this.Numero;
            c.complemento = this.Complemento;
            c.bairro = this.Bairro;
            c.cep = this.Cep;
            c.sexo = this.Sexo.ToString();
            c.email = this.Email;

            return c;
        }

        protected void PopulaDadosClasse(Cliente c)
        {

            this.IdCliente = c.idCliente;
            this.Nome = c.nome;
            this.Cpf = c.CPFCNPJ;
            this.PesTip = Convert.ToChar(c.pesTip);
            this.DataNasc = c.datanasc;
            this.CarteiraNum = c.carteiraNum;
            this.CarteiraVal = c.carteiraVal;
            this.CarteiraCat = Convert.ToChar(c.carteiraCat);
            this.NumCartao = c.numCartao;
            this.CartaoVal = c.cartaoVal;
            this.TelefoneRes = c.telefoneRes;
            this.TelefoneCel = c.telefoneCel;
            this.Status = c.status;
            this.Cidade = c.cidade;
            this.Uf = c.uf;
            this.Logradouro = c.logradouro;
            this.Numero = c.numero;
            this.Complemento = c.complemento;
            this.Bairro = c.bairro;
            this.Cep = c.cep;
            this.Sexo = Convert.ToChar(c.sexo);
            this.Email = c.email;

        }

        public void getDadosCliente(int idCliente)
        {
            ZipCarDataContext db = new ZipCarDataContext();

            Cliente c = db.Clientes.FirstOrDefault(x => x.idCliente.Equals(idCliente));

            PopulaDadosClasse(c);

        }

        public void getDadosCliente(string nome)
        {
            ZipCarDataContext db = new ZipCarDataContext();

            Cliente c = db.Clientes.FirstOrDefault(x => x.nome.Equals(nome));

            PopulaDadosClasse(c);

        }

        public static int BuscaMaxIdCliente()
        {

            ZipCarDataContext db = new ZipCarDataContext();

            var id = (from c in db.Clientes
                      select c.idCliente == null ? new Nullable<int>() : c.idCliente).Max();

            return Convert.ToInt32(id == null ? 1 : ++id);
        }

        public IQueryable GetAllClientes()
        {

            ZipCarDataContext dc = new ZipCarDataContext();

            var clientes = dc.Clientes.Where(x => (x.idCliente > 0));

            return clientes;
        }



    }
}
