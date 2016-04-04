package com.zjnu.fd.bookstore.admin.service;


import com.zjnu.fd.bookstore.admin.po.User;

import java.util.List;

/**
 * Created by xqYang on 2016/3/26.
 */
public interface UserService {

    public int register(User user);

    public int login(User user);

    User findByPhone(String phone);

    int update(User user);

    List<User> listAll(int beg, int end);

    int delete(int id);
}
