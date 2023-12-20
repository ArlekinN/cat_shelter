<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="dop_info_page.aspx.cs" Inherits="pages_dop_info_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .dop_info__table_contacts {
            width: 100%;
        }
        .dop_info_contacts{
            width: 121px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p style="font-size:large">
        Наш приют</p>
    <div style="text-align:left">
    <div >
        Информация о приюте:
    </div>
    <br />
    Контакты:

        <br />
        <table class="dop_info_table_contacts">
            <tr>
                <td class="dop_info_contacts">Почта:</td>
                <td> 
                    <asp:Label ID="mail" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="dop_info_contacts">Телефон:</td>
                <td>
                    <asp:Label ID="phone" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        Наш адрес:<asp:Label ID="adress" runat="server" Text="Label"></asp:Label>
    </div>
</asp:Content>

