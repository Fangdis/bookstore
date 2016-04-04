package com.zjnu.fd.bookstore.admin.service.impl;


import com.zjnu.fd.bookstore.admin.dao.UserMapper;
import com.zjnu.fd.bookstore.admin.po.User;
import com.zjnu.fd.bookstore.admin.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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

    public int update(User user) {
        userMapper.updateByPrimaryKeySelective(user);
        return 0;
    }

    public List<User> listAll(int beg, int end) {
        return userMapper.listAll(beg,end);
    }

    public int delete(int id) {
        userMapper.deleteByPrimaryKey(id);
        return 0;
    }
}
