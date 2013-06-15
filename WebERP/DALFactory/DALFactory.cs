using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Reflection;

namespace DALFactory
{
    public sealed class DataAccess
    {
        // 查找我们将要使用的数据访问层
        private static readonly string path = ConfigurationManager.AppSettings["WebDAL"];       
        
        private DataAccess() { }

        //实现 CreateUser 方法，用于创建User类实例
        public static IDAL.IUser CreateUser() {
            string className = path + ".User";            
            return (IDAL.IUser)Assembly.Load(path).CreateInstance(className);
        }

        public static IDAL.IJiaoSe CreateJiaoSe()
        {
            string className = path + ".JiaoSe";            
            return (IDAL.IJiaoSe)Assembly.Load(path).CreateInstance(className);
        }
    }
}
