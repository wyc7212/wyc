using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public class JiaoSe
    {
        private static readonly IDAL.IJiaoSe dal = DALFactory.DataAccess.CreateJiaoSe();

        public IList<Model.JiaoSeInfo> GetAllJiaoSe()
        {
            IList<Model.JiaoSeInfo> list;
            list = dal.GetAllJiaoSe();
            return list;
        }

        // 根据一个登录名返回一个UserInfo
        public Model.JiaoSeInfo SelectJiaoSe(int JiaoSeID)
        {
            Model.JiaoSeInfo jiaose = dal.SelectJiaoSe(JiaoSeID)[0];

            return jiaose;
        }
    }
}
