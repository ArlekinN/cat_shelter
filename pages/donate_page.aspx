<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="donate_page.aspx.cs" Inherits="pages_donate_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p style="font-size:large">Сделать пожертвование</p>
    <table class="auto-style1">
        <tr>
            <td style="text-align:left">Сумма </td>
            <td>
                <asp:TextBox ID="Text_sum_donat" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align:center" colspan="2">
    <asp:Button  ID="Button_macht_donat" runat="server" Text="Отправить" OnClick="Send_donat" />
            </td>
        </tr>
    </table>
    <p style="text-align:left"><asp:Label ID="Label_donat_error" runat="server" Text="Label"></asp:Label></p>
    <br />
</asp:Content>

