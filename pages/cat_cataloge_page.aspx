<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cat_cataloge_page.aspx.cs" Inherits="pages_cat_cataloge" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            position: relative;
            left: 5px;
            top: 0px;
        }
        .auto-style5 {
            width: 42px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table >
    <tr style="text-align:left">
        <td>Порода</td>
        <td>Возраст</td>
        <td>Пол</td>
        <td>&nbsp;</td>
        <td">&nbsp;</td>
        <td>Котик</td>
    </tr>
    <tr style="text-align:left">
        <td>
            <asp:DropDownList ID="ListBreed" runat="server" AutoPostBack="True" DataSourceID="BreedFilter" DataTextField="breed" DataValueField="breed" AppendDataBoundItems="True">
            <asp:ListItem Selected ="True" Value="0"> Не выбрано</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="BreedFilter" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT [breed] FROM [breed]"></asp:SqlDataSource>
        </td>
        <td>
            <asp:DropDownList ID="ListAge" runat="server" AutoPostBack="True">
                <asp:ListItem Selected="True" Value="0">Не выбрано</asp:ListItem>
                <asp:ListItem Value="1">Менее 1 года</asp:ListItem>
                <asp:ListItem Value="2">От 1 до 3 лет</asp:ListItem>
                <asp:ListItem Value="3">Более 3 лет</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td>
            <asp:DropDownList ID="ListSex" runat="server" AutoPostBack="True" DataSourceID="SexFilter" DataTextField="sex" DataValueField="sex" AppendDataBoundItems="True">
            <asp:ListItem Selected ="True" Value="0"> Не выбрано</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SexFilter" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT DISTINCT [sex] FROM [cat]"></asp:SqlDataSource>
        </td>
        <td >
            <asp:Button   ID="Button_show_filter" runat="server" Text="Показать" onClick="Show_filter_cat" CssClass="auto-style4" />
        </td>
        <td class="auto-style5" >
            &nbsp;</td>
        <td >
            <asp:TextBox ID="TextBox_name_cat" runat="server"></asp:TextBox>
        </td>
        <td >
            <asp:Button ID="Button_show_cat" runat="server" Text="Показать" onclick="Show_cat_name"/>
            <asp:Button ID="Button_show_all_cat" runat="server" Text="Отменить" onClick="Show_all_cat" />
        </td>
    </tr>
</table>
<br />
<asp:GridView ID="TableCat" runat="server" AutoGenerateColumns="False" DataSourceID="DataBaseCat" OnSelectedIndexChanged="TableCat_SelectedIndexChanged">
    <Columns>
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="idCat" HeaderText="ID" SortExpression="idCat" InsertVisible="False" />
        <asp:BoundField DataField="nickname" HeaderText="Кличка" SortExpression="nickname" />
        <asp:BoundField DataField="breed" HeaderText="Порода" SortExpression="breed" />
        <asp:BoundField DataField="sex" HeaderText="Пол" SortExpression="sex" />
        <asp:BoundField DataField="date_of_birth" HeaderText="Дата рождения" SortExpression="date_of_birth" DataFormatString="{0:d}" />
        <asp:BoundField DataField="reason" HeaderText="Причина нахождения в приюте" SortExpression="reason" />
        <asp:BoundField DataField="idStatus_cat" HeaderText="idStatus_cat" SortExpression="idStatus_cat" Visible="False" />
        <asp:BoundField DataField="minPhoto" HeaderText="minPhoto" InsertVisible="False" SortExpression="minPhoto" Visible="False" />
        <asp:BoundField DataField="photo" HeaderText="photo" SortExpression="photo" Visible="False" />
        <asp:TemplateField HeaderText="Фото">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("photo") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("photo") %>' Width="100px" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
    <asp:SqlDataSource ID="DataBaseCat" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [Q_cat]"></asp:SqlDataSource>
</asp:Content>

