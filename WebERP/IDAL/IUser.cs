using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;

namespace IDAL
{
    public interface IUser
    {
        IList<UserInfo> GetAllUser();
        IList<UserInfo> SelectUser(string LoginName);

        int Add(UserInfo user);
        int Delete(UserInfo user);
        int Update(UserInfo user);
    }
}
