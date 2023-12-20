<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    
    <p style="font-size:large">
        Приют котов &quot;Твой котик&quot;</p>
    <div style="text-align:left">
         Каждый заслуживает себе друга. Мы поможем тебе найти своего. <br />
        В нашем приюте более 100 котиков, и какой-то из низ ждет именно тебя!
        Сделай сразу две жизни лушче!
    </div>
    <div>
    <asp:Image ID="Image_cat_and_man" runat="server" src="/image/cat_and_man.jpg" AlternateText="cat" width="500px"  />
    
        <br />
    
    </div>

    
    
</asp:Content>

