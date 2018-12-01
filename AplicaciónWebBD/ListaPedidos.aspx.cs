using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ListaPedidos : System.Web.UI.Page {

  //Variables de la clase.
  DataSet DSGeneral = new DataSet(), DSPedidos = new DataSet();
  DataSet DSArtículos = new DataSet(), DSPagos = new DataSet();
  DataRow fila;
  GestorBD.GestorBD GestorBD;       //Para manejar la BD.
  Comunes objComún = new Comunes();     //Para manejar las rutinas de uso común.
  String cadSql, rfc;

  //Acciones iniciales.
  protected void Page_Load(object sender, EventArgs e) {
    if (!IsPostBack) {
      //Recupera objetos de Session.
      GestorBD = (GestorBD.GestorBD)Session["GestorBD"];
      rfc = Session["rfc"].ToString();

      //Lee los datos del cliente.
      cadSql = "select * from pcusuarios u, pcclientes c where u.rfc='" + rfc +
        "' and u.rfc=c.rfc";
      GestorBD.consBD(cadSql, DSGeneral, "Cliente");
      fila = DSGeneral.Tables["Cliente"].Rows[0];
      TblCliente.Rows[1].Cells[0].Text = fila["RFC"].ToString();
      TblCliente.Rows[1].Cells[1].Text = fila["Nombre"].ToString();
      TblCliente.Rows[1].Cells[2].Text = fila["Domicilio"].ToString();

      //Lee sus pedidos y carga los folios en el ddl de pedidos.
      cadSql="select * from pcpedidos where rfcc='"+rfc+"'";
      GestorBD.consBD(cadSql, DSPedidos, "Pedidos");
      objComún.cargaDDL(DdlPedidos, DSPedidos, "Pedidos", "FolioP");
      Session["DSPedidos"] = DSPedidos;
    }
  }

  //Muestra los datos asociados al pedido seleccionado en el ddl.
  protected void DdlPedidos_SelectedIndexChanged(object sender, EventArgs e) {
    //DataRow[] filas;

    GestorBD = (GestorBD.GestorBD)Session["GestorBD"];
    //DSPedidos = (DataSet)Session["DSPedidos"];

    //Primera alternativa: consultando de nuevo a la BD (puede ser costoso, aunque con
    //datos actuales).
    rfc = Session["rfc"].ToString();
    cadSql = "select * from PCPedidos where RFCC='" + rfc + "' and FolioP=" + DdlPedidos.Text;
    GestorBD.consBD(cadSql, DSPedidos, "Pedidos");
    fila = DSPedidos.Tables["Pedidos"].Rows[0];

    //Segunda alternativa: usando la información que ya está en el DataSet (más eficiente,
    //pero puede tener datos desactualizados).
    //filas = (DataRow[])DSPedidos.Tables["Pedidos"].Select("FolioP=" + DDLPedidos.Text);
    //fila = filas[0];

    TblPedido.Rows[1].Cells[0].Text = fila["FolioP"].ToString();
    TblPedido.Rows[1].Cells[1].Text = fila["FechaPed"].ToString();
    TblPedido.Rows[1].Cells[2].Text = fila["Monto"].ToString();
    TblPedido.Rows[1].Cells[3].Text = fila["SaldoCli"].ToString();
    TblPedido.Rows[1].Cells[4].Text = fila["SaldoFacs"].ToString();

    //Muestra los artículos del pedido.
    cadSql = "select Nombre, CantPed, CantEnt from PCDetalle d, PCArtículos a " +
      "where FolioP=" + DdlPedidos.Text + " and d.IdArt=a.IdArt";
    GestorBD.consBD(cadSql, DSArtículos, "Artículos");
    GrdArtículos.DataSource = DSArtículos.Tables["Artículos"];
    GrdArtículos.DataBind();

    //Muestra los pagos realizados para el pedido seleccionado.
    cadSql = "select * from PCPagos where FolioP=" + DdlPedidos.Text;
    GestorBD.consBD(cadSql, DSPagos, "Pagos");
    GrdPagos.DataSource = DSPagos.Tables["Pagos"];  //Muestra resultados.
    GrdPagos.DataBind();
  }
}