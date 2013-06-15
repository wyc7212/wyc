using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;

namespace DBUtility
{
    public class DBHelpSQLServer
    {
        //定义连接字符串。
        public static string ConnectionString = ConfigurationManager.AppSettings["SQLConnectionString"];
        protected static SqlConnection Connection;
        //定义数据库的打开和关闭方法
        protected static void Open()
        {
            if (Connection == null)
            {
                Connection = new SqlConnection(ConnectionString);
            }
            if (Connection.State.Equals(ConnectionState.Closed))
            {
                Connection.Open();
            }
        }
        protected static void Close()
        {
            if (Connection != null)
            {
                Connection.Close();
            }
        }

        private static void PrepareCommand(SqlCommand cmd, SqlConnection conn, SqlTransaction trans, string cmdText, SqlParameter[] cmdParms)
        {
            if (conn.State != ConnectionState.Open)
                conn.Open();
            cmd.Connection = conn;
            cmd.CommandText = cmdText;
            if (trans != null)
                cmd.Transaction = trans;
            cmd.CommandType = CommandType.Text;//cmdType;
            if (cmdParms != null)
            {
                foreach (SqlParameter parameter in cmdParms)
                {
                    if ((parameter.Direction == ParameterDirection.InputOutput || parameter.Direction == ParameterDirection.Input) &&
                        (parameter.Value == null))
                    {
                        parameter.Value = DBNull.Value;
                    }
                    cmd.Parameters.Add(parameter);
                }
            }
        }

        #region 获取一个DataTable
        // 获取数据，返回一个DataTable。    
        public static DataTable GetDataTable(string SQLString)
        {
            DataSet dataset = GetDataSet(SQLString);
            return dataset.Tables[0];
        }
        public static DataTable GetDataTable(string SQLString, SqlParameter[] cmdParms)
        {
            DataSet dataset = GetDataSet(SQLString,cmdParms);
            return dataset.Tables[0];
        }
        #endregion

        #region 获取一个DataRow
        // 获取数据，返回一个DataRow。
        public static DataRow GetDataRow(string SQLString)
        {
            DataSet dataset = GetDataSet(SQLString);
            if (dataset.Tables[0].Rows.Count > 0)
            {
                return dataset.Tables[0].Rows[0];
            }
            else
            {
                return null;
            }
        }
        public static DataRow GetDataRow(string SQLString, SqlParameter[] cmdParms)
        {
            DataSet dataset = GetDataSet(SQLString,cmdParms);
            if (dataset.Tables[0].Rows.Count > 0)
            {
                return dataset.Tables[0].Rows[0];
            }
            else
            {
                return null;
            }
        }
        #endregion     

        #region 返回SqlDataReader
        //返回SqlDataReader数据集,使用完后记得关闭SqlDataReader
        public static SqlDataReader GetDataReader(string SQLString)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConnectionString);
                SqlCommand cmd = new SqlCommand(SQLString, Connection);
                return cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
            }
            catch (System.Data.SqlClient.SqlException e)
            {
                throw e;
            }
        }
        public static SqlDataReader GetDataReader(string SQLString,SqlParameter[] cmdParms)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConnectionString);                
                SqlCommand cmd = new SqlCommand(SQLString, Connection);
                PrepareCommand(cmd, conn, null, SQLString, cmdParms);
                return cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
            }
            catch (System.Data.SqlClient.SqlException e)
            {
                throw e;
            }
        }
        #endregion

        #region 使用事务的方式执行一组SQL语句
        // 公有方法，执行一组Sql语句。返回是否成功,采用事务管理，发现异常时回滚数据
        public static bool ExecuteSQL(string[] SqlStrings)
        {
            bool success = true;
            Open();
            SqlCommand cmd = new SqlCommand();
            SqlTransaction trans = Connection.BeginTransaction();
            cmd.Connection = Connection;
            cmd.Transaction = trans;
            try
            {
                foreach (string str in SqlStrings)
                {
                    cmd.CommandText = str;
                    cmd.ExecuteNonQuery();
                }
                trans.Commit();
            }
            catch
            {
                success = false;
                trans.Rollback();
            }
            finally
            {
                Close();
            }
            return success;
        }
        #endregion

        #region 执行SQL语句，返回一个单值
        public static object GetSingle(string SQLString)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(SQLString, connection))
                {
                    try
                    {
                        connection.Open();
                        object obj = cmd.ExecuteScalar();
                        if ((Object.Equals(obj, null)) || (Object.Equals(obj, System.DBNull.Value)))
                        {
                            return null;
                        }
                        else
                        {
                            return obj;
                        }
                    }
                    catch (System.Data.SqlClient.SqlException e)
                    {
                        connection.Close();
                        throw e;
                    }
                }
            }
        }
        public static object GetSingle(string SQLString, params SqlParameter[] cmdParms)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    try
                    {
                        PrepareCommand(cmd, connection, null, SQLString, cmdParms);
                        object obj = cmd.ExecuteScalar();
                        cmd.Parameters.Clear();
                        if ((Object.Equals(obj, null)) || (Object.Equals(obj, System.DBNull.Value)))
                        {
                            return null;
                        }
                        else
                        {
                            return obj;
                        }
                    }
                    catch (System.Data.SqlClient.SqlException e)
                    {
                        throw e;
                    }
                }
            }
        }
        #endregion

        #region 执行SQL命令，返回影响的行数
        // 执行SQL语句，返回影响的记录数
        public static int ExecuteNonQuery(string SQLString, params SqlParameter[] cmdParms)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    try
                    {
                        PrepareCommand(cmd, connection, null, SQLString, cmdParms);
                        int rows = cmd.ExecuteNonQuery();
                        cmd.Parameters.Clear();
                        return rows;
                    }
                    catch (System.Data.SqlClient.SqlException e)
                    {
                        throw e;
                    }
                }
            }
        }
        // 公有方法，执行Sql语句。对Update、Insert、Delete为影响到的行数，其他情况为-1
        public static int ExecuteNonQuery(String SQLString)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand(SQLString,connection))
                {
                    try
                    {
                        int rows = cmd.ExecuteNonQuery();
                        return rows;
                    }
                    catch (System.Data.SqlClient.SqlException e)
                    {
                        throw e;
                    }
                }
            }
        }
        #endregion

        #region 执行SQL命令，返回DataSet
        //执行查询语句，返回DataSet
        public static DataSet GetDataSet(string SQLString, params SqlParameter[] cmdParms)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                PrepareCommand(cmd, connection, null, SQLString, cmdParms);
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataSet ds = new DataSet();
                    try
                    {
                        da.Fill(ds, "ds");
                        cmd.Parameters.Clear();
                    }
                    catch (System.Data.SqlClient.SqlException ex)
                    {
                        throw new Exception(ex.Message);
                    }
                    return ds;
                }
            }
        }
        //获取数据，返回一个DataSet。    
        public static DataSet GetDataSet(string SQLString)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                connection.Open();
                using (SqlCommand cmd = new SqlCommand(SQLString, connection))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataSet ds = new DataSet();
                        try
                        {
                            da.Fill(ds, "ds");
                            cmd.Parameters.Clear();
                        }
                        catch (System.Data.SqlClient.SqlException ex)
                        {
                            throw new Exception(ex.Message);
                        }
                        return ds;
                    }
                }
            }
        }
        #endregion

        #region   传入参数并且转换为SqlParameter类型
        /// <summary>
        /// 转换参数
        /// </summary>
        /// <param name="ParamName">存储过程名称或命令文本</param>
        /// <param name="DbType">参数类型</param></param>
        /// <param name="Size">参数大小</param>
        /// <param name="Value">参数值</param>
        /// <returns>新的 parameter 对象</returns>
        public SqlParameter MakeInParam(string ParamName, SqlDbType DbType, int Size, object Value)
        {
            return MakeParam(ParamName, DbType, Size, ParameterDirection.Input, Value);
        }

        /// <summary>
        /// 初始化参数值
        /// </summary>
        /// <param name="ParamName">存储过程名称或命令文本</param>
        /// <param name="DbType">参数类型</param>
        /// <param name="Size">参数大小</param>
        /// <param name="Direction">参数方向</param>
        /// <param name="Value">参数值</param>
        /// <returns>新的 parameter 对象</returns>
        public SqlParameter MakeParam(string ParamName, SqlDbType DbType, Int32 Size, ParameterDirection Direction, object Value)
        {
            SqlParameter param;

            if (Size > 0)
                param = new SqlParameter(ParamName, DbType, Size);
            else
                param = new SqlParameter(ParamName, DbType);

            param.Direction = Direction;
            if (!(Direction == ParameterDirection.Output && Value == null))
                param.Value = Value;
            return param;
        }
        #endregion        
    }
}
