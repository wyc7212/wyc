using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;

namespace Model
{
    [Serializable]
	public class UserInfo
	{
        public UserInfo()
        {}

        private int _id;
        private string _loginName;
        private string _userName;
        private string _passWord;
        private int _jiaoSeID;
        private string _jiaoSeName;
        private bool _isEnable;
        private string _remark;

        public int ID
        {
            get { return _id; }
            set { _id = value; }
        }
        public string LoginName
        {
            get { return _loginName; }
            set { _loginName = value; }
        }
        public string UserName
        {
            get { return _userName; }
            set { _userName = value; }
        }
        public string PassWord        
        {
            get { return _passWord; }
            set { _passWord = value; }
        }
        public int JiaoSeID
        {
            get { return _jiaoSeID; }
            set { _jiaoSeID = value; }
        }
        public string JiaoSeName
        {
            get { return _jiaoSeName; }
            set { _jiaoSeName = value; }
        }
        public bool IsEnable
        {
            get { return _isEnable; }
            set { _isEnable = value; }
        }
        public string Remark
        {
            get { return _remark; }
            set { _remark = value; } 
        }
	}
}