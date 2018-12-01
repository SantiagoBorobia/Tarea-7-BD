<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListaPedidos.aspx.cs" Inherits="ListaPedidos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Pedidos de un cliente</title>
    <style type="text/css">
        .auto-style1 {
            width: 96%;
            z-index: 1;
            left: 18px;
            top: 349px;
            position: absolute;
            height: 28px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="background-color: #FFCC99; height: 546px;">
    <div style="background-image: none; background-color: #FF9933; height: 526px;">
    
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Página inicial</asp:HyperLink>
    
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:GridView ID="GrdArtículos" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                    </asp:GridView>
                </td>
                <td>
                    <asp:GridView ID="GrdPagos" runat="server" CellPadding="4" EmptyDataText="No tiene pagos" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    
        <asp:Table ID="TblCliente" runat="server" BorderStyle="Groove" GridLines="Both" style="z-index: 1; left: 301px; top: 107px; position: absolute; height: 54px; width: 404px">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">RFC</asp:TableCell>
                <asp:TableCell runat="server">Nombre</asp:TableCell>
                <asp:TableCell runat="server">Domicilio</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 348px; top: 56px; position: absolute" Text="Información de los pedidos de un cliente"></asp:Label>
        <asp:DropDownList ID="DdlPedidos" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DdlPedidos_SelectedIndexChanged" style="z-index: 1; left: 492px; top: 185px; position: absolute">
        </asp:DropDownList>
        <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 403px; top: 187px; position: absolute" Text="Pedidos:"></asp:Label>
        <asp:Table ID="TblPedido" runat="server" BorderStyle="Outset" GridLines="Both" style="z-index: 1; left: 276px; top: 246px; position: absolute; height: 54px; width: 487px">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">Folio</asp:TableCell>
                <asp:TableCell runat="server">Fecha</asp:TableCell>
                <asp:TableCell runat="server">Total a pagar</asp:TableCell>
                <asp:TableCell runat="server">Saldo del cliente</asp:TableCell>
                <asp:TableCell runat="server">Saldo en facturas</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    
    </div>
    </form>
</body>
</html>
