<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Webshop.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SalgDBConnectionString %>" 
        SelectCommand="SELECT * FROM Products">
        </asp:SqlDataSource>

    <asp:ListView ID="Searchlist" runat="server" DataKeyNames="ProductID" EnableModelValidation="False" GroupItemCount="5">
        <EmptyDataTemplate>
            <table>
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
            <td/>
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>
        <ItemTemplate>
            <td id="Td1" runat="server">
                <table>
                    <tr>
                        <td>
                            <h5><%# Eval("ProductName") %></h5>
                            <a href='ProductDetails.aspx?PID=<%# Eval("ProductID") %>'>
                            <image border="1" height="75" src='Img/products/<%# Eval("ImagePath")%>' width="100" />
                            </a></td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <span><b>Pris: </b><%#:String.Format("{0:c}", Eval("UnitPrice") )%></span>
                            <br />
                            <a href='ShoppingCart.aspx?ProductID=<%# Eval("ProductID") %>'><span class="ProductListItem"><b>Legg til kurv<b> </b></b></span></a></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                </p>
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table style="width:100%">
                <tbody>
                    <tr>
                        <td>
                            <table id="groupPlaceholderContainer" runat="server" style="width:100%">
                                <tr id="groupPlaceholder">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                    </tr>
                </tbody>
            </table>
        </LayoutTemplate>
    </asp:ListView>

</asp:Content>
