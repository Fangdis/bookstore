package com.zjnu.fd.bookstore.service;

import com.zjnu.fd.bookstore.po.Cart;

import java.util.List;

/**
 * Created by xqYang on 2016/3/26.
 */
public interface CartService {
    public int insert(Cart cart);
    public List<Cart>listByUserId(int userId);

    public int deleteById(int id);

    List<Cart> listByUserIdAndIds(int i, String ids);
}
