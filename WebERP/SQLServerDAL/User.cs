using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using IDAL;
using DBUtility;

namespace SQLServerDAL
{
    public class User : IUser
    {

        IList<Model.UserInfo> IUser.GetAllUser()
        {
            IList<Model.UserInfo> list = new List<Model.UserInfo>();

            string strSQL = "  SELECT AA.ID,LoginName,UserNaem,PassWord,JiaoSeID,JiaoSeName,IsEnable,Remark " +
                            "    FROM Users AA INNER JOIN JiaoSe BB ON AA.JiaoSeID = BB.ID";
            SqlDataReader dr = DBHelpSQLServer.GetDataReader(strSQL);
            while (dr.Read())
            {
                Model.UserInfo user = new Model.UserInfo();
                user.ID = dr.GetInt32(0);
                user.LoginName = dr.GetString(1);
                user.UserName = dr.GetString(2);
                user.PassWord = dr.GetString(3);
                user.JiaoSeID = dr.GetInt32(4);
                user.JiaoSeName = dr.GetString(5);
                user.IsEnable = dr.GetBoolean(6);
                user.Remark = dr.GetString(7);

                list.Add(user);
            }

            return list;
        }

        IList<Model.UserInfo> IUser.SelectUser(string LoginName)
        {
            IList<Model.UserInfo> list = new List<Model.UserInfo>();

            string strSQL = " SELECT ID,LoginName,UserName,PassWord,JiaoSeID,IsEnable,Remark FROM Users WHERE LoginName = @LoginName ";
            SqlParameter[] cmdParms = new SqlParameter[]{
                new SqlParameter("@LoginName",SqlDbType.VarChar,100)               
            };
            cmdParms[0].Value = LoginName;
            DataTable datatable = DBHelpSQLServer.GetDataTable(strSQL,cmdParms);
            foreach (DataRow row in datatable.Rows)
            {
                Model.UserInfo user = new Model.UserInfo();
                user.ID = (Int32)row["ID"];
                user.LoginName = (string)row["LoginName"];
                user.UserName = (string)row["UserName"];
                user.IsEnable = (bool)row["IsEnable"];
                user.JiaoSeID = (Int32)row["JiaoSeID"];
                user.PassWord = (string)row["PassWord"];
                user.Remark = (string)row["Remark"];
                list.Add(user);
            }
         
            return list;
        }

        int IUser.Add(Model.UserInfo user)
        {
            int _result = -1;

            return _result;
        }

        int IUser.Delete(Model.UserInfo user)
        {
            int _result = -1;

            return _result;
        }

        int IUser.Update(Model.UserInfo user)
        {
            int _result = -1;

            return _result;
        }
    }
}
