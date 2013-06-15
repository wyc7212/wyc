using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    [Serializable]
    public class JiaoSeInfo
    {
        private int _id;
        private string _jiaoseName;
        private string _remark;
        private string _quanxian;

        public int ID
        {
            get { return _id; }
            set { _id = value; }
        }
        public string JiaoSeName
        {
            get { return _jiaoseName; }
            set { _jiaoseName = value; }
        }
        public string Remark
        {
            get { return _remark; }
            set { _remark = value; }
        }
        public string QuanXian
        {
            get { return _quanxian; }
            set { _quanxian = value; }
        }
    }
}
