<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="order_cat_page.aspx.cs" Inherits="pages_order_cat_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .Table_form_order_cat {
            width: 100%;
            text-align:left;
        }
        .Left_form_order_cat {
            width: 185px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p style="font-size:large">
        Заявка на котика
    </p>
    <p>
        <asp:GridView ID="TableUser" runat="server" AutoGenerateColumns="False" DataKeyNames="idUser" DataSourceID="DataUser" Visible="false">
            <Columns>
                <asp:BoundField DataField="idUser" HeaderText="idUser" InsertVisible="False" ReadOnly="True" SortExpression="idUser" />
                <asp:BoundField DataField="surname" HeaderText="surname" SortExpression="surname" />
                <asp:BoundField DataField="name_user" HeaderText="name_user" SortExpression="name_user" />
                <asp:BoundField DataField="fatherland" HeaderText="fatherland" SortExpression="fatherland" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="DataUser" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT [idUser], [surname], [name_user], [fatherland] FROM [all_user]"></asp:SqlDataSource>
        <asp:GridView ID="TableCat" runat="server" AutoGenerateColumns="False" DataKeyNames="idCat" DataSourceID="DataCat" Visible="false">
            <Columns>
                <asp:BoundField DataField="idCat" HeaderText="idCat" InsertVisible="False" ReadOnly="True" SortExpression="idCat" />
                <asp:BoundField DataField="nickname" HeaderText="nickname" SortExpression="nickname" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="DataCat" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT [idCat], [nickname] FROM [cat]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:GridView ID="TableOrderCat" runat="server" AutoGenerateColumns="False" DataKeyNames="idBid" DataSourceID="DataOrderCat" Visible="false">
            <Columns>
                <asp:BoundField DataField="idBid" HeaderText="idBid" InsertVisible="False" ReadOnly="True" SortExpression="idBid" />
                <asp:BoundField DataField="idUser" HeaderText="idUser" SortExpression="idUser" />
                <asp:BoundField DataField="idCat" HeaderText="idCat" SortExpression="idCat" />
                <asp:BoundField DataField="idStatus_bid" HeaderText="idStatus_bid" SortExpression="idStatus_bid" />
                <asp:BoundField DataField="idType_bid" HeaderText="idType_bid" SortExpression="idType_bid" />
                <asp:BoundField DataField="reason" HeaderText="reason" SortExpression="reason" />
                <asp:BoundField DataField="date_bid" HeaderText="date_bid" SortExpression="date_bid" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="DataOrderCat" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [bid_cat]"></asp:SqlDataSource>
    </p>
    <table class="Table_form_order_cat">
        <tr>
            <td class="Left_form_order_cat">Фамилия</td>
            <td>
                <asp:Label ID="Label_surname" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="Left_form_order_cat">Имя</td>
            <td>
                <asp:Label ID="Label_name" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="Left_form_order_cat">Отчество</td>
            <td>
                <asp:Label ID="Label_father" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="Left_form_order_cat">Котик</td>
            <td>
                <asp:Label ID="Label_cat" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <p style="text-align:left"><asp:Button ID="Button_order_cat" runat="server" Text="Отправить" OnClick="Order_cat" /></p>
    <br />
    <p style="text-align:left"><asp:Label ID="Label_button_order_cat" runat="server" Text="Label"></asp:Label></p>
</asp:Content>

