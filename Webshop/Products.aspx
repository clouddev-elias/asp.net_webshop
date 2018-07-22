<%@ Page Title="DataWeb AS - Produkter" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Webshop.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="content" style="width:100%">
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SalgDBConnectionString %>" 
        SelectCommand="SELECT [ProductID], [ProductName], [Description], [ImagePath], [UnitPrice], [CategoryID] FROM [Products]">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="PID" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
                    <asp:DropDownList ID="DropDownList1" runat="server" style="float: right; margin-right:10px;" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem Value="1">Pris Lav-Høy</asp:ListItem>
                        <asp:ListItem Value="2">Pris Høy-Lav</asp:ListItem>
                        <asp:ListItem Value="3">A-Z</asp:ListItem>
                        <asp:ListItem Value="4">Z-A</asp:ListItem>
                    </asp:DropDownList>
            <asp:ListView ID="productList" runat="server" GroupItemCount="5" DataKeyNames="ProductID" EnableModelValidation="False" >
                <EmptyDataTemplate>
                    <table  >
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
                                   <a href="ProductDetails.aspx?PID=<%# Eval("ProductID") %>">
                                   <image src='/Img/products/<%# Eval("ImagePath")%>' width="100" height="75" border="1" />
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
                    <table style="width:100%">
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
        
    

    </div>
   
</asp:Content>