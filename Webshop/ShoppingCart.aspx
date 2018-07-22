<%@ Page Title="DataWeb - Webshop Kurv" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="Webshop.ShoppingCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div id="ShoppingCartTitle" runat="server" class="ContentHead" style="padding-left:10px"><h1>Handle Kurv</h1>
        <p>
        </p>
        <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="SiteTable" EmptyDataText="Tom!" Height="49px" Width="620px"  DataKeyNames="ProductID" ShowFooter="True"  OnRowDeleting="GridView1_RowDeleting" OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="ProductName" HeaderText="Produkt navn" SortExpression="ProductName" />
                    <asp:TemplateField HeaderText="Antall">
                        <ItemTemplate>
                            <asp:TextBox ID="Quantity" Text='<%#Bind("Quantity") %>' runat="server"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="UnitPrice" HeaderText="Pris" SortExpression="UnitPrice" />
                    <asp:CommandField DeleteText="X" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>

        </p>
        <p>
            <asp:Button ID="Button2" runat="server" Text="CHECKOUT" PostBackUrl="~/Checkout/checkout.aspx"/>
        </p>
    </div>
    <br />
    <table> 
    <tr>
      <td>
          &nbsp;</td>
      <td>
          &nbsp;</td>
    </tr>
    </table>
</asp:Content>