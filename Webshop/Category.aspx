<%@ Page Title="DataWeb AS - Webshop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Webshop.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    



    <div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SalgDBConnectionString %>" SelectCommand="SELECT ProductID, ProductName, Description, ImagePath, UnitPrice, CategoryID FROM Products WHERE (CategoryID = @CategoryID)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="CategoryID" QueryStringField="CatID" Type="Int32" ValidateInput="True" ConvertEmptyStringToNull="False" />
            </SelectParameters>
        </asp:SqlDataSource>
         
        </div>
    
   

            <asp:ListView DataSourceID="SqlDataSource1" ID="productList" runat="server" 
                GroupItemCount="4">
                <EmptyDataTemplate>
                    <table >
                        <tr>
                            <td>Ingen produkter i kategorien.</td>
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
                                   <a href="Default.aspx">
                                   <image src='/img/products/<%# Eval("ImagePath")%>' width="100" height="75" border="1" />
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>

                                    <br />
                                    <span>
                                         <b>Pris: </b><%#:String.Format("{0:c}", Eval("UnitPrice") )%>
                                    </span>
                                    <br />
                                      <a href="/ShoppingCart.aspx?ProductID=<%# Eval("ProductID") %>">               
                                        <span class="ProductListItem">
                                            <b>Legg til kurv<b>
                                        </span>           
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        </p>
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table style="width:100%;">
                        <tbody>
                            <tr>
                                <td>
                                    <table id="groupPlaceholderContainer" runat="server" style="width:100%">
                                        <tr id="groupPlaceholder"></tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr></tr>
                        </tbody>
                    </table>
                </LayoutTemplate>
            </asp:ListView>
     


   
</asp:Content>