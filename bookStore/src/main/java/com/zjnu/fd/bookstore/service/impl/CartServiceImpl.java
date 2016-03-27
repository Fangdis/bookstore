package com.zjnu.fd.bookstore.service.impl;

import com.zjnu.fd.bookstore.dao.CartMapper;
import com.zjnu.fd.bookstore.po.Cart;
import com.zjnu.fd.bookstore.service.CartService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
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

    public List<Cart> listByUserIdAndIds(int userId, String ids) {
        String[] stts=ids.split(",");
        List<Cart> lists=new ArrayList<Cart>();
        for (int i=0;i<stts.length;i++){
            if(stts[i]!=null&&stts[i]!="")
             lists.add(cartMapper.findByUserIdAndIds(userId,Integer.parseInt(stts[i])));
        }
        return lists;
    }
}
