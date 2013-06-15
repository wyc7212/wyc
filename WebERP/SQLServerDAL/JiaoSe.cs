using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using DBUtility;

namespace SQLServerDAL
{
    public class JiaoSe : IDAL.IJiaoSe
    {

        public IList<Model.JiaoSeInfo> GetAllJiaoSe()
        {
            IList<Model.JiaoSeInfo> list = new List<Model.JiaoSeInfo>();

            string strSQL = "SELECT ID,JiaoSeName,Remark,QuanXian FROM JiaoSe ";
            SqlDataReader dr = DBHelpSQLServer.GetDataReader(strSQL);
            while (dr.Read())
            {
                Model.JiaoSeInfo jiaose = new Model.JiaoSeInfo();
                jiaose.ID = dr.GetInt32(0);
                jiaose.JiaoSeName = dr.GetString(1);
                jiaose.Remark = dr.GetString(2);
                jiaose.QuanXian = dr.GetString(3);
                list.Add(jiaose);
            }

            return list;
        }

        public IList<Model.JiaoSeInfo> SelectJiaoSe(int JiaoSeID)
        {
            IList<Model.JiaoSeInfo> list = new List<Model.JiaoSeInfo>();

            string strSQL = " SELECT ID,JiaoSeName,Remark,QuanXian FROM JiaoSe WHERE ID = @ID ";
            SqlParameter[] cmdParms = new SqlParameter[]{
                new SqlParameter("@ID",SqlDbType.Int,4)
            };
            cmdParms[0].Value = JiaoSeID;
            DataTable datatable = DBHelpSQLServer.GetDataTable(strSQL, cmdParms);
            foreach (DataRow row in datatable.Rows)
            {
                Model.JiaoSeInfo jiaose = new Model.JiaoSeInfo();
                jiaose.ID = (Int32)row["ID"];
                jiaose.JiaoSeName = (string)row["JiaoSeName"];
                jiaose.Remark = (string)row["Remark"];
                jiaose.QuanXian = (string)row["QuanXian"];
                list.Add(jiaose);
            }

            return list;
        }

        public int Add(Model.JiaoSeInfo jiaose)
        {
            return -1;
        }

        public int Delete(Model.JiaoSeInfo jiaose)
        {
            return -1;
        }

        public int Update(Model.JiaoSeInfo jiaose)
        {
            return -1;
        }
    }
}
