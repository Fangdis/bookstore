package com.zjnu.fd.bookstore.service.impl;

import com.zjnu.fd.bookstore.dao.UserMapper;
import com.zjnu.fd.bookstore.po.User;
import com.zjnu.fd.bookstore.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by xqYang on 2016/3/26.
 */
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;
    public int register(User user) {
        return userMapper.insertSelective(user);
    }

    public int login(User user) {
        return 0;
    }

    public User findByPhone(String phone) {
      return userMapper.findByPhone(phone);
    }
}
