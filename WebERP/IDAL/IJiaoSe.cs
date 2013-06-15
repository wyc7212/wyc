using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;

namespace IDAL
{
    public interface IJiaoSe
    {
        IList<JiaoSeInfo> GetAllJiaoSe();
        IList<JiaoSeInfo> SelectJiaoSe(int JiaoSeID);

        int Add(JiaoSeInfo jiaose);
        int Delete(JiaoSeInfo jiaose);
        int Update(JiaoSeInfo jiaose);
    }
}
