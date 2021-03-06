package com.zjnu.fd.bookstore.dao;

import com.zjnu.fd.bookstore.po.OrderRefCart;

import java.util.List;

public interface OrderRefCartMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderRefCart record);

    int insertSelective(OrderRefCart record);

    OrderRefCart selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderRefCart record);

    int updateByPrimaryKey(OrderRefCart record);

    List<OrderRefCart> selectByOrderNumber(String oderNumber);
}