package com.zjnu.fd.bookstore.service.impl;

import com.zjnu.fd.bookstore.dao.BookMapper;
import com.zjnu.fd.bookstore.dao.CartMapper;
import com.zjnu.fd.bookstore.po.Book;
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

    @Resource
    private BookMapper bookMapper;

    public int insert(Cart cart) {
        cartMapper.insert(cart);
        return 0;
    }

    public List<Cart> listByUserId(int userId) {
        List<Cart> carts = cartMapper.listByUserId(userId);
        for (int i=0;i<carts.size();i++){
            Book book = bookMapper.selectByPrimaryKey(carts.get(i).getBookid());
            carts.get(i).setTotalBook(book.getNowtotal());
        }
        return carts;
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

    public int updateCart(Integer id, int num) {
        Cart cart = cartMapper.selectByPrimaryKey(id);
        cart.setTotal(cart.getTotal()+num);
        cartMapper.updateByPrimaryKey(cart);
        Book book = bookMapper.selectByPrimaryKey(cart.getBookid());
        book.setNowtotal(book.getNowtotal()-num);
        bookMapper.updateByPrimaryKey(book);
        return 0;
    }
}
