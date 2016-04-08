<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset>
        <legend>Gegevens</legend>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Aanvrager: " CssClass="label"></asp:Label>
            <asp:TextBox ID="tbxAanvrager" runat="server" CssClass="textBox"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vul een naam in!" 
                Display="Dynamic" ControlToValidate="tbxAanvrager" CssClass="validator">?</asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="Lokaal: " CssClass="label"></asp:Label>
            <asp:DropDownList ID="ddlLokaal" runat="server" CssClass="dropDownList" 
                DataSourceID="dtsrcLokalen" AppendDataBoundItems="True" DataTextField="LokaalNaam" 
                DataValueField="Lokaal_id" AutoPostBack="True" OnSelectedIndexChanged="ddlLokaal_SelectedIndexChanged" >
                <asp:ListItem Value="-1">Selecteer een lokaal...</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
          ErrorMessage="Kies een lokaal!" InitialValue="-1" CssClass="validator" 
                ControlToValidate="ddlLokaal" Display="Dynamic">?</asp:RequiredFieldValidator>
        </p>
        <asp:SqlDataSource ID="dtsrcLokalen" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [LokaalNaam], [Lokaal_id] FROM [Lokalen]"></asp:SqlDataSource>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Printer: " CssClass="label"></asp:Label>
            <asp:DropDownList ID="ddlPrinter" runat="server" CssClass="dropDownList" DataSourceID="dtsrcPrinter" 
                DataTextField="Printernaam" DataValueField="Printer_id" AppendDataBoundItems="True" AutoPostBack="True">
                <asp:ListItem Value="-1">Selecteer een printer...</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
          ErrorMessage="Kies een Printer!" InitialValue="-1" CssClass="validator" 
                ControlToValidate="ddlPrinter" Display="Dynamic">?</asp:RequiredFieldValidator>
        </p>
        <asp:SqlDataSource ID="dtsrcPrinter" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT Merk + '-' + Model AS Printernaam, Printer_id FROM Printers WHERE (Lokaal_id = @Lokaal_id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlLokaal" Name="Lokaal_id" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <p>
            <asp:Label ID="Label4" runat="server" Text="Cartridges: " CssClass="label"></asp:Label>
            <asp:CheckBoxList ID="cbxToners" runat="server" CssClass="checkBoxList" AutoPostBack="True" DataSourceID="dtsrcCartridges" DataTextField="Cartridgess" DataValueField="Printer_id">
            </asp:CheckBoxList>
            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Kies de toners die vervangen moeten worden!" 
                OnServerValidate="CustomValidator1_ServerValidate" CssClass="validator" Display="Dynamic">?</asp:CustomValidator>            
        </p>
        <asp:SqlDataSource ID="dtsrcCartridges" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT Cartridges.Cartridge_id + ' - ' + Cartridges.Kleur AS Cartridgess, PrinterCartridges.Printer_id FROM Cartridges INNER JOIN PrinterCartridges ON Cartridges.Cartridge_id = PrinterCartridges.Cartridge_id WHERE (Printer_id = @Printer_id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlPrinter" Name="Printer_id" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </fieldset>
    <div class="button_field">
        <asp:Button ID="btnNext" runat="server" Text="Next" CssClass="button" OnClick="btnNext_Click"/>
    </div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validation_summary"/>
</asp:Content>

