<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="user_page.aspx.cs" Inherits="pages_user_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style type="text/css">
        .textbox{
            text-align: left;
        }
            .auto-style4 {
                width: 240px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p style="font-size:large">
        Личный кабинет</p>
    <p style="text-align:left; font-weight:bold">
        Данные</p>
    <p style="text-align:left; font-weight:bold">
        <asp:GridView ID="TableUser" runat="server" AutoGenerateColumns="False" DataKeyNames="idUser" DataSourceID="user" Visible="false">
            <Columns>
                <asp:BoundField DataField="idUser" HeaderText="idUser" InsertVisible="False" ReadOnly="True" SortExpression="idUser" Visible="False" />
                <asp:BoundField DataField="surname" HeaderText="surname" SortExpression="surname" />
                <asp:BoundField DataField="name_user" HeaderText="name_user" SortExpression="name_user" />
                <asp:BoundField DataField="fatherland" HeaderText="fatherland" SortExpression="fatherland" />
                <asp:BoundField DataField="sex" HeaderText="sex" SortExpression="sex" />
                <asp:BoundField DataField="date_of_birth" DataFormatString="{0:d}" HeaderText="date_of_birth" SortExpression="date_of_birth" />
                <asp:BoundField DataField="mail" HeaderText="mail" SortExpression="mail" />
                <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                <asp:BoundField DataField="login" HeaderText="login" SortExpression="login" />
                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="user" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [all_user]"></asp:SqlDataSource>
    </p>
    <table class="textbox">
        <tr>
            <td class="auto-style4" >Фамилия</td>
            <td>
                <asp:Label ID="Label_surname" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr >
            <td class="auto-style4" >Имя</td>
            <td >
                <asp:Label ID="Label_name" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Отчество</td>
            <td >
                <asp:Label ID="Label_father" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4"  >Пол</td>
            <td >
                <asp:Label ID="Label_sex" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4" >Дата рождения</td>
            <td >
                <asp:Label ID="Label_date_birth" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4" >Почта</td>
            <td>
                <asp:Label ID="Label_mail" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4" >Телефон</td>
            <td >
                <asp:Label ID="Label_phone" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4" >Логин</td>
            <td>
                <asp:Label ID="Label_login" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4" >Пароль</td>
            <td >
                <asp:Label ID="Label_password" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        </table>

    <p style="text-align:left">
        <asp:Button ID="Button_change_data_user" runat="server" Text="Изменить данные" OnClick="Change_data_user" />
    </p>
    <p style="text-align:left; font-weight:bold">
        История пожертвований</p>
    <p style="text-align:left; font-weight:bold">
        <asp:GridView ID="TablePayment" runat="server" AutoGenerateColumns="False" DataSourceID="payment" >
            <Columns>
                <asp:BoundField DataField="idUser" HeaderText="idUser" SortExpression="idUser" Visible="False" />
                <asp:BoundField DataField="sum_donat" HeaderText="Сумма" SortExpression="sum_donat" />
                <asp:BoundField DataField="date_pay" DataFormatString="{0:d}" HeaderText="Дата" SortExpression="date_pay" />
                <asp:BoundField DataField="time_pay" DataFormatString="{0:t}" HeaderText="Время" SortExpression="time_pay" />
                <asp:BoundField DataField="type" HeaderText="Тип " SortExpression="type" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="payment" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [Q_payment]"></asp:SqlDataSource>
    </p>
    <p style="text-align:left">
        <asp:Label ID="Label_payment_user" runat="server" Text="Пожертвований нет"></asp:Label>
    </p>
    <p style="text-align:left; font-weight:bold">
        &nbsp;</p>
    <p style="text-align:left; font-weight:bold">
        История заявок</p>
    <p style="text-align:left; font-weight:bold">
        Заявки на кота</p>
    <p style="text-align:left; font-weight:bold">
        <asp:GridView ID="TableBidCat" runat="server" AutoGenerateColumns="False" DataSourceID="bid_cat">
            <Columns>
                <asp:BoundField DataField="idBid" HeaderText="idBid" InsertVisible="False" SortExpression="idBid" Visible="False" />
                <asp:BoundField DataField="idUser" HeaderText="idUser" SortExpression="idUser" Visible="False" />
                <asp:BoundField DataField="nickname" HeaderText="Имя котика" SortExpression="nickname" />
                <asp:BoundField DataField="status_bid" HeaderText="Статус заявки" SortExpression="status_bid" />
                <asp:BoundField DataField="type" HeaderText="Тип заявки" SortExpression="type" />
                <asp:BoundField DataField="reason" HeaderText="Причина отказа" SortExpression="reason" />
                <asp:BoundField DataField="date_bid" DataFormatString="{0:d}" HeaderText="Дата" SortExpression="date_bid" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="bid_cat" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [Q_cat_bid]"></asp:SqlDataSource>
    </p>
    <p style="text-align:left">
        <asp:Label ID="Label_cat_bid" runat="server" Text="Заявок нет"></asp:Label>
    </p>
    <p style="text-align:left; font-weight:bold">
        &nbsp;</p>
    <p style="text-align:left; font-weight:bold">
        Заявки на мероприятие</p>
    <p style="text-align:left; font-weight:bold">
        <asp:GridView ID="TableBidEvent" runat="server" AutoGenerateColumns="False" DataSourceID="bid_event">
            <Columns>
                <asp:BoundField DataField="idUser" HeaderText="idUser" SortExpression="idUser" Visible="False" />
                <asp:BoundField DataField="idEvent" HeaderText="idEvent" SortExpression="idEvent" Visible="False" />
                <asp:BoundField DataField="name_event" HeaderText="Мероприятие" SortExpression="name_event" />
                <asp:BoundField DataField="date_event" DataFormatString="{0:d}" HeaderText="Дата мероприятия" SortExpression="date_event" />
                <asp:BoundField DataField="time_event" DataFormatString="{0:t}" HeaderText="Время мероприяти" SortExpression="time_event" />
                <asp:BoundField DataField="place" HeaderText="Место мероприяти" SortExpression="place" />
                <asp:BoundField DataField="activity" HeaderText="Деятельность" SortExpression="activity" />
                <asp:BoundField DataField="status_bid" HeaderText="Статус заявки" SortExpression="status_bid" />
                <asp:BoundField DataField="date_bid" DataFormatString="{0:d}" HeaderText="Дата заявки" SortExpression="date_bid" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="bid_event" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [Q_event_bid]"></asp:SqlDataSource>
        <p style="text-align:left">
            <asp:Label ID="Label_event_bid" runat="server" Text="Заявок нет"></asp:Label>
        </p>
        
    </p>
    <p style="text-align:left; font-weight:bold">
        &nbsp;</p>

</asp:Content>

