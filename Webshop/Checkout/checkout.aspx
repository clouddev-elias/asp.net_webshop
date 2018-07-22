<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="Webshop.Checkout.checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2><asp:Label ID="labelcheck" runat="server">Fyll inn med informasjon og bekreft bestilling.</asp:Label> </h2>

    <table style="padding-left:25px; width:100%; background-color: #e9e9e9; border-top-color:black; height: 350px;">
        <tr>
            <td style="width: 225px">
                <asp:Label ID="Label1" runat="server" Text="Fornavn" style="font-size: medium"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 225px">
                <asp:Label ID="Label2" runat="server" Text="Etternavn" style="font-size: medium"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 225px">
                <asp:Label ID="Label3" runat="server" Text="Postboks" style="font-size: medium"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 225px">
                <asp:Label ID="Label4" runat="server" Text="By"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 225px; height: 50px;">
                <asp:Label ID="Label5" runat="server" Text="Adresse" style="font-size: medium"></asp:Label>
            </td>
            <td style="height: 50px">
                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 225px; height: 45px;">
                <asp:Label ID="Label6" runat="server" Text="Land" style="font-size: medium"></asp:Label>
            </td>
            <td style="height: 45px">
                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 225px">
                <asp:Label ID="Label7" runat="server" Text="Telefon" style="font-size: medium"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            </td>
        </tr>
        
    </table>
    <p>
        <asp:Button ID="Button2" runat="server" Text="Bekreft bestilling" OnClick="Button2_Click" />
    <br />
</p>


</asp:Content>
