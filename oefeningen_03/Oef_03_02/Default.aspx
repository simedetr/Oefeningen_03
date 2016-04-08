<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Oefeningen 03</title>
    <link href="styles/main.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="header_wrapper">
            <header>
                <h1>Oef 3.2</h1>
            </header>
        </div>
        <div id="content_wrapper">
            <div id="content">
                <h2>Werken met data-transfers</h2>
                <div class="button_field">
                    <asp:Button ID="btnCopyPrinters" runat="server" Text="Tabel printers kopiëren" CssClass="button" OnClick="btnCopyPrinters_Click" />
                    <asp:Button ID="btnDelPrinters" runat="server" Text="Tabel printers verwijderen" CssClass="button" OnClick="btnDelPrinters_Click" />
                </div>
                <div class="button_field">
                    <asp:Button ID="btnCopyLokaal" runat="server" Text="Tabel lokalen kopiëren" CssClass="button" OnClick="btnCopyLokaal_Click" />
                    <asp:Button ID="btnDelLokaal" runat="server" Text="Tabel lokalen verwijderen" CssClass="button" OnClick="btnDelLokaal_Click" />
                </div>
                <div class="button_field">
                    <asp:Label ID="lblMessage" runat="server" Text="" CssClass="validation_message"></asp:Label>
                    <asp:Label ID="lblError" runat="server" Text="" CssClass="validation_summary"></asp:Label>
                </div>
            </div>
        </div>
        <footer>
            <p>
                &copy; Copyright 2016 - University College Arteveldehogeschool, Graphic and Digital Media, Credits to Simen De Troch
            </p>
        </footer>
    </form>
</body>
</html>
