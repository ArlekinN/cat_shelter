<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="regestration_page.aspx.cs" Inherits="pages_regestration_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .textbox{
            text-align: left;
        }
        .auto-style1 {
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p style="font-size:large">Регистрация</p>
    <table class="textbox">
        <tr >
            <td >Фамилия</td>
            <td>
                <asp:TextBox ID="TextBox_surname" Runat="server"  />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="FieldValidator_surname" runat="server" ControlToValidate="TextBox_surname" EnableClientScript="False" ErrorMessage="Заполните поле " ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr >
            <td >Имя</td>
            <td >
                <asp:TextBox ID="TextBox_name" runat="server" />
            </td>
            <td >
                <asp:RequiredFieldValidator ID="FieldValidator_name" runat="server" ControlToValidate="TextBox_name" EnableClientScript="False" ErrorMessage="Заполните поле " ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Отчество</td>
            <td >
                <asp:TextBox ID="TextBox_father" runat="server"></asp:TextBox>
            </td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td  >Пол</td>
            <td >
                <asp:DropDownList ID="List_sex" runat="server" DataSourceID="sex_user" DataTextField="sex" DataValueField="sex" AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sex_user" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT DISTINCT [sex] FROM [all_user]"></asp:SqlDataSource>
            </td>
            <td >
                &nbsp;</td>
        </tr>
        <tr>
            <td >Дата рождения</td>
            <td >
                <asp:TextBox ID="TextBox_date_birth" runat="server" TextMode="Date"></asp:TextBox>
            </td>
            <td >
                <asp:RequiredFieldValidator ID="FieldValidator_birth" runat="server" ControlToValidate="TextBox_date_birth" EnableClientScript="False" ErrorMessage="Заполните поле " ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td >Почта</td>
            <td>
                <asp:TextBox ID="TextBox_mail" runat="server" TextMode="Email"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="FieldValidator_mail" runat="server" ControlToValidate="TextBox_mail" EnableClientScript="False" ErrorMessage="Заполните поле " ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="ExpressionValidator_mail" runat="server" ControlToValidate="TextBox_mail" EnableClientScript="False" ErrorMessage="Неверный формат" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td >Телефон</td>
            <td >
                <asp:TextBox ID="TextBox_phone" runat="server" TextMode="Phone"></asp:TextBox>
            </td>
            <td >
                <asp:RequiredFieldValidator ID="FieldValidator_phone" runat="server" ControlToValidate="TextBox_phone" EnableClientScript="False" ErrorMessage="Заполните поле " ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td >Логин</td>
            <td>
                <asp:TextBox ID="TextBox_login" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="FieldValidator_login" runat="server" ControlToValidate="TextBox_login" EnableClientScript="False" ErrorMessage="Заполните поле " ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td >Пароль</td>
            <td >
                <asp:TextBox ID="TextBox_password" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td >
                <asp:RequiredFieldValidator ID="FieldValidator_password" runat="server" ControlToValidate="TextBox_password" EnableClientScript="False" ErrorMessage="Заполните поле " ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Повторите пароль</td>
            <td >
                <asp:TextBox ID="TextBox_password_2" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td >
                <asp:RequiredFieldValidator ID="FieldValidator_password_2" runat="server" ControlToValidate="TextBox_password_2" EnableClientScript="False" ErrorMessage="Заполните поле " ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator_passsword_2" runat="server" ControlToCompare="TextBox_password" ControlToValidate="TextBox_password_2" EnableClientScript="False" ErrorMessage="CompareValidator" ForeColor="Red">Пароли не совпадают</asp:CompareValidator>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="Button_regestration" runat="server" Text="Зарегестрироваться" OnClick="regestration" />
    <br />
    <br />
    <asp:Label ID="Error_regectration" runat="server"></asp:Label>
    <br />
    </asp:Content>

