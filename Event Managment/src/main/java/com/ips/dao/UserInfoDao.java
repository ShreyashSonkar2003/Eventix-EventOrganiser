package com.ips.dao;

import com.ips.pojo.UserInfo;

public interface UserInfoDao {

    boolean addNewUser(UserInfo u);

    UserInfo checkUserCredential(UserInfo u);

    int getTotalUsers();
}
