<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="Webshop.ShoppingCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="ShoppingCartTitle" runat="server" class="ContentHead"><h1>Handle Kurv</h1>
        <p>
        </p>
        <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" EmptyDataText="There is nothing in your shopping cart." Height="49px" Width="620px"  DataKeyNames="ProductID" ShowFooter="True"  OnRowDeleting="GridView1_RowDeleting" OnRowDataBound="GridView1_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="ProductName" HeaderText="Name" SortExpression="ProductName" />
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:TextBox ID="Quantity" Text='<%#Bind("Quantity") %>' runat="server"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="UnitPrice" HeaderText="Price" SortExpression="UnitPrice" />
                    <asp:CommandField DeleteText="X" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>

        </p></div>
    
    
    
    <div>
        <p>
            <asp:Button ID="Button1" runat="server" Text="Updater" OnCommand="Button1_Command" />
        &nbsp;<asp:Button ID="Button2" runat="server" Text="Bekreft ordre" />
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