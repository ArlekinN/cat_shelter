<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="admin_page.aspx.cs" Inherits="pages_admin_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align:left">
        <p>
            <asp:LinkButton ID="LinkButton_cat" runat="server" OnClick="To_admin_cat">Котики</asp:LinkButton>
        </p>
        <p>
            <asp:LinkButton ID="LinkButton_event" runat="server" OnClick="To_admin_event">Мероприятия</asp:LinkButton>
        </p>
        <p>
            <asp:LinkButton ID="LinkButton_order_cat" runat="server" OnClick="To_admin_order">Заявки на котиков</asp:LinkButton>
        </p>

    </div>
</asp:Content>

