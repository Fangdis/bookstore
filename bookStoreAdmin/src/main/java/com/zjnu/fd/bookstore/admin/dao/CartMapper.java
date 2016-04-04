package com.zjnu.fd.bookstore.admin.dao;



import com.zjnu.fd.bookstore.admin.po.Cart;

import java.util.List;

public interface CartMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Cart record);

    int insertSelective(Cart record);

    Cart selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Cart record);

    int updateByPrimaryKey(Cart record);

    List<Cart> listByUserId(int userId);

    Cart findByUserIdAndIds(int userId, int stt);
}