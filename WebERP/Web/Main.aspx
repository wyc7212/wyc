<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="Web.Main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
    <head runat="server">
    	    <title>信息管理系统</title>
            <link href="./Styles/Style.css" type="text/css" rel="Stylesheet" />
		    <script type="text/javascript" language="javascript">
		        function visible_click() {
		            if (td1.className == "") {
		                td1.className = "tddisp";
		                main.middle_picture.src = "../images/Jt_right.gif";
		            }
		            else if (td1.className == "tddisp") {
		                td1.className = "";
		                main.middle_picture.src = "../images/Jt_left.gif";
		            }
		        }                    
		    </script>
            <script type="text/javascript" language="javascript">
                function nowtime() {
                    todaytime = new Date();
                    t1.innerText = todaytime.getHours() + '：' + todaytime.getMinutes() + '：' + todaytime.getSeconds()
                }
            </script>
            <script type="text/javascript" language=javascript>
                today = new Date();
                function initArray() {
                    this.length = initArray.arguments.length
                    for (var i = 0; i < this.length; i++)
                        this[i + 1] = initArray.arguments[i]
                }
                var d = new initArray("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
                document.write("", today.getYear(), "年", today.getMonth() + 1, "月", today.getDate(), "日   ", d[today.getDay() + 1], ""); 
            </script>
    </head>
    <body scroll="no" onload="setInterval(nowtime,1000)">
        <form id="main" method="post" runat="server">
		    <table style="width:100%; height:100%; border:0;">
			    <tr>
					<td height="50" background="./images/TitleBg.gif" width="52%"></td>
					<td height="50" background="./images/TitleBg.gif" width="48%" align="right">
                        <iframe name="NowTime" frameBorder="0" marginHeight="0" marginWidth="0" width="0" height="0" src=""></iframe> &nbsp;<img align="absMiddle" src="./images/time.gif" />
                        <span id="t1"><script type="text/javascript" language="javascript"> todaytime1 = new Date();t1.innerText = todaytime1.getHours() + '：' + todaytime1.getMinutes() + '：' + todaytime1.getSeconds();</script></span>
                        &nbsp;&nbsp;		
                                                                                                				
                    </td>
				</tr>

				<tr>
				    <td colspan="2">
					    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" >
						    <tr>
							    <td width="185" height="100%" valign="top" class="" id="td1">																		
								    <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" >									
									    <tr bgcolor="#EBE9ED">
									
									        <td width="185" background="./images/BackWhite.gif" style="height: 27px">
                                                &nbsp;&nbsp;<img align="absMiddle" height="18" src="./images/node_user.gif" width="18" />&nbsp;<strong><span
                                                    style="color: #ffffff"><%= CommonFun.PublicMethod.GetSessionValue("UserName")%></span></strong>
                                                &nbsp;&nbsp;<img align="absMiddle" height="18" src="./images/U01.gif" width="18" />&nbsp;<strong><span
                                                        style="color: #ffffff">联机</span></strong>
                                            </td>
                                    
                                    
                                        </tr>									
									    <tr>
                                            <td width="185" bgcolor="#D4E4F1" height="100%" style=" padding-bottom:5px;">									
									            <table width="185" height="100%"  border="0" cellpadding="0" cellspacing="0">
	        <tr>
		        <td height="28" background="./images/Tree_01.jpg">&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: #ffffff">导航&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
	        </tr>	
	        <tr>
		        <td background="./images/Tree_03.jpg" style=" padding-bottom:3px; padding-top:5px; padding-left:10px;padding-right:10px;"><div style="OVERFLOW:auto;HEIGHT:100%;">
		        <asp:TreeView id="ListTreeView" runat="server" ExpandDepth="0" ShowLines="True" ForeColor="Black">
                                                    <ParentNodeStyle HorizontalPadding="2px" />
                                                    <RootNodeStyle HorizontalPadding="2px" />
                                                    <LeafNodeStyle HorizontalPadding="2px" />
                                                    <Nodes>                                                
                                                          <asp:TreeNode ImageUrl="~/images/TreeImages/mytable.gif" Text="我的办公桌" Value="我的办公桌" SelectAction="Expand"> 
                                                                <asp:TreeNode ImageUrl="~/images/TreeImages/email.gif" Text="内部邮件" Value="内部邮件" SelectAction="Expand">                                                      
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/inbox.gif" Text="收件箱" Value="001" NavigateUrl="../LanEmail/LanEmailShou.aspx" Target="rform"></asp:TreeNode>
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/outbox.gif" Text="草稿箱" Value="002" NavigateUrl="../LanEmail/LanEmailCao.aspx" Target="rform"></asp:TreeNode>
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/sentbox.gif" Text="已发送" Value="003" NavigateUrl="../LanEmail/LanEmailYiFa.aspx" Target="rform"></asp:TreeNode>  
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/trash.gif" Text="已删除" Value="004" NavigateUrl="../LanEmail/LanEmailYiDel.aspx" Target="rform"></asp:TreeNode>                                                                                                                    
                                                                </asp:TreeNode>   
                                                        
                                                        
                                                                <asp:TreeNode ImageUrl="~/images/TreeImages/diary.gif" Text="工作日志" Value="014" NavigateUrl="../Work/WorkRiZhi.aspx" Target="rform"></asp:TreeNode>
                                                                <asp:TreeNode ImageUrl="~/images/TreeImages/person_info.gif" Text="个人设置" 
                                                                    Value="个人设置" SelectAction="Expand">
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/U01.gif" Text="系统提醒" Value="021" 
                                                                        NavigateUrl="../Personal/SystemTiXing.aspx" Target="rform"></asp:TreeNode>
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/U01.gif" Text="修改密码" Value="022" 
                                                                        NavigateUrl="../Personal/ChangPwd.aspx" Target="rform"></asp:TreeNode>
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/U01.gif" Text="邮件设置" Value="023" 
                                                                        NavigateUrl="../Personal/MailSetting.aspx" Target="rform"></asp:TreeNode>
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/U01.gif" 
                                                                        NavigateUrl="../Personal/MyPer.aspx" Target="rform" Text="我的权限" Value="026">
                                                                    </asp:TreeNode>
                                                                </asp:TreeNode>     
                                                        
                                                          </asp:TreeNode>    
                                                            
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/workflow.gif" Text="工作流程" Value="工作流程" SelectAction="Expand">  
                                                                        <asp:TreeNode ImageUrl="~/images/TreeImages/workflow.gif" Text="工作管理" Value="工作管理" SelectAction="Expand">  
                                                                            <asp:TreeNode ImageUrl="~/images/TreeImages/workflow.gif" Text="我的工作" Value="074" NavigateUrl="../WorkFlow/MyWorkFlow.aspx" Target="rform"></asp:TreeNode>
                                                                            <asp:TreeNode ImageUrl="~/images/TreeImages/workflow.gif" Text="待办工作" Value="075" NavigateUrl="../WorkFlow/NowWorkFlow.aspx" Target="rform"></asp:TreeNode>
                                                                        </asp:TreeNode>  
                                                                        <asp:TreeNode ImageUrl="~/images/TreeImages/system.gif" Text="表单定义" Value="表单定义" SelectAction="Expand">                                                         
                                                                            <asp:TreeNode ImageUrl="~/images/TreeImages/system.gif" Text="表单设计" Value="079" NavigateUrl="../WorkFlow/DesignForm.aspx" Target="rform"></asp:TreeNode>
                                                                            <asp:TreeNode ImageUrl="~/images/TreeImages/system.gif" Text="表单类别" Value="080" NavigateUrl="../WorkFlow/FormType.aspx" Target="rform"></asp:TreeNode>                                                                                                                       
                                                                        </asp:TreeNode> 
                                                                        <asp:TreeNode ImageUrl="~/images/TreeImages/erp.gif" Text="工作流程" Value="081" NavigateUrl="../WorkFlow/WorkFlowManage.aspx" Target="rform"></asp:TreeNode>
                                                                    </asp:TreeNode>  
                                                                                                                                                                                  
                                                                        <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="人力资源管理" Value="人力资源管理" SelectAction="Expand">                                                         
                                                                            <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="员工管理" Value="A004"  NavigateUrl="../HRNew/Employe.aspx" Target="rform"></asp:TreeNode>                                                                                                                                        
                                                                        <asp:TreeNode ImageUrl="~/images/TreeImages/pro.gif" Text="人员考核" Value="人员考核" SelectAction="Expand">
                                                                            <asp:TreeNode ImageUrl="~/images/TreeImages/pro.gif" Text="考核项目" Value="A005" NavigateUrl="../HRNew/KaoHeXM.aspx" Target="rform"></asp:TreeNode>
                                                                            <asp:TreeNode ImageUrl="~/images/TreeImages/pro.gif" Text="考核任务" Value="A006" NavigateUrl="../HRNew/KaoHeRW.aspx" Target="rform"></asp:TreeNode>
                                                                            <asp:TreeNode ImageUrl="~/images/TreeImages/pro.gif" Text="考核管理" Value="A007" NavigateUrl="../HRNew/KaoHe.aspx" Target="rform"></asp:TreeNode>
                                                                        </asp:TreeNode> 
                                                                
                                                                        <asp:TreeNode ImageUrl="~/images/TreeImages/score.gif" Text="考勤数据下载" Value="A008" NavigateUrl="../HRNew/JiangCheng.aspx" Target="rform"></asp:TreeNode>                                                                                                                                                                                                        
                                                                    
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/attendance.gif" Text="个人考勤" Value="个人考勤" SelectAction="Expand">                                                      
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/attendance.gif" Text="补卡登记" Value="029" 
                                                                            NavigateUrl="../HR/ShangXiaBanDengJi.aspx" Target="rform"></asp:TreeNode>
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/attendance.gif" Text="出差登记" Value="031" 
                                                                            NavigateUrl="../HR/DengJiChuChai.aspx" Target="rform"></asp:TreeNode>
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/attendance.gif" Text="加班登记" Value="032" 
                                                                            NavigateUrl="../HR/DengJiJiaBan.aspx" Target="rform"></asp:TreeNode>
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/attendance.gif" Text="请假登记" Value="033" 
                                                                            NavigateUrl="../HR/DengJiQingJia.aspx" Target="rform"></asp:TreeNode>
                                                               </asp:TreeNode>
                                                                            <asp:TreeNode ImageUrl="~/images/TreeImages/person_info.gif" Text="考勤设置" Value="040" NavigateUrl="../HR/KaoQinSetting.aspx" Target="rform"></asp:TreeNode>
                                                                            <asp:TreeNode ImageUrl="~/images/TreeImages/attendance.gif" Text="原始考勤数据" 
                                                                                Value="041" NavigateUrl="../HR/KaoQinMingXi.aspx" Target="rform"></asp:TreeNode>
                                                                            <asp:TreeNode ImageUrl="~/images/TreeImages/finance.gif" Text="考勤查询统计" Value="042" NavigateUrl="../HR/KaoQingChaXunTongJi.aspx" Target="rform"></asp:TreeNode>
                                                                
                                                            </asp:TreeNode>
                                                                
                                                                        <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="销售管理" Value="客户管理CRM" SelectAction="Expand">                                                                
                                                                        <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="客户管理" Value="我的客户" SelectAction="Expand">                                                         
                                                                            <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="客户清单" Value="C001" NavigateUrl="../CRM/MyCustom.aspx" Target="rform"></asp:TreeNode>
                                                                        </asp:TreeNode> 
                                                                            <asp:TreeNode SelectAction="Expand" Text="房产信息" Value="房产信息">
                                                                                <asp:TreeNode Text="楼盘资料" Value="M002" NavigateUrl="~/CRM/LouPan.aspx" 
                                                                                    Target="rform"></asp:TreeNode>
                                                                                <asp:TreeNode Text="楼栋资料" Value="M003" NavigateUrl="~/CRM/LouDong.aspx" 
                                                                                    Target="rform"></asp:TreeNode>
                                                                                <asp:TreeNode Text="房间资料" Value="M004" NavigateUrl="~/CRM/FangJian.aspx" 
                                                                                    Target="rform"></asp:TreeNode>
                                                                            </asp:TreeNode>
                                                                            <asp:TreeNode Text="基础数据" Value="M001" NavigateUrl="~/CRM/BasicData.aspx" 
                                                                                Target="rform"></asp:TreeNode>
                                                                        </asp:TreeNode>                                                              
                                                                
                                                                        <asp:TreeNode ImageUrl="~/images/TreeImages/sale_manage.gif" Text="采购管理" Value="供应商管理" SelectAction="Expand">                                                         
                                                                            <asp:TreeNode ImageUrl="~/images/TreeImages/sale_manage.gif" Text="供应商管理" Value="A013" NavigateUrl="../Supply/Supply.aspx" Target="rform"></asp:TreeNode>
                                                                            <asp:TreeNode ImageUrl="~/images/TreeImages/sale_manage.gif" Text="供应商联系人" Value="A014" NavigateUrl="../Supply/SupplysLink.aspx?GongYingShang=" Target="rform"></asp:TreeNode>
                                                                            <asp:TreeNode ImageUrl="~/images/TreeImages/sale_manage.gif" Text="采购物品" Value="A018" NavigateUrl="../Supply/Material.aspx" Target="rform"></asp:TreeNode>
                                                                            <asp:TreeNode ImageUrl="~/images/TreeImages/sale_manage.gif" Text="物品价格" Value="A019" NavigateUrl="../Supply/MaterialPrice.aspx?GongYingShang=" Target="rform"></asp:TreeNode> 
                                                                            <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="申购单登记" Value="A015" NavigateUrl="../Supply/BuyDengJi.aspx" Target="rform"></asp:TreeNode>       
                                                                            <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="申购单管理" Value="A016" NavigateUrl="../Supply/BuyOrder.aspx" Target="rform"></asp:TreeNode>      
                                                                            <asp:TreeNode ImageUrl="~/images/TreeImages/hrms.gif" Text="采购报表" Value="A017" NavigateUrl="../TEST.aspx" Target="rform"></asp:TreeNode>                                                                   
                                                                        </asp:TreeNode> 
                                                                                                                               
                                                                   <asp:TreeNode ImageUrl="~/images/TreeImages/office_Product.gif" Text="办公用品管理" Value="办公用品管理" SelectAction="Expand">  
                                                                        <asp:TreeNode ImageUrl="~/images/TreeImages/diary.gif" Text="办公用品领用" 
                                                                            Value="A018" NavigateUrl="../Office/OfficeShengQing.aspx" Target="rform"></asp:TreeNode>                                                          
                                                                        <asp:TreeNode ImageUrl="~/images/TreeImages/office_Product.gif" Text="办公用品库存" 
                                                                            Value="A019" NavigateUrl="../Office/Officething.aspx" Target="rform"></asp:TreeNode>                                                                                                   
                                                                   </asp:TreeNode>  
                                                                                                                     
                                                                   <asp:TreeNode ImageUrl="~/images/TreeImages/@asset.gif" Text="资产管理" Value="固定资产管理" SelectAction="Expand">                                                         
                                                                        <asp:TreeNode ImageUrl="~/images/TreeImages/@asset.gif" Text="资产清单" Value="A020" NavigateUrl="../Office/GuDing.aspx" Target="rform"></asp:TreeNode>
                                                                        <asp:TreeNode ImageUrl="~/images/TreeImages/@asset.gif" Text="资产异动" Value="A021" NavigateUrl="../Office/GuDingJiLu.aspx" Target="rform"></asp:TreeNode>                                                                                                         
                                                                   </asp:TreeNode>                                                                                                                     

                                                                <asp:TreeNode SelectAction="Expand" Text="餐厅管理" Value="餐厅管理" 
                                                              ImageUrl="~/images/TreeImages/@office_Product.gif">
                                                                    <asp:TreeNode Target="rform" Text="发卡记录" Value="A071" 
                                                                        ImageUrl="~/images/TreeImages/bbs2.gif" NavigateUrl="~/CanTing/FaKa.aspx"></asp:TreeNode>
                                                                    <asp:TreeNode Target="rform" Text="充值记录" Value="A072" 
                                                                        ImageUrl="~/images/TreeImages/@manage.gif"></asp:TreeNode>
                                                                    <asp:TreeNode Target="rform" Text="消费记录" Value="A073" 
                                                                        ImageUrl="~/images/TreeImages/@unit.gif"></asp:TreeNode>
                                                          </asp:TreeNode>

                                                                <asp:TreeNode ImageUrl="~/images/TreeImages/@hrms.gif" Text="组织机构信息" Value="组织机构信息" SelectAction="Expand">                                                         
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/@hrms.gif" Text="单位信息查询" Value="043" NavigateUrl="../SystemManage/DanWeiInfo.aspx?Type=serch" Target="rform"></asp:TreeNode>
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/@hrms.gif" Text="部门信息查询" Value="044" NavigateUrl="../SystemManage/BuMenInfo.aspx?Type=serch&amp;DirID=0" Target="rform"></asp:TreeNode>                                                                                                                         
                                                                    <asp:TreeNode ImageUrl="~/images/TreeImages/@hrms.gif" Text="用户信息查询" Value="045" NavigateUrl="../SystemManage/SystemUser.aspx?Type=serch" Target="rform"></asp:TreeNode>
                                                                </asp:TreeNode>                                                         
                                                    
                                                            <asp:TreeNode ImageUrl="~/images/TreeImages/vote.gif" Text="附件程序" Value="附件程序" SelectAction="Expand">                                                             
                                                                        <asp:TreeNode ImageUrl="~/images/TreeImages/system.gif" Text="列车时刻查询" Value="061" NavigateUrl="http://qq.ip138.com/train/" Target="rform"></asp:TreeNode>
                                                                        <asp:TreeNode ImageUrl="~/images/TreeImages/system.gif" Text="法律法规查询" Value="063" NavigateUrl="http://law.law-star.com/html/lawsearch.htm" Target="rform"></asp:TreeNode> 
                                                                        <asp:TreeNode ImageUrl="~/images/TreeImages/calendar2.gif" Text="万年历" Value="065" NavigateUrl="http://site.baidu.com/list/wannianli.htm" Target="rform"></asp:TreeNode>
                                                                        <asp:TreeNode ImageUrl="~/images/TreeImages/fldb.gif" Text="世界时钟" Value="066" NavigateUrl="http://www.hao123.com/haoserver/wotime.htm" Target="rform"></asp:TreeNode>
                                                            </asp:TreeNode>
                                                            <asp:TreeNode ImageUrl="~/images/TreeImages/@score.gif" Text="系统管理" Value="系统管理" SelectAction="Expand">                                                             
                                                                        <asp:TreeNode ImageUrl="~/images/TreeImages/@netmeeting.gif" Text="单位信息管理" Value="068" NavigateUrl="../SystemManage/DanWeiInfo.aspx" Target="rform"></asp:TreeNode>
                                                                        <asp:TreeNode ImageUrl="~/images/TreeImages/@netmeeting.gif" Text="部门信息管理" Value="069" NavigateUrl="../SystemManage/BuMenInfo.aspx?Type=&amp;DirID=0" Target="rform"></asp:TreeNode> 
                                                                        <asp:TreeNode ImageUrl="~/images/TreeImages/@netmeeting.gif" Text="用户信息管理" Value="070" NavigateUrl="../SystemManage/SystemUser.aspx" Target="rform"></asp:TreeNode>
                                                                        <asp:TreeNode ImageUrl="~/images/TreeImages/@netmeeting.gif" Text="角色信息管理" Value="071" NavigateUrl="../SystemManage/SystemJiaoSe.aspx" Target="rform"></asp:TreeNode>
                                                                        <asp:TreeNode ImageUrl="~/images/TreeImages/score.gif" Text="系统日志管理" Value="072" NavigateUrl="../SystemManage/SystemLog.aspx" Target="rform"></asp:TreeNode>
                                                                        <asp:TreeNode ImageUrl="~/images/TreeImages/test.gif" Text="系统参数设置" Value="073" NavigateUrl="../SystemManage/SystemSetting.aspx" Target="rform"></asp:TreeNode>
                                                            </asp:TreeNode>
                                                    </Nodes>
                                                </asp:TreeView>
		                        </div></td>
	                    </tr>
	                    <tr>
		                     <td height="25" background="./images/Tree_04.jpg">&nbsp;			</td>
	                    </tr>
                        </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
								<td width="0%">
								    <table width="0%" border="0" cellpadding="0" cellspacing="0" height="100%"><tr><td background="./images/BackWhite.gif" height="27px"></td></tr><tr><td bgcolor="#D4E4F1"><img onclick="visible_click()" style="cursor:hand;" src="./images/Jt_left.gif" id="middle_picture"></td></tr></table>																
								</td>
								<td width="100%" height="100%">																
								    <table border="0" width="100%" cellspacing="0" cellpadding="0" height="100%">
									    <tr>
										    <td>											
											    <table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
                                                    <tr>
                                                        <td height="27" background="./images/BackWhite.gif" >
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td>

                                                                    </td>
                                                                    <td align="right">
                                                                    <a class="bai" href="MyDesk.aspx" target="rform">
                                                                    <img align="absMiddle" alt="我的办公桌" border="0" height="16" src="./images/TreeImages/mytable.gif"
                                                                         width="16" />&nbsp;桌面</a>&nbsp;
                                                                    <a class="bai"  href="../Personal/SystemTiXing.aspx" target="rform">
                                                                    <img align="absMiddle" alt="更改界面主题风格" border="0" height="16" src="./images/TreeImages/theme.gif"
                                                                        width="16" />&nbsp;提醒</a>&nbsp;
                                                                    <a class="bai"  href="./Default.aspx">
                                                                    <img align="absMiddle" alt="注销用户" border="0" src="./images/login.gif" />&nbsp;注销</a>&nbsp;&nbsp;&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>                
                                                    </tr>
                                                    <tr>
                                                        <td valign="top" width="100%" height="100%" style="padding-bottom:5px; padding-top:5px; padding-left:5px;">
                                                        <IFRAME name="rform" frameBorder="0" marginHeight="0" marginWidth="0" width="100%" height="100%"
													                                        BORDERCOLOR="#ffffFF"  src="MyDesk.aspx" border="0"></IFRAME>
                                                        </td>                
                                                    </tr>            
                                                </table>											
										    </td>
										</tr>
									</table>																																								
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>
				    <td height="20" colspan="2" background="./images/BottomBg.gif" valign="middle" >
                        <table border="0" cellpadding="0" cellspacing="0" class="small" width="100%">
                            <tr>
                                <td valign="middle">
                                    &nbsp;&nbsp;<IFRAME name="bform" frameBorder="0" marginHeight="0" marginWidth="0" width="150px" height="20px"
												    src="Blank.aspx" border="0"></IFRAME>
													
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp;
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="Red" Text=""
                                        Visible="True"></asp:Label></td>
                            </tr>
                        </table>
                    </td>
                </tr>
			</table>
		</form>
    </body>
</html>
