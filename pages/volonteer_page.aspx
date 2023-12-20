<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="volonteer_page.aspx.cs" Inherits="pages_volunteer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p style="font-size:large">
        Наши волонтеры</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idVolonteer" DataSourceID="DataBasaVolonteer">
            <Columns>
                <asp:BoundField DataField="idVolonteer" HeaderText="idVolonteer" InsertVisible="False" ReadOnly="True" SortExpression="idVolonteer" Visible="False" />
                <asp:BoundField DataField="surname" HeaderText="Фамилия" SortExpression="surname" />
                <asp:BoundField DataField="name_volonteer" HeaderText="Имя" SortExpression="name_volonteer" />
                <asp:BoundField DataField="fatherland" HeaderText="Отчество" SortExpression="fatherland" />
                <asp:BoundField DataField="sex" HeaderText="Пол" SortExpression="sex" />
                <asp:BoundField DataField="date_of_birth" DataFormatString="{0:d}" HeaderText="Дата рождения" SortExpression="date_of_birth" />
                <asp:BoundField DataField="photo" HeaderText="photo" SortExpression="photo" Visible="False" />
                <asp:TemplateField HeaderText="Фото">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("photo") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("photo") %>' Width="150px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="DataBasaVolonteer" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [volonteer]"></asp:SqlDataSource>
    </p>
</asp:Content>

