package com.zjnu.fd.bookstore.service.impl;

import com.zjnu.fd.bookstore.dao.CartMapper;
import com.zjnu.fd.bookstore.po.Cart;
import com.zjnu.fd.bookstore.service.CartService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by xqYang on 2016/3/26.
 */
@Service
public class CartServiceImpl implements CartService {
    @Resource
    private CartMapper cartMapper;

    public int insert(Cart cart) {
        cartMapper.insert(cart);
        return 0;
    }

    public List<Cart> listByUserId(int userId) {
        return cartMapper.listByUserId(userId);
    }

    public int deleteById(int id) {
        cartMapper.deleteByPrimaryKey(id);
        return 0;
    }
}
