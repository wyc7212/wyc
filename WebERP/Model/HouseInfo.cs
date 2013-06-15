using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    [Serializable]
    public class HouseInfo
    {
        private int _id;
        private string _menpaihao;
        private string _fanghao;
        private int _louceng;
        private int _loupanID;
        private string _loupanName;
        private int _dongbieID;
        private string _dongbieName;
        private string _wuyeType;
        private string _huxing;
        private decimal _jzmj;
        private decimal _symj;
        private decimal _gtmj;
        private decimal _TotalPrice;
        private decimal _jzPrice;
        private decimal _syPrice;
        private int _tupianID;
        private string _status;
        private string _desc;

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        public string Menpaihao
        {
            get { return _menpaihao; }
            set { _menpaihao = value; }
        }

        public string Fanghao
        {
            get { return _fanghao; }
            set { _fanghao = value; }
        }

        public int LouCeng
        {
            get { return _louceng; }
            set { _louceng = value; }
        }

        public int LoupanID
        {
            get { return _loupanID; }
            set { _loupanID = value; }
        }
        public string LoupanName
        {
            get { return _loupanName; }
            set { _loupanName = value; }
        }

        public int DongbieID
        {
            get { return _dongbieID; }
            set { _dongbieID = value; }
        }
        public string DongbieName
        {
            get { return _dongbieName; }
            set { _dongbieName = value; }
        }

        public string Huxing
        {
            get { return _huxing; }
            set { _huxing = value; }
        }

        public string WuyeType
        {
            get { return _wuyeType; }
            set { _wuyeType = value; }
        }

        public decimal Jzmj
        {
            get { return _jzmj; }
            set { _jzmj = value; }
        }

        public decimal Symj
        {
            get { return _symj; }
            set { _symj = value; }
        }

        public decimal Gtmj
        {
            get { return _gtmj; }
            set { _gtmj = value; }
        }

        public decimal TotalPrice
        {
            get { return _TotalPrice; }
            set { _TotalPrice = value; }
        }

        public decimal JzPrice
        {
            get { return _jzPrice; }
            set { _jzPrice = value; }
        }

        public decimal SyPrice
        {
            get { return _syPrice; }
            set { _syPrice = value; }
        }

        public int TupianID
        {
            get { return _tupianID; }
            set { _tupianID = value; }
        }

        public string Status
        {
            get { return _status; }
            set { _status = value; }
        }

        public string Desc
        {
            get { return _desc; }
            set { _desc = value; }
        }
    }
}
