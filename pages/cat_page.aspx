<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="cat_page.aspx.cs" Inherits="pages_cat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .table_cat_page_cat {
            width: 100%;
            text-align:left;
        }
        .left_colomn_cat_table {
            width: 290px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Котик
        <asp:Label ID="Label_name" runat="server" Text="Label"></asp:Label>
    </p>
    <p>
        <asp:GridView ID="TableCat" runat="server" AutoGenerateColumns="False" DataSourceID="DataCat" Visible="False">
            <Columns>
                <asp:BoundField DataField="nickname" HeaderText="nickname" SortExpression="nickname" />
                <asp:BoundField DataField="idCat" HeaderText="idCat" InsertVisible="False" SortExpression="idCat" />
                <asp:BoundField DataField="breed" HeaderText="breed" SortExpression="breed" />
                <asp:BoundField DataField="date_of_birth" HeaderText="date_of_birth" SortExpression="date_of_birth" DataFormatString="{0:d}" />
                <asp:BoundField DataField="sex" HeaderText="sex" SortExpression="sex" />
                <asp:BoundField DataField="reason" HeaderText="reason" SortExpression="reason" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="DataCat" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT [nickname], [idCat], [breed], [date_of_birth], [sex], [reason] FROM [Q_cat]"></asp:SqlDataSource>
    </p>
    <table class="table_cat_page_cat">
        <tr>
            <td class="left_colomn_cat_table">Порода</td>
            <td>
                <asp:Label ID="Label_breed" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="left_colomn_cat_table">Пол</td>
            <td>
                <asp:Label ID="Label_sex" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="left_colomn_cat_table">Дата рождения</td>
            <td>
                <asp:Label ID="Label_birth" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="left_colomn_cat_table">Причина попадания в приют</td>
            <td>
                <asp:Label ID="Label_reason" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="left_colomn_cat_table">Прививки</td>
            <td>
                <asp:GridView ID="Tablevaccination" runat="server" AutoGenerateColumns="False" DataSourceID="DataVaccination">
                    <Columns>
                        <asp:BoundField DataField="idCat" HeaderText="idCat" SortExpression="idCat" Visible="False" />
                        <asp:BoundField DataField="vaccination" HeaderText="Прививка" SortExpression="vaccination" />
                        <asp:BoundField DataField="date_vaccination" DataFormatString="{0:d}" HeaderText="Дата вакцинации" SortExpression="date_vaccination" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DataVaccination" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [Q_vaccination]"></asp:SqlDataSource>
                <asp:Label ID="Label_vaccination" runat="server" Text="Label"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td class="left_colomn_cat_table">Болезни</td>
            <td>
                <asp:GridView ID="TableMedical_card" runat="server" AutoGenerateColumns="False" DataSourceID="DataIllnesses">
                    <Columns>
                        <asp:BoundField DataField="idCat" HeaderText="idCat" SortExpression="idCat" Visible="False" />
                        <asp:BoundField DataField="illnesses" HeaderText="Болезнь" SortExpression="illnesses" />
                        <asp:BoundField DataField="date_of_illnesses" HeaderText="Дата заболевания" SortExpression="date_of_illnesses" DataFormatString="{0:d}" />
                        <asp:BoundField DataField="vet_appoinment" HeaderText="Назначение врача" SortExpression="vet_appoinment" />
                        <asp:BoundField DataField="date_of_recovery" DataFormatString="{0:d}" HeaderText="Дата выздоровления" SortExpression="date_of_recovery" />
                        <asp:BoundField DataField="state_cat" HeaderText="Состояние" SortExpression="state_cat" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="DataIllnesses" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [Q_medical_card]"></asp:SqlDataSource>
                <br />
                <asp:Label ID="Label_illnesses" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:GridView ID="TablePhoto" runat="server" AutoGenerateColumns="False" DataSourceID="DataPhoto">
        <Columns>
            <asp:BoundField DataField="idCat" HeaderText="idCat" SortExpression="idCat" Visible="False" />
            <asp:BoundField DataField="photo" HeaderText="photo" SortExpression="photo" Visible="False" />
            <asp:TemplateField HeaderText="Фото">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("photo") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("photo") %>' Width="200px" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="DataPhoto" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT [idCat], [photo] FROM [photo]"></asp:SqlDataSource>
    <br />
    <br />
    <asp:Button ID="Button_oreder_cat" runat="server" Text="Подать заявку" OnClick="Order_cat" />
    <br />
    <p style="color:red">
    <asp:Label ID="Label_button_order_cat" runat="server" Text="Label"></asp:Label>
        </p>
</asp:Content>

