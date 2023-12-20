<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="event_page.aspx.cs" Inherits="pages_event_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <p style="font-size:large"> Мероприятия</p>
        <asp:GridView ID="TableEvent" runat="server" AutoGenerateColumns="False" DataSourceID="DataBaseEvent" OnSelectedIndexChanged="TableEvent_SelectedIndexChanged">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="idEvent" HeaderText="ID" InsertVisible="False" SortExpression="idEvent" />
                <asp:BoundField DataField="name_event" HeaderText="Название" SortExpression="name_event" />
                <asp:BoundField DataField="date_event" HeaderText="Дата" SortExpression="date_event" DataFormatString="{0:d}" />
                <asp:BoundField DataField="time_event" HeaderText="Время" SortExpression="time_event" DataFormatString="{0:t}" />
                <asp:BoundField DataField="place" HeaderText="Место" SortExpression="place" />
                <asp:BoundField DataField="activity" HeaderText="Деятельность" SortExpression="activity" />
                <asp:BoundField DataField="surname" HeaderText="Волонтер" SortExpression="surname" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="DataBaseEvent" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [Q_event]"></asp:SqlDataSource>
        
        <br />
        <asp:Button ID="Button_to_order_event" runat="server" Text="Запись на мероприятие" OnClick="Order_event" />
        <br />
        <br />
        <p style="color:red">
        <asp:Label ID="Label_error_order_event" runat="server" Text="Label"></asp:Label>
        </p>
         

       
         

</asp:Content>

