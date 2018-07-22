<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="Webshop.Acc.Manage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    
    
    
    <table style="width: 82%">
        <tr>
            <td style="width: 118px">
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Acc/Login.aspx">Mine ordrer</asp:HyperLink>
            </td>
            <td style="width: 137px">Instillinger</td>
            <td>
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Acc/ChangePass.aspx" Target="_self">Endre passord</asp:HyperLink>
            </td>
        </tr>
    </table>
    <br />
Content<br />
<br />
</asp:Content>
