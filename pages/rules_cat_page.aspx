<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="rules_cat_page.aspx.cs" Inherits="pages_rules_cat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p style="font-size:large">
        Правила сдачи кота в приют</p>
    <div style="text-align:left">
    1. Заполните заявку<br />
    2. После принятии заявки оплатите пошлину и отправьте чек на почту приюте
    <br />
    3. Принесите котика
    <br /> После оплаты пошлины мы с вами свяжемся
        <br />
        <br />
        <asp:Button ID="Button_order_in_shelter" runat="server" Text="Заявка на сдачу кота в приют" OnClick="in_shelter" />
        <br />
        <asp:Label ID="Label_shelter" runat="server" Text="Label"></asp:Label>
    </div>
</asp:Content>

