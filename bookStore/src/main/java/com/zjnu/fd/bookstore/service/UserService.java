package com.zjnu.fd.bookstore.service;

import com.zjnu.fd.bookstore.po.User;

/**
 * Created by xqYang on 2016/3/26.
 */
public interface UserService {

    public int register(User user);

    public int login(User user);

    User findByPhone(String phone);

    int update(User user);
}
