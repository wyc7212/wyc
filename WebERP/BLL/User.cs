using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public class User
    {
        private static readonly IDAL.IUser dal = DALFactory.DataAccess.CreateUser();

        public IList<Model.UserInfo> GetAllUser()
        {
            IList<Model.UserInfo> list;
            list = dal.GetAllUser();
            return list;
        }

        // 根据一个登录名返回一个UserInfo
        public Model.UserInfo GetUser(string LoginName)
        {
            Model.UserInfo user = dal.SelectUser(LoginName)[0];

            return user;
        }

        // 根据登录用户名判断用户是否存在
        public bool IsExist(string LoginName)
        {
            bool _result = false;

            IList<Model.UserInfo> list = dal.SelectUser(LoginName);
            if (list.Count > 0)
                _result = true;
            return _result;
        }

        // 根据输入的用户名和密码验证用户登录
        public bool IsPassed(string LoginName,string PassWord)
        {
            bool _result = false;

            if (LoginName == "") return false;

            IList<Model.UserInfo> list = dal.SelectUser(LoginName);
            if (list.Count > 0)
            {
                Model.UserInfo user = list[0];

                if (user.PassWord == CommonFun.DEncrypt.DESEncrypt.Encrypt(PassWord))
                {
                    if (user.IsEnable != false)
                    {
                        _result = true;
                    }                    
                }
            }            

            return _result;
        }
    }
}
