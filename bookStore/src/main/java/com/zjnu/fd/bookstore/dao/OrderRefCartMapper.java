package com.zjnu.fd.bookstore.dao;

import com.zjnu.fd.bookstore.po.OrderRefCart;

public interface OrderRefCartMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderRefCart record);

    int insertSelective(OrderRefCart record);

    OrderRefCart selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderRefCart record);

    int updateByPrimaryKey(OrderRefCart record);

    OrderRefCart selectByOrderNumber(String oderNumber);
}