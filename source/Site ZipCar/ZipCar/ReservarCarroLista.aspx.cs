using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using BLL_ZipCar;
using System.Data;
using System.Data.SqlClient;
using System.Data.Common;

public partial class Forms_Clientes : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            Garagens garagem = new Garagens();

            lblConsDataRetirada.Text = Session["consDataRetirada"].ToString();
            lblConsDataEntrega.Text = Session["consDataEntrega"].ToString();
            lblConsGaragemRetirada.Text = garagem.GetNomeGaragem(Convert.ToInt32(Session["ConsGaragemRetirada"]));
            lblConsGaragemEntrega.Text = garagem.GetNomeGaragem(Convert.ToInt32(Session["ConsGaragemEntrega"]));


            SqlConnection sqlConnection1 = new SqlConnection("Data Source=ROCKENBACH-NOTE\\SQLEXPRESS;Initial Catalog=ZipCar;Integrated Security=True");
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;

            cmd.CommandText =  "select c.* from carro c inner join carro_has_garagem cg on c.idCarro = cg.idCarro " +
                " where cg.idGaragem = "  + Session["ConsGaragemRetirada"].ToString() +
                " and not exists (select 1 from cliente_aluga_carro ac where c.idCarro = ac.idCarro and ac.dataHoraDevolvido is null)";
            cmd.CommandType = CommandType.Text;
            cmd.Connection = sqlConnection1;

            sqlConnection1.Open();

            reader = cmd.ExecuteReader();
    
            gridCarros.DataSource = reader;
            gridCarros.DataBind();


        }
    }
}