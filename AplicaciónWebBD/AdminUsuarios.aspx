<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminUsuarios.aspx.cs" Inherits="AdminUsuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Administración de usuarios</title>
    <style type="text/css">
        #form1 {
            height: 594px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="background-color: #FFCC99">
    <div style="background-color: #FFCC99; height: 508px; z-index: 1; left: 11px; top: 50px; position: absolute; width: 707px;">
    
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" style="z-index: 1; left: 226px; top: 34px; position: absolute; width: 295px; right: 186px;" Text="Administración de usuarios"></asp:Label>
        <asp:Button ID="BtnAlta" runat="server" style="z-index: 1; left: 69px; top: 81px; position: absolute" Text="Alta de usuarios" OnClick="BtnAlta_Click" />
        <asp:Button ID="BtnBaja" runat="server" style="z-index: 1; left: 267px; top: 81px; position: absolute" Text="Baja de usuarios" OnClick="BtnBaja_Click" />
        <asp:Button ID="BtnCambio" runat="server" style="z-index: 1; left: 465px; top: 80px; position: absolute" Text="Cambio de datos" />
        <asp:TextBox ID="TxtRFC" runat="server" style="z-index: 1; left: 75px; top: 150px; position: absolute" Visible="False" CausesValidation="True" ValidationGroup="AllValidators">RFC</asp:TextBox>
        <asp:TextBox ID="TxtNombre" runat="server" style="z-index: 1; left: 75px; top: 199px; position: absolute" Visible="False">Nombre</asp:TextBox>
        <asp:TextBox ID="TxtPassw" runat="server" style="z-index: 1; left: 75px; top: 254px; position: absolute" Visible="False">Contraseña</asp:TextBox>
        <asp:DropDownList ID="DDLTipo" runat="server" style="z-index: 1; left: 75px; top: 304px; position: absolute" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="DDLTipo_SelectedIndexChanged">
            <asp:ListItem>Tipo de usuario</asp:ListItem>
            <asp:ListItem Value="Cli">Cliente</asp:ListItem>
            <asp:ListItem Value="Emp">Empleado</asp:ListItem>
            <asp:ListItem Value="Ger">Gerente</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="LblMensaje" runat="server" style="z-index: 1; left: 39px; top: 364px; position: absolute" Text="Operación: en espera"></asp:Label>
        <asp:DropDownList ID="DDLUsuarios" runat="server" style="z-index: 1; left: 269px; top: 149px; position: absolute" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="DDLUsuarios_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:TextBox ID="TxtDomicilio" runat="server" style="z-index: 1; left: 270px; top: 198px; position: absolute; width: 131px" Visible="False">Domicilio</asp:TextBox>
        <asp:TextBox ID="TxtCat" runat="server" style="z-index: 1; left: 269px; top: 254px; position: absolute" Visible="False" Enabled="False">Categoría</asp:TextBox>
        <asp:Button ID="BtnEjecuta" runat="server" Enabled="False" OnClick="BtnEjecuta_Click" style="z-index: 1; left: 471px; top: 297px; position: absolute" Text="Ejecutar operación" ValidationGroup="AllValidators" />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx" style="z-index: 1; left: 474px; top: 355px; position: absolute">Página inicial</asp:HyperLink>
    
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtRFC" ErrorMessage="Formato: A0" style="z-index: 1; left: 27px; top: 170px; position: absolute; width: 35px" ValidationExpression="\w\d" ValidationGroup="AllValidators">*</asp:RegularExpressionValidator>
    
    </div>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtRFC" ErrorMessage="Dar un RFC correcto" style="z-index: 1; left: 44px; top: 200px; position: absolute; width: 36px" ValidationGroup="AllValidators">*</asp:RequiredFieldValidator>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" style="z-index: 1; left: 18px; top: 482px; position: absolute; height: 63px; width: 663px" ValidationGroup="AllValidators" />
        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="RangeValidator" style="z-index: 1; left: 440px; top: 249px; position: absolute"></asp:RangeValidator>
    </form>
</body>
</html>
