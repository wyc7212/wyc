<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Web.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CSS测试</title>
    <link type="text/css" rel="Stylesheet" href="./Styles/StyleTest.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="header">
        <asp:Panel ID="Panel1" runat="server" BackColor="#9900FF">
            Panel1</asp:Panel>
    </div>
    <div id="navr">
        <asp:Panel ID="Panel2" runat="server" BackColor="#00FF99">
            Panel2</asp:Panel>
    </div>
    <div id="main">
        <asp:Panel ID="Panel3" runat="server" BackColor="#999966">
            Panel3</asp:Panel>
    </div>
    <div id="footer">
        <asp:Panel ID="Panel4" runat="server" BackColor="#993333">
            Panel4</asp:Panel>
    </div>
    </form>
</body>
</html>
