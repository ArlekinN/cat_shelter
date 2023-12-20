<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="admin_event.aspx.cs" Inherits="pages_page_for_admin_event_admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            text-align:left;
        }
        .auto-style2 {
            width: 70px;
        }
        .auto-style3 {
            width: 80px;
        }
        .auto-style4 {
            width: 100%;
            text-align:left;
        }
        .auto-style5 {
            width: 163px;
        }
        .table_event {
            width: 40%;
            text-align:left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>Мероприятия</p>
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">Статус:</td>
            <td class="auto-style3">
                <asp:DropDownList ID="ListTimeStatus" runat="server">
                    <asp:ListItem Value="0">Не выбрано</asp:ListItem>
                    <asp:ListItem Value="1">Прошло</asp:ListItem>
                    <asp:ListItem Value="2">Предстоит</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:Button ID="Button_show" runat="server" Text="Показать" OnClick="Filter_event" />
            </td>
        </tr>
    </table>

    <asp:GridView ID="TableEvent" runat="server" AutoGenerateColumns="False" DataSourceID="DataEvent" OnSelectedIndexChanged="TableEvent_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="idEvent" HeaderText="id" InsertVisible="False" SortExpression="idEvent" />
            <asp:BoundField DataField="name_event" HeaderText="Тип" SortExpression="name_event" />
            <asp:BoundField DataField="date_event" DataFormatString="{0:d}" HeaderText="Дата" SortExpression="date_event" />
            <asp:BoundField DataField="time_event" DataFormatString="{0:t}" HeaderText="Время" SortExpression="time_event" />
            <asp:BoundField DataField="place" HeaderText="Место" SortExpression="place" />
            <asp:BoundField DataField="activity" HeaderText="Деятельность" SortExpression="activity" />
            <asp:BoundField DataField="surname" HeaderText="Волонтер" SortExpression="surname" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="DataEvent" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [Q_event]"></asp:SqlDataSource>
    <br />
    Редактировать мероприятие<br />
    <table class="table_event">
        <tr>
            <td>Дата</td>
            <td>
                <asp:TextBox ID="TextBox_date_ch" runat="server" TextMode="Date"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Время</td>
            <td>
                <asp:TextBox ID="TextBox_time_ch" runat="server"></asp:TextBox>
            &nbsp;В формате чч:мм</td>
        </tr>
        <tr>
            <td>Место</td>
            <td>
                <asp:TextBox ID="TextBox_place_ch" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Волонтер</td>
            <td>
                <asp:DropDownList ID="List_volont" runat="server" AppendDataBoundItems="True" DataSourceID="Datavolon" DataTextField="surname" DataValueField="idVolonteer">
                <asp:ListItem Selected ="True" Value="0"> Не выбрано</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="Datavolon" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT [idVolonteer], [surname] FROM [volonteer]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
    
    <asp:Button ID="Button_change_event" runat="server" Text="Изменить" OnClick="Change_event" /><br />
    <p style="color:red"><asp:Label ID="Err_event" runat="server" Text="Выберите мероприятие"></asp:Label></p>
    
    <br />
    <p style="text-align:left">Создание нового мероприятия</p>
    <table class="auto-style4">
        <tr>
            <td class="auto-style5">Название</td>
            <td>
                <asp:DropDownList ID="List_type" runat="server" DataSourceID="DataTypeEvent" DataTextField="name_event" DataValueField="idType_event">
                </asp:DropDownList>
                <asp:SqlDataSource ID="DataTypeEvent" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [type_event]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Дата</td>
            <td>
                <asp:TextBox ID="TextBox_date" runat="server" TextMode="Date"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Время</td>
            <td>
                <asp:TextBox ID="TextBox_time" runat="server"></asp:TextBox>
            &nbsp;В формате чч:мм</td>
        </tr>
        <tr>
            <td class="auto-style5">Место</td>
            <td>
                <asp:TextBox ID="TextBox_place" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Деятельность</td>
            <td>
                <asp:TextBox ID="TextBox_activ" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Фамилия</td>
            <td>
                <asp:DropDownList ID="List_volon" runat="server" DataSourceID="DataVolonteer" DataTextField="surname" DataValueField="idVolonteer">
                </asp:DropDownList>
                <asp:SqlDataSource ID="DataVolonteer" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT [idVolonteer], [surname] FROM [volonteer]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>

    
    <asp:Button ID="Button_add_event" runat="server" Text="Добавить" OnClick="Add_event" />
    <br />
    
    
</asp:Content>

