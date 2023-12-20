<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="admin_cat.aspx.cs" Inherits="pages_page_for_admin_cat_admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .table_cat{
            width: 70%;
            text-align: left;
        }
        .auto-style1 {
            
        }
        .auto-style3 {
            width: 60px;
        }
        .auto-style4 {
        width: 119px;
    }
        .auto-style5 {
            width: 190px;
        }
        .filter_ill {
            width: 100%;
            text-align:left;
        }
        .table_new_status_cat {
            width: 70%;
            text-align:left
        }
        .auto-style6 {
            width: 189px;
        }
        .table_illnesses {
            width: 70%;
            text-align:left
        }
        .auto-style7 {
            width: 100px;
        }
        .auto-style8 {
            width: 100px;
        }
        .auto-style9 {
            width: 80px;
        }
    .auto-style10 {
        width: 130px;
    }
        .table_new_ill {
            width: 40%;
            text-align: left;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="table_cat">
        <tr>
            <td class="auto-style9">Порода</td>
            <td class="auto-style3">Возраст</td>
            <td class="auto-style4">Пол</td>
            <td class="auto-style10">Статус</td>
            <td class="auto-style5">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9">
                <asp:DropDownList ID="List_breed" runat="server" AutoPostBack="True" DataSourceID="DataList_Breed"  AppendDataBoundItems="True" DataTextField="breed" DataValueField="breed">
                <asp:ListItem Selected ="True" Value="0"> Не выбрано</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="DataList_Breed" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT [breed] FROM [breed]"></asp:SqlDataSource>
            </td>
            <td class="auto-style3">
                <asp:DropDownList ID="List_age" runat="server" AutoPostBack="True">
                    <asp:ListItem Selected="True" Value="0">Не выбрано</asp:ListItem>
                    <asp:ListItem Value="1">Менее 1 года</asp:ListItem>
                    <asp:ListItem Value="2">От 1 до 3 лет</asp:ListItem>
                    <asp:ListItem Value="3">Более 3 лет</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="auto-style4">
                <asp:DropDownList ID="List_sex" runat="server" AutoPostBack="True" AppendDataBoundItems="True" DataSourceID="DataList_sex" DataTextField="sex" DataValueField="sex">
               <asp:ListItem Selected ="True" Value="0"> Не выбрано</asp:ListItem>
                    </asp:DropDownList>
                <asp:SqlDataSource ID="DataList_sex" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT DISTINCT [sex] FROM [cat]"></asp:SqlDataSource>
            </td>
            <td class="auto-style10">
                <asp:DropDownList ID="List_statusCat" runat="server" AutoPostBack="True" AppendDataBoundItems="True" DataSourceID="DataList_Status" DataTextField="status_cat" DataValueField="status_cat">
                 <asp:ListItem Selected ="True" Value="0"> Не выбрано</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="DataList_Status" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT [status_cat] FROM [status_cat]"></asp:SqlDataSource>
            </td>
            <td class="auto-style5">
                <asp:Button ID="Button_show_filter_cat" runat="server" Text="Показать" onclick="Show_filter_cat"/>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">
                &nbsp;</td>
            <td class="auto-style3">
                &nbsp;</td>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style10">
                &nbsp;</td>
            <td class="auto-style5">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9">
                Котик</td>
            <td class="auto-style3">
                <asp:TextBox ID="TextBox_cat" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style4">
                <asp:Button ID="Button_show_cat" runat="server" Text="Показать" onclick="Show_cat_name" />
            </td>
            <td class="auto-style10">
                <asp:Button ID="Button_show_all_cat" runat="server" Text="Отменить" onclick="Show_all_cat" />
            </td>
            <td class="auto-style5">
                &nbsp;</td>
        </tr>
    </table>

       
    <br />
    <br />
    Котик
    <br />
    <br />
    <asp:GridView ID="TableCat" runat="server" AutoGenerateColumns="False" DataSourceID="DataCat" OnSelectedIndexChanged="TableCat_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="idCat" HeaderText="id" InsertVisible="False" SortExpression="idCat" />
            <asp:BoundField DataField="nickname" HeaderText="Кличка" SortExpression="nickname" />
            <asp:BoundField DataField="breed" HeaderText="Порода" SortExpression="breed" />
            <asp:BoundField DataField="sex" HeaderText="Пол" SortExpression="sex" />
            <asp:BoundField DataField="date_of_birth" DataFormatString="{0:d}" HeaderText="Дата рождения" SortExpression="date_of_birth" />
            <asp:BoundField DataField="reason" HeaderText="Причина " SortExpression="reason" />
            <asp:BoundField DataField="status_cat" HeaderText="Статус" SortExpression="status_cat" />
            <asp:BoundField DataField="minPhoto" HeaderText="minPhoto" InsertVisible="False" SortExpression="minPhoto" Visible="False" />
            <asp:BoundField DataField="photo" HeaderText="photo" SortExpression="photo" Visible="False" />
            <asp:TemplateField HeaderText="Фото">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("photo") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("photo") %>' Width="100px" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

       

    <asp:SqlDataSource ID="DataCat" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [Q_cat_all]"></asp:SqlDataSource>

    <br /> <br /> 
    Изменить статус кота<br /><br />
    <table class="table_new_status_cat">
        <tr>
            <td class="auto-style6">
                Новый статус</td>
            <td>
                <asp:DropDownList ID="List_new_status_cat" runat="server" DataSourceID="DataList_new_status_cat" DataTextField="status_cat" DataValueField="idStatus_cat">
                </asp:DropDownList>
                <asp:SqlDataSource ID="DataList_new_status_cat" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [status_cat]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <p style="text-align:left">
        <asp:Button ID="Button_change_status_cat" runat="server" Text="Изменить" onclick="change_status_cat"/>

    </p>
    <p style="color:red; text-align:left"><asp:Label id="Err_status_cat" runat="server" Text="Выберите котика"></asp:Label></p>

    <br /><br />
    Фото<br />
    <asp:GridView ID="TablePhoto" runat="server" AutoGenerateColumns="False" DataSourceID="DataPhoto">
        <Columns>
            <asp:BoundField DataField="idCat" HeaderText="idCat" SortExpression="idCat" Visible="False" />
            <asp:BoundField DataField="nickname" HeaderText="Кличка" SortExpression="nickname" />
            <asp:BoundField DataField="photo" HeaderText="photo" SortExpression="photo" Visible="False" />
            <asp:TemplateField HeaderText="Фото">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("photo") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("photo") %>' Width="150px" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="date_photo" DataFormatString="{0:d}" HeaderText="Дата " SortExpression="date_photo" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="DataPhoto" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [Q_cat_photo]"></asp:SqlDataSource>
    

    <br />
    Болезни<br />
    <table class="filter_illnesses">
        <tr>
            <td class="auto-style7">Состояние:</td>
            <td class="auto-style8">
                <asp:DropDownList ID="List_state_cat" AppendDataBoundItems="True" runat="server" DataSourceID="DataList_stateCat" DataTextField="state_cat" DataValueField="state_cat">
                <asp:ListItem Selected ="True" Value="0"> Не выбрано</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="DataList_stateCat" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT [state_cat] FROM [state_cat]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:Button ID="Button_illnesses" runat="server" Text="Показать" onclick="Filter_state_cat" />
            </td>
        </tr>
    </table>
    <br />
    <asp:GridView ID="TableIllnesses" runat="server" AutoGenerateColumns="False" DataSourceID="DataMedicalCard" OnSelectedIndexChanged="TableIllnesses_SelectedIndexChanged" >
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="idMedical_card" HeaderText="id" SortExpression="idMedical_card" InsertVisible="False" />
            <asp:BoundField DataField="nickname" HeaderText="Кличка" SortExpression="nickname" />
            <asp:BoundField DataField="illnesses" HeaderText="Болезнь" SortExpression="illnesses" />
            <asp:BoundField DataField="date_of_illnesses" HeaderText="Дата заболевания" SortExpression="date_of_illnesses" DataFormatString="{0:d}" />
            <asp:BoundField DataField="vet_appoinment" HeaderText="Назначение врача" SortExpression="vet_appoinment" />
            <asp:BoundField DataField="date_of_recovery" HeaderText="Дата выздоровления" SortExpression="date_of_recovery" DataFormatString="{0:d}" />
            <asp:BoundField DataField="state_cat" HeaderText="Состояние" SortExpression="state_cat" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="DataMedicalCard" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [Q_cat_medical_card]"></asp:SqlDataSource>
    <br />
  
    Добавить болезнь
    котику<br />
    <p style="text-align:left">Выберите котика в таблице сверху</p>
    <table class="table_new_ill">
        <tr>
            <td>Болезнь</td>
            <td>
                <asp:DropDownList ID="List_ill" runat="server" DataSourceID="DataIll" DataTextField="illnesses" DataValueField="idIllnesses">
                </asp:DropDownList>
                <asp:SqlDataSource ID="DataIll" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [illnesses]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>Дата заболевания</td>
            <td>
                <asp:TextBox ID="TextBox_date_ill" runat="server" TextMode="Date"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Назначение врача</td>
            <td>
                <asp:TextBox ID="TextBox_vet_app" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>

    <asp:Button ID="Button_new_ill" runat="server" Text="Добавить" onClick="Add_new_ill"/>
    <br />
    <p style="color:red"><asp:Label ID="Err_about_new_ill" runat="server" Text="Сначала выберите котика"></asp:Label></p>
 
    <br />
     Добавить болезнь

    <br />
    <table class="table_new_ill">
        <tr>
            <td>Название</td>
            <td>
                <asp:TextBox ID="TextBox_new_ill" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>

    <asp:Button ID="Button_create_ill" runat="server" Text="Добавить" OnClick="Create_ill" />
    <br />
    <p style="color:green"><asp:Label ID="Mess_about_all_good_ill" runat="server" Text="Готово"></asp:Label></p>
    <br />

    <br /><br />Прививки<br />
    <asp:GridView ID="TableVaccination" runat="server" AutoGenerateColumns="False" DataSourceID="Data_vaccination">
        <Columns>
            <asp:BoundField DataField="nickname" HeaderText="Кличка" SortExpression="nickname" />
            <asp:BoundField DataField="vaccination" HeaderText="Прививка" SortExpression="vaccination" />
            <asp:BoundField DataField="date_vaccination" DataFormatString="{0:d}" HeaderText="Дата" SortExpression="date_vaccination" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="Data_vaccination" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [Q_cat_vaccination_card]"></asp:SqlDataSource>
    
    Добавить прививку котику<br />
<p style="text-align:left">Выберите котика в таблице сверху</p>
<table class="table_new_ill">
    <tr>
        <td>Прививка</td>
        <td>
            
            <asp:DropDownList ID="List_vac" runat="server" DataSourceID="DataVac" DataTextField="vaccination" DataValueField="idVaccination">
            </asp:DropDownList>
            <asp:SqlDataSource ID="DataVac" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [vaccination]"></asp:SqlDataSource>
            
        </td>
    </tr>
    <tr>
        <td>Дата прививки</td>
        <td>
            <asp:TextBox ID="TextBox_date_vac" runat="server" TextMode="Date"></asp:TextBox>
        </td>
    </tr>
</table>

<asp:Button ID="Button_new_vac" runat="server" Text="Добавить" onClick="Add_new_vac"/>
<br />
<p style="color:red"><asp:Label ID="Err_about_cat_vac" runat="server" Text="Сначала выберите котика"></asp:Label></p>
 
<br />
 Добавить прививку

<br />
<table class="table_new_ill">
    <tr>
        <td>Название</td>
        <td>
            <asp:TextBox ID="TextBox_new_vac" runat="server"></asp:TextBox>
        </td>
    </tr>
</table>

<asp:Button ID="Button_create_vac" runat="server" Text="Добавить" OnClick="Create_vac" />
<br />
<p style="color:green"><asp:Label ID="Label_good_vac" runat="server" Text="Готово"></asp:Label></p>
<br />

    </asp:Content>

