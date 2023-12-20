<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="change_medical_card.aspx.cs" Inherits="pages_Change_medical_card" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            text-align:left;
        }
        .auto-style2 {
            width: 206px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Болезнь</p>
    <p>
        <asp:GridView ID="Table_illness" runat="server" AutoGenerateColumns="False" DataSourceID="DataIll">
            <Columns>
                <asp:BoundField DataField="idMedical_card" HeaderText="id" InsertVisible="False" SortExpression="idMedical_card" />
                <asp:BoundField DataField="nickname" HeaderText="Кличка" SortExpression="nickname" />
                <asp:BoundField DataField="illnesses" HeaderText="Болезнь" SortExpression="illnesses" />
                <asp:BoundField DataField="date_of_illnesses" DataFormatString="{0:d}" HeaderText="Дата заболевания" SortExpression="date_of_illnesses" />
                <asp:BoundField DataField="vet_appoinment" HeaderText="Назначение врача" SortExpression="vet_appoinment" />
                <asp:BoundField DataField="date_of_recovery" DataFormatString="{0:d}" HeaderText="Дата выздоровления" SortExpression="date_of_recovery" />
                <asp:BoundField DataField="state_cat" HeaderText="Состояние" SortExpression="state_cat" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="DataIll" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [Q_cat_medical_card]"></asp:SqlDataSource>
    </p>
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">Дата выздоровления</td>
            <td>
                <asp:TextBox ID="TextBox_change_date" runat="server" TextMode="Date"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Состояние</td>
            <td>
                <asp:DropDownList ID="List_new_state" runat="server" DataSourceID="DataList_new_state" DataTextField="state_cat" DataValueField="idState">
                </asp:DropDownList>
                <asp:SqlDataSource ID="DataList_new_state" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [state_cat]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="Button_change_ill" runat="server" Text="Изменить" onclick="change_ill"/>
</asp:Content>

