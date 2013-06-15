using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web
{
    public partial class LoginIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            // 如果用户登录成功，登记回话状态，跳转到主页
            BLL.User user = new BLL.User();
            BLL.JiaoSe jiaose = new BLL.JiaoSe();

            if (user.IsExist(TxtUserName.Text.Trim()))
            {
                if (user.IsPassed(TxtUserName.Text.Trim(),TxtUserPwd.Text.Trim()))
                {
                    Model.UserInfo userinfo = user.GetUser(TxtUserName.Text.Trim());
                    Model.JiaoSeInfo jiaoseinfo = jiaose.SelectJiaoSe(userinfo.JiaoSeID);
                    System.Web.HttpContext.Current.Session["UserID"] = userinfo.ID;
                    System.Web.HttpContext.Current.Session["LoginName"] = userinfo.LoginName;
                    System.Web.HttpContext.Current.Session["UserName"] = userinfo.UserName;
                    System.Web.HttpContext.Current.Session["JiaoSeName"] = jiaoseinfo.JiaoSeName;
                    System.Web.HttpContext.Current.Session["QuanXian"] = jiaoseinfo.QuanXian;

                    // 跳转主页
                    System.Web.HttpContext.Current.Response.Redirect("Main.aspx");
                }
            }
            else
            {
                System.Web.HttpContext.Current.Response.Write("<script language='javascript'>alter('用户不存在，请确认！');</script>");
            }
            // 如果用户不存在，提示“用户不存在”

            // 如果密码不正确，提示“密码错误”
            
        }
    }
}