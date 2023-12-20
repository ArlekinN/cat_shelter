<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="order_event.aspx.cs" Inherits="pages_order_event" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style type="text/css">
        .textbox{
            text-align: left;
        }

            .table_event_order {
                width: 100%;
                 text-align:left;
            }
            .left_colomn_event_order {
               
                width: 162px;
            }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p style="font-size:large">Заявка на мероприятие</p>
    <p style="font-size:large">
        <asp:GridView ID="TableUser" runat="server" AutoGenerateColumns="False" DataKeyNames="idUser" DataSourceID="user" Visible="false">
            <Columns>
                <asp:BoundField DataField="idUser" HeaderText="idUser" InsertVisible="False" ReadOnly="True" SortExpression="idUser" />
                <asp:BoundField DataField="surname" HeaderText="surname" SortExpression="surname" />
                <asp:BoundField DataField="name_user" HeaderText="name_user" SortExpression="name_user" />
                <asp:BoundField DataField="fatherland" HeaderText="fatherland" SortExpression="fatherland" />
                <asp:BoundField DataField="sex" HeaderText="sex" SortExpression="sex" />
                <asp:BoundField DataField="date_of_birth" HeaderText="date_of_birth" SortExpression="date_of_birth" />
                <asp:BoundField DataField="mail" HeaderText="mail" SortExpression="mail" />
                <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                <asp:BoundField DataField="login" HeaderText="login" SortExpression="login" />
                <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="user" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [all_user]"></asp:SqlDataSource>
    </p>
    <p style="font-size:large">
        <asp:GridView ID="TableEvent" runat="server" AutoGenerateColumns="False" DataSourceID="this_event" Visible="False">
            <Columns>
                <asp:BoundField DataField="idEvent" HeaderText="idEvent" InsertVisible="False" SortExpression="idEvent" />
                <asp:BoundField DataField="name_event" HeaderText="name_event" SortExpression="name_event" />
                <asp:BoundField DataField="date_event" HeaderText="date_event" SortExpression="date_event" DataFormatString="{0:d}" />
                <asp:BoundField DataField="time_event" HeaderText="time_event" SortExpression="time_event" DataFormatString="{0:t}" />
                <asp:BoundField DataField="place" HeaderText="place" SortExpression="place" />
                <asp:BoundField DataField="activity" HeaderText="activity" SortExpression="activity" />
                <asp:BoundField DataField="surname" HeaderText="surname" SortExpression="surname" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="this_event" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [Q_event]"></asp:SqlDataSource>
    </p>
    
    <table class="table_event_order">
        <tr>
            <td class="left_colomn_event_order">Фамилия</td>
            <td>
                <asp:Label ID="Label_surname" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="left_colomn_event_order ">Имя</td>
            <td>
                <asp:Label ID="Label_name" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="left_colomn_event_order">Отчество</td>
            <td>
                <asp:Label ID="Label_father" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="left_colomn_event_order ">Мероприятие</td>
            <td>
                <asp:Label ID="Label_event" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="left_colomn_event_order">Дата</td>
            <td>
                <asp:Label ID="Label_data" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="left_colomn_event_order">Время</td>
            <td>
                <asp:Label ID="Label_time" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="left_colomn_event_order">Место</td>
            <td>
                <asp:Label ID="Label_place" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td><br />
                <asp:Button ID="Button_order_event" runat="server" Text="Записаться" OnClick="Order_event" /></td>
        </tr>
    </table>
                  
    <br />
    <p style="text-align:left">
        <asp:Label ID="Label_result_order_event" runat="server" Text="Label"></asp:Label>
    </p>
    <p style="text-align:left">
        <asp:GridView ID="TableBid_event" runat="server" AutoGenerateColumns="False" DataKeyNames="idBid" DataSourceID="bid_event" Visible="false">
            <Columns>
                <asp:BoundField DataField="idBid" HeaderText="idBid" InsertVisible="False" ReadOnly="True" SortExpression="idBid" />
                <asp:BoundField DataField="idUser" HeaderText="idUser" SortExpression="idUser" />
                <asp:BoundField DataField="idEvent" HeaderText="idEvent" SortExpression="idEvent" />
                <asp:BoundField DataField="idStatus_bid" HeaderText="idStatus_bid" SortExpression="idStatus_bid" />
                <asp:BoundField DataField="date_bid" HeaderText="date_bid" SortExpression="date_bid" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="bid_event" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [bid_to_event]"></asp:SqlDataSource>
    </p>
      
</asp:Content>

