package com.zjnu.fd.bookstore.admin.dao;


import com.zjnu.fd.bookstore.admin.po.User;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User findByPhone(String phone);

    List<User> listAll(int beg, int end);
}