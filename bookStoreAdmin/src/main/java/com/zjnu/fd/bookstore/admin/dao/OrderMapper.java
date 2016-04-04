package com.zjnu.fd.bookstore.admin.dao;



import com.zjnu.fd.bookstore.admin.po.Order;

import java.util.List;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Order record);

    int insertSelective(Order record);

    Order selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);

    List<Order> list(int userId);

    List<Order> listAll(int beg, int end);
}