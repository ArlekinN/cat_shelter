<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="admin_order.aspx.cs" Inherits="pages_page_for_admin_order_admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .table {
            width: 40%;
            text-align:left
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>Заявки на кота</p>
    <table class="table">
        <tr>
            <td>Тип</td>
            <td>
                <asp:DropDownList ID="ListType" runat="server" AppendDataBoundItems="True" DataSourceID="DataTypeBid" DataTextField="type" DataValueField="idType_bid">
                <asp:ListItem Selected ="True" Value="0"> Не выбрано</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="DataTypeBid" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [type_bid]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>Статус</td>
            <td>
                <asp:DropDownList ID="ListStatus" runat="server" AppendDataBoundItems="True" DataSourceID="DataStatus" DataTextField="status_bid" DataValueField="idStatus_bid">
                <asp:ListItem Selected ="True" Value="0"> Не выбрано</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="DataStatus" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [status_bid]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <br />
    <p style="text-align:left">
    <asp:Button ID="Button_filter" runat="server" Text="Показать" onClick="Show_filter"/>
    <asp:Button ID="Button_show_all" runat="server" Text="Отмена" OnClick="Show_all" />
    </p>
    <p>
        <asp:GridView ID="TableCatBid" runat="server" AutoGenerateColumns="False" DataSourceID="DataBidCat" OnSelectedIndexChanged="TableCatBid_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="idBid" HeaderText="id заявки" InsertVisible="False" SortExpression="idBid" />
                <asp:BoundField DataField="idUser" HeaderText="id пользователя" SortExpression="idUser" />
                <asp:BoundField DataField="nickname" HeaderText="Кличка котика" SortExpression="nickname" />
                <asp:BoundField DataField="status_bid" HeaderText="Статус заявки" SortExpression="status_bid" />
                <asp:BoundField DataField="type" HeaderText="Тип заявки" SortExpression="type" />
                <asp:BoundField DataField="reason" HeaderText="Причина " SortExpression="reason" />
                <asp:BoundField DataField="date_bid" HeaderText="Дата" SortExpression="date_bid" DataFormatString="{0:d}" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="DataBidCat" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [Q_cat_bid]"></asp:SqlDataSource>
    </p>
    <p style="text-align:left">
        Информация о человеке</p>
    <p style="text-align:left">
        <asp:Button ID="Button_show_people" runat="server" Text="Показать" OnClick="Show_people" />
        <span style="color:red"><asp:Label ID="Err_bid_show" runat="server" Text="Выберите заявку"></asp:Label></span>
        <br />
        <asp:Button ID="Button_not_show_people" runat="server" Text="Скрыть" OnClick="Not_show_people"/>
    </p>
    
        <asp:GridView ID="TableUser" runat="server" AutoGenerateColumns="False" DataKeyNames="idUser" DataSourceID="DataUser" Visible="False">
            <Columns>
                <asp:BoundField DataField="idUser" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="idUser" />
                <asp:BoundField DataField="surname" HeaderText="Фамилия" SortExpression="surname" />
                <asp:BoundField DataField="name_user" HeaderText="Имя" SortExpression="name_user" />
                <asp:BoundField DataField="fatherland" HeaderText="Отчество" SortExpression="fatherland" />
                <asp:BoundField DataField="sex" HeaderText="Пол" SortExpression="sex" />
                <asp:BoundField DataField="date_of_birth" HeaderText="Дата рождения" SortExpression="date_of_birth" DataFormatString="{0:d}" />
                <asp:BoundField DataField="mail" HeaderText="Почта" SortExpression="mail" />
                <asp:BoundField DataField="phone" HeaderText="Телефон" SortExpression="phone" />
                <asp:BoundField DataField="login" HeaderText="login" SortExpression="login" Visible="False" />
                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" Visible="False" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="DataUser" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [all_user]"></asp:SqlDataSource>
    
    <p>
        Изменить статус заявки</p>
    <p style="text-align:left">
        <asp:DropDownList ID="List_ch_status" runat="server" DataSourceID="DataChStatus" DataTextField="status_bid" DataValueField="idStatus_bid">
        </asp:DropDownList>
        <asp:SqlDataSource ID="DataChStatus" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [status_bid]"></asp:SqlDataSource>
    </p>
    <p style="text-align:left">
        Причина отказа: 
        <asp:TextBox ID="TextBox_reason" runat="server"></asp:TextBox>
    </p>
    <p style="text-align:left">
        <asp:Button ID="Button_change_status" runat="server" Text="Изменить"  OnClick="ChangeStatus"/>
    <span style="color:red"><asp:Label ID="Label_err_status" runat="server" Text="Выберите заявку"></asp:Label></span>    
    </p>
    <p >
        Заявки на мероприятия</p>
    <p style="text-align:left">
        Статус 
        <asp:DropDownList ID="List_status_bid_event" runat="server" DataSourceID="DataStatusBidEvent" DataTextField="status_bid" DataValueField="idStatus_bid">
        </asp:DropDownList>
        <asp:SqlDataSource ID="DataStatusBidEvent" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [status_bid]"></asp:SqlDataSource>
        <asp:Button ID="Button_show_event_bid" runat="server" Text="Показать" OnClick="Show_event_bid" />
        <asp:Button ID="Button_not_show_event_bid" runat="server" Text="Отмена" OnClick="Not_show_event_bid" />
    </p>

    <asp:GridView ID="TableEvent" runat="server" AutoGenerateColumns="False" DataSourceID="DataEvent" OnSelectedIndexChanged="TableEvent_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="idBid" HeaderText="id заявки" SortExpression="idBid" InsertVisible="False" />
            <asp:BoundField DataField="idUser" HeaderText="id пользователя" SortExpression="idUser" />
            <asp:BoundField DataField="name_event" HeaderText="Мероприятие" SortExpression="name_event" />
            <asp:BoundField DataField="status_bid" HeaderText="Статус" SortExpression="status_bid" />
            <asp:BoundField DataField="date_bid" DataFormatString="{0:d}" HeaderText="Дата" SortExpression="date_bid" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="DataEvent" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [Q_admin_event]"></asp:SqlDataSource>

    <br />
    Изменить статус заявки<br />
    <p style="text-align:left">
        <asp:DropDownList ID="List_ch_status_ev" runat="server" DataSourceID="DataStatus_ch" DataTextField="status_bid" DataValueField="idStatus_bid"></asp:DropDownList>
        <asp:SqlDataSource ID="DataStatus_ch" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [status_bid]"></asp:SqlDataSource>
        <br />
        <br />
        <asp:Button ID="Button_ch_bid" runat="server" Text="Изменить" onClick="Change_bid_event" />
        <span style="color:red"><asp:Label ID="Err_bid_event" runat="server" Text="Выберите заявку"></asp:Label></span>
    </p>
    
</asp:Content>

