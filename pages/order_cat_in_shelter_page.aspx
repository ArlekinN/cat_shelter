<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="order_cat_in_shelter_page.aspx.cs" Inherits="pages_order_cat_in_shelter_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 144px;
        }
        .auto-style3 {
            width: 190px;
        }
        .auto-style4 {
            width: 141px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p style="font-size:large"> 
        Заявка для сдачи котика в приют</p>
    <p style="font-size:large"> 
        <asp:GridView ID="TableBreed" runat="server" AutoGenerateColumns="False" DataKeyNames="idBreed" DataSourceID="all_breed" Visible="false">
            <Columns>
                <asp:BoundField DataField="idBreed" HeaderText="idBreed" InsertVisible="False" ReadOnly="True" SortExpression="idBreed" />
                <asp:BoundField DataField="breed" HeaderText="breed" SortExpression="breed" />
            </Columns>
        </asp:GridView>
        <asp:GridView ID="TableCat" runat="server" AutoGenerateColumns="False" DataKeyNames="idCat" DataSourceID="DataCat" Visible="false">
            <Columns>
                <asp:BoundField DataField="idCat" HeaderText="idCat" InsertVisible="False" ReadOnly="True" SortExpression="idCat" />
                <asp:BoundField DataField="nickname" HeaderText="nickname" SortExpression="nickname" />
                <asp:BoundField DataField="idBreed" HeaderText="idBreed" SortExpression="idBreed" />
                <asp:BoundField DataField="sex" HeaderText="sex" SortExpression="sex" />
                <asp:BoundField DataField="date_of_birth" HeaderText="date_of_birth" SortExpression="date_of_birth" />
                <asp:BoundField DataField="reason" HeaderText="reason" SortExpression="reason" />
                <asp:BoundField DataField="idStatus_cat" HeaderText="idStatus_cat" SortExpression="idStatus_cat" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="DataCat" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [cat]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="all_breed" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [breed]"></asp:SqlDataSource>
    </p>
    <div style="text-align:left">
    <p style="font-size:large"> 
        Информация о котике</p>
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">Кличка</td>
            <td>
                <asp:TextBox ID="TextBox_cat_name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Заполните" ControlToValidate="TextBox_cat_name" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Порода</td>
            <td>
                <asp:DropDownList ID="ListBreed" runat="server" AutoPostBack="True" AppendDataBoundItems="True" DataSourceID="breed" DataTextField="breed" DataValueField="breed">
                <asp:ListItem Selected ="True" Value="0">Другое</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="breed" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT [breed] FROM [breed]"></asp:SqlDataSource>
                &nbsp;если породы вашего котика нет в списке, то напишите ее
                <asp:TextBox ID="TextBox_breed" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
                </td>
        </tr>
        <tr>
            <td class="auto-style2">Пол</td>
            <td>
                <asp:DropDownList ID="ListSex" runat="server" AutoPostBack="True" DataSourceID="sex" DataTextField="sex" DataValueField="sex">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sex" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT DISTINCT [sex] FROM [cat]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Дата рождения</td>
            <td>
                <asp:TextBox ID="TextBox_birth" runat="server" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Заполните" ControlToValidate="TextBox_birth" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Причина</td>
            <td>
                <asp:TextBox ID="TextBox_reason" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Заполните" ControlToValidate="TextBox_reason" EnableClientScript="False" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
        <br />
        <asp:Button ID="Button_create_cat" runat="server" Text="Отправить информацию о котике" OnClick="Create_cat" />
        <br />
        <p style="color:green">
        <asp:Label ID="Label_craete_cat" runat="server" Text=""></asp:Label>
        </p>
            <br />
        <br />
        <asp:GridView ID="illnesses" runat="server" AutoGenerateColumns="False" DataKeyNames="idIllnesses" DataSourceID="illness" Visible="false">
            <Columns>
                <asp:BoundField DataField="idIllnesses" HeaderText="idIllnesses" InsertVisible="False" ReadOnly="True" SortExpression="idIllnesses" />
                <asp:BoundField DataField="illnesses" HeaderText="illnesses" SortExpression="illnesses" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="illness" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [illnesses]"></asp:SqlDataSource>
        <br />
        <p style="font-size:large">Заболевания
        </p>

        <table class="auto-style1">
            <tr>
                <td class="auto-style3">Болезнь</td>
                <td>
                    <asp:DropDownList ID="ListIllnesses" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="DataIllnesses" DataTextField="illnesses" DataValueField="illnesses">
                    <asp:ListItem Selected ="True" Value="0">Другое</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="DataIllnesses" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT [illnesses] FROM [illnesses]"></asp:SqlDataSource>
&nbsp;или
                    <asp:TextBox ID="TextBox_illnesses" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Дата заболевания</td>
                <td>
                    <asp:TextBox ID="TextBox_date_ill" runat="server" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Назначение врача</td>
                <td>
                    <asp:TextBox ID="TextBox_vet_app" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Дата выздоровления</td>
                <td>
                    <asp:TextBox ID="TextBox_date_rec" runat="server" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Состояние</td>
                <td>
                    <asp:DropDownList ID="ListStateCat" runat="server"  AutoPostBack="True" DataSourceID="DataStateCat" DataTextField="state_cat" DataValueField="state_cat">
                    
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="DataStateCat" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT [state_cat] FROM [state_cat]"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <asp:Button ID="Button_add_illnesses" runat="server" Text="Добавить болезнь" OnClick="Add_illnesses" />
        <p style="color:red">
        <asp:Label ID="Label_error_ill" runat="server" Text="Сначала внесите информацию о котике"></asp:Label>
        </p>
            <br />
        <asp:GridView ID="Table_illnesses" runat="server" AutoGenerateColumns="False" DataSourceID="DataMedicalCard" Visible="false">
            <Columns>
                <asp:TemplateField HeaderText="Заболевание" SortExpression="idIllnesses">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="illlness_new_cat" DataTextField="illnesses" DataValueField="idIllnesses" SelectedValue='<%# Bind("idIllnesses") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="illlness_new_cat" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [illnesses]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="illness_new_cat" DataTextField="illnesses" DataValueField="idIllnesses" SelectedValue='<%# Bind("idIllnesses") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="illness_new_cat" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [illnesses]"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="date_of_illnesses" DataFormatString="{0:d}" HeaderText="Дата заболевания" SortExpression="date_of_illnesses" />
                <asp:BoundField DataField="vet_appoinment" HeaderText="Назначение врача" SortExpression="vet_appoinment" />
                <asp:BoundField DataField="date_of_recovery" DataFormatString="{0:d}" HeaderText="Дата выздоровления" SortExpression="date_of_recovery" />
                <asp:TemplateField HeaderText="Состояние" SortExpression="idState_cat">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" DataSourceID="state_new_cat" DataTextField="state_cat" DataValueField="idState" SelectedValue='<%# Bind("idState_cat") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="state_new_cat" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [state_cat]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="state_new_cat" DataTextField="state_cat" DataValueField="idState" SelectedValue='<%# Bind("idState_cat") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="state_new_cat" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [state_cat]"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="DataMedicalCard" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT [idIllnesses], [date_of_illnesses], [vet_appoinment], [date_of_recovery], [idState_cat] FROM [medical_card]"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="TableVaccination" runat="server" AutoGenerateColumns="False" DataKeyNames="idVaccination" DataSourceID="DataVaccination" Visible="false">
            <Columns>
                <asp:BoundField DataField="idVaccination" HeaderText="idVaccination" InsertVisible="False" ReadOnly="True" SortExpression="idVaccination" />
                <asp:BoundField DataField="vaccination" HeaderText="vaccination" SortExpression="vaccination" />
            </Columns>
        </asp:GridView>
        <asp:GridView ID="TableSateCat" runat="server" AutoGenerateColumns="False" DataKeyNames="idState" DataSourceID="Sqlstatecat" Visible="false">
            <Columns>
                <asp:BoundField DataField="idState" HeaderText="idState" InsertVisible="False" ReadOnly="True" SortExpression="idState" />
                <asp:BoundField DataField="state_cat" HeaderText="state_cat" SortExpression="state_cat" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="Sqlstatecat" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [state_cat]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DataVaccination" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [vaccination]"></asp:SqlDataSource>
        <br />
        <p style="font-size:large">Прививки</p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">Прививка</td>
                <td>
                    <asp:DropDownList ID="List_vaccination" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="DataListVaccin" DataTextField="vaccination" DataValueField="idVaccination">
                    <asp:ListItem Selected ="True" Value="0">Другое</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="DataListVaccin" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [vaccination]"></asp:SqlDataSource>
                &nbsp;или
                    <asp:TextBox ID="TextBox_input_vaccin" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Дата прививки</td>
                <td>
                    <asp:TextBox ID="TextBox_date_vaccin" runat="server" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:Button ID="Button_add_vaccin" runat="server" Text="Добавить прививку" OnClick="Add_vaccination" />
        <p style="color:red">
        <asp:Label ID="Label_error_vaccin" runat="server" Text="Сначала внесите информацию о котике"></asp:Label>
        </p>
            <br />
        <asp:GridView ID="Table_vaccination_card" runat="server" AutoGenerateColumns="False" DataSourceID="DataVaccinationCard" Visible="false">
            <Columns>
                <asp:TemplateField HeaderText="Прививка" SortExpression="idVaccination">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList6" runat="server" AutoPostBack="True" DataSourceID="vaccin_new_cat" DataTextField="vaccination" DataValueField="idVaccination" SelectedValue='<%# Bind("idVaccination") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="vaccin_new_cat" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [vaccination]"></asp:SqlDataSource>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" DataSourceID="vaccin_new_cat" DataTextField="vaccination" DataValueField="idVaccination" SelectedValue='<%# Bind("idVaccination") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="vaccin_new_cat" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT * FROM [vaccination]"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="date_vaccination" DataFormatString="{0:d}" HeaderText="Дата прививки" SortExpression="date_vaccination" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="DataVaccinationCard" runat="server" ConnectionString="<%$ ConnectionStrings:DataBaseCat %>" ProviderName="<%$ ConnectionStrings:DataBaseCat.ProviderName %>" SelectCommand="SELECT [idVaccination], [date_vaccination] FROM [vaccination_card]"></asp:SqlDataSource>
        <br />
        <br />
        <asp:Button ID="Button_order_cat_in_shelter" runat="server" Text="Отправить заявку" OnClick="Send_order" />
        <br />
        <p style="color:red">
        <asp:Label ID="Label_message_order_in_shelter" runat="server" Text="Сначала внесити информацию о котике"></asp:Label>
        </p>
        <p style="color:green">
            <asp:Label ID="Label_message_ok_cat" runat="server" Text="Заявка отправлена"></asp:Label>
        </p>
    </div>
</asp:Content>

