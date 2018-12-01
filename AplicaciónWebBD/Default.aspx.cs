using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page {
  //Variables de clase.
  GestorBD.GestorBD GestorBD;
  string cadSql;
  DataSet DsGeneral = new DataSet();

  //Acciones iniciales.
  protected void Page_Load(object sender, EventArgs e) {

    lblFechaHora.Text = DateTime.Now.ToString();

    //NOTA: IsPostBack da false la 1a. vez que se entra a la página.
    //Da true las veces subsecuentes.
    if (!IsPostBack) {
      //Hace la conexión a la BD.
      GestorBD = new GestorBD.GestorBD("MSDAORA", "bdalumno", "alumno", "oracle");
      Session["GestorBD"] = GestorBD;
    }

  }

  //Valida al usuario y la contraseña.
  protected void Login1_Authenticate(object sender, AuthenticateEventArgs e) {

    if (valida()) {
      Session["rfc"] = Login1.UserName;     //RFC del usuario registrado.
      Server.Transfer("EjecuciónSP.aspx");
    }
  }

  //Busca el usuario en la BD y su contraseña.
  bool valida() {

    //Recupera a GestorBD.
    GestorBD = (GestorBD.GestorBD)Session["GestorBD"];
    cadSql = "select * from pcusuarios where rfc='" + Login1.UserName +
      "' and passw='" + Login1.Password + "'";
    GestorBD.consBD(cadSql, DsGeneral, "Temp");
    if (DsGeneral.Tables["Temp"].Rows.Count != 0)
      return true;
    else
      return false;
  }
}










