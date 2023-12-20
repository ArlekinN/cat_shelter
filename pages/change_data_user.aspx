<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="change_data_user.aspx.cs" Inherits="pages_Change_data_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
     .auto-style1 {
        text-align:left;
     }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Изменить данные</p>
    <p style="text-align:left">
        Введите данные которых хотите изменить</p>
    <table class="auto-style1">
        <tr>
            <td width="20%">Фамилия</td>
            <td style="text-align:left" >
                <asp:TextBox ID="TextBox_surname" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td width="20%">Имя</td>
            <td style="text-align:left">
                <asp:TextBox ID="TextBox_name" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="20%">Отчество</td>
            <td style="text-align:left">
                <asp:TextBox ID="TextBox_fatherland" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="20%">Пол</td>
            <td style="text-align:left">
                
                <asp:DropDownList ID="DropDownList_sex" runat="server">
                    <asp:ListItem Selected="True">М</asp:ListItem>
                    <asp:ListItem>Ж</asp:ListItem>
                </asp:DropDownList>
                
            </td>
        </tr>
        <tr>
            <td width="20%">Дата рождения</td>
            <td style="text-align:left">
                <asp:TextBox ID="TextBox_date_of_birth" runat="server" TextMode="Date"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="20%">Почта</td>
            <td style="text-align:left">
                <asp:TextBox ID="TextBox_mail" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="20%">Телефон</td>
            <td style="text-align:left">
                <asp:TextBox ID="TextBox_phone" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="20%">Логин</td>
            <td style="text-align:left">
                <asp:TextBox ID="TextBox_login" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td width="20%">Пароль</td>
            <td style="text-align:left">
                <asp:TextBox ID="TextBox_password" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <br />
    <p style="text-align:left"><asp:Button ID="Button_change" runat="server" Text="Изменить" OnClick="Change_data" /></p>
    
</asp:Content>

