<%@ Page Title="Product" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="Webshop.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SalgDBConnectionString1 %>" SelectCommand="SELECT [ProductID], [ProductName], [Description], [ImagePath], [UnitPrice], [CategoryID] FROM [Products] WHERE ([ProductID] = @ProductID)" UpdateCommand="UPDATE [Products] SET [ProductName] = @ProductName, [Description] = @Description, [ImagePath] = @ImagePath, [UnitPrice] = @UnitPrice, [CategoryID] = @CategoryID WHERE [ProductID] = @ProductID" DeleteCommand="DELETE FROM [Products] WHERE [ProductID] = @ProductID" InsertCommand="INSERT INTO [Products] ([ProductName], [Description], [ImagePath], [UnitPrice], [CategoryID]) VALUES (@ProductName, @Description, @ImagePath, @UnitPrice, @CategoryID)">
              <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="ProductID" QueryStringField="PID" Type="Int32" ValidateInput="True" />
            </SelectParameters>

      </asp:SqlDataSource>
     <div class="content">
     <asp:FormView  runat="server" DataSourceID="SqlDataSource1" RenderOuterTable="False">
        <ItemTemplate>
            <div>
                <h1><%#:Eval("ProductName") %></h1>
            </div>
            <br />
            <table>
                <tr>
                    <td>
                        <img src='/img/products/<%# Eval("ImagePath")%>' style="border:solid; height:300px" alt="<%#:Eval("ProductName") %>"/>
                    </td>
                    <td>&nbsp;</td>  
                    <td style="vertical-align: top; text-align:left; width:45%;">
                        <span><b>Produkt Nummer:</b>&nbsp;<%#:Eval("ProductID") %></span><br /><br /><%#:Eval("Description") %><br /><span><br /><b>Pris:</b>&nbsp;<%#: String.Format("{0:c}", Eval("UnitPrice")) %></span><br /><br /></td>
                    <td style="vertical-align:top; text-align:right;">     
                          <a href="/ShoppingCart.aspx?ProductID=<%# Eval("ProductID") %>">               
                                        <span class="ProductListItem">    Legg til kurv  </span>  </td>
                    </tr>
                
                      </table>
        </ItemTemplate>
    </asp:FormView>
    </div>
</asp:Content>
