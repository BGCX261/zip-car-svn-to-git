using System.Xml;
using System.IO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL_ZipCar;

namespace BLL_ZipCar
{
    public class DadosXML
    {
        private System.String _Status;
        public System.String Status
        {
            get { return this._Status; }
            set { this._Status = value; }
        }

        private System.Int32 _idVeiculo;
        public System.Int32 idVeiculo
        {
            get { return this._idVeiculo; }
            set { this._idVeiculo = value; }
        }

        private System.Int32 _idUsuario;
        public System.Int32 idUsuario
        {
            get { return this._idUsuario; }
            set { this._idUsuario = value; }
        }

        private System.Int32 _kmAtual;
        public System.Int32 kmAtual
        {
            get { return this._kmAtual; }
            set { this._kmAtual = value; }
        }

        private System.DateTime? _dataAcao;
        public System.DateTime? dataAcao
        {
            get { return this._dataAcao; }
            set { this._dataAcao = value; }
        }
    }

    public class XML
    {
        protected static XmlDocument GetXmlDocument(string Name)
        {
            if (!File.Exists(Name))
                return null;

            XmlDocument doc = new XmlDocument();
            doc.Load(Name);
            return doc;
        }

        private static string BuscaValor(string campo, XmlElement raiz)
        {

            XmlNodeList sectionNodes = raiz.SelectNodes(campo);
            foreach (XmlNode node in sectionNodes)
            {
                return node.InnerText;
            }

            return string.Empty;
        }

        public static DadosXML TrataXML(string Name)
        {

            string Status = string.Empty;
            int idVeiculo = 0;
            int idUsuario = 0;
            DateTime dataAcao = DateTime.MinValue;
            int kmAtual = 0;

            DadosXML dados = new DadosXML();

            // Verify the document exists
            XmlDocument doc = GetXmlDocument(Name);
            if (doc == null)
                return dados;

            // Get the root node, if it exists
            XmlElement root = doc.DocumentElement;
            if (root == null)
                return dados;

            dados.Status = BuscaValor("status", root);

            int.TryParse(BuscaValor("idVeiculo", root), out idVeiculo);
            dados.idVeiculo = idVeiculo;
            int.TryParse(BuscaValor("idUsuario", root), out idUsuario);
            dados.idUsuario = idUsuario;
            DateTime.TryParse(BuscaValor("dataAcao", root), out dataAcao);
            dados.dataAcao = dataAcao;
            int.TryParse(BuscaValor("kmAtual", root), out kmAtual);
            dados.kmAtual = kmAtual;

            return dados;
        }		
  
    }
}
