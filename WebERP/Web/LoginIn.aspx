<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginIn.aspx.cs" Inherits="Web.LoginIn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>信息管理系统 请登录</title>
        <link href="Styles/Style.css" type="text/css" rel="STYLESHEET"/>
        <style type="text/css">
            .style1
            {
                width: 229px;
                height: 24px;
            }
            .style2
            {
                height: 24px;
            }
        </style>
    </head>
    <body onload="javascript:form2.TxtUserName.focus();" background="images/back.gif">    
        <div>
        <form id="form2" runat="server">
            <div align=center>       
                <br />
                <br />
                <br />
                <br />
                <br />
                <table cellSpacing=0 cellPadding=0 align=center >  
                    <tr>
                        <td align="center" height=408 width=591>  
                            <table width="100%">
                                <tr>
                                    <td style="text-align: right; " class="style1">
                                        <strong>账户：</strong>
                                    </td>
                                    <td class="style2" align="left">
                                        <asp:TextBox ID="TxtUserName"  runat="server" Height="20px" Width="130px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right; width: 229px;">
                                        <strong>密码：</strong>
                                    </td>
                                    <td align="left">
                                        <asp:TextBox ID="TxtUserPwd" runat="server" Height="20px" TextMode="Password" Width="130px" ></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 229px">
                                    </td>
                                    <td align="left">
                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageAlign="AbsMiddle"
                                            ImageUrl="~/images/btn.png" OnClick="ImageButton1_Click" />
                                    </td>
                                </tr>
                            </table>    
                        </td>
                    </tr>
                </table>  
           </div>
        </form>
        </div>
        </form>
    </body>
</html>
