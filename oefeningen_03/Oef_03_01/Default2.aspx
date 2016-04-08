<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <fieldset>
        <legend>Overzicht</legend>
        <p>
            <asp:Label ID="lblPersoon" runat="server" Text="" CssClass="label_info"></asp:Label>
        </p>
        <p>
            <asp:BulletedList ID="bliInfo" runat="server" CssClass="label_info"></asp:BulletedList>
        </p>
    </fieldset>
    <div class="button_field">
        <asp:Button ID="btnTerug" runat="server" Text="<< Terug" CssClass="button" OnClick="btnTerug_Click"/>
        <asp:Button ID="btnVerder" runat="server" Text="Verder >>" CssClass="button" OnClick="btnVerder_Click"/>
    </div>
</asp:Content>

