package com.zjnu.fd.bookstore.service.impl;

import com.zjnu.fd.bookstore.dao.CartMapper;
import com.zjnu.fd.bookstore.dao.OrderMapper;
import com.zjnu.fd.bookstore.model.CartRefOrderModel;
import com.zjnu.fd.bookstore.po.Cart;
import com.zjnu.fd.bookstore.po.Order;
import com.zjnu.fd.bookstore.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by xqYang on 2016/3/26.
 */
@Service
public class OrderServiceImpl implements OrderService {
    @Resource
    private OrderMapper orderMapper;
    @Resource
    private CartMapper cartMapper;
    public List<CartRefOrderModel> listByUserId(int userId) {

        List<Order> orderList=orderMapper.list(userId);
        List<CartRefOrderModel> lists=new ArrayList<CartRefOrderModel>();
        for (int i=0;i<orderList.size();i++){
            CartRefOrderModel cartRefOrderModel = new CartRefOrderModel();
            Cart cart = cartMapper.selectByPrimaryKey(orderList.get(i).getCartId());
            cartRefOrderModel.setAddTime(orderList.get(i).getAddTime());
            cartRefOrderModel.setCover(cart.getCover());
            cartRefOrderModel.setName(cart.getName());
            cartRefOrderModel.setNum(cart.getTotal());
            cartRefOrderModel.setPrice(cart.getPrice());
            cartRefOrderModel.setOrderNumber(orderList.get(i).getOderNumber());
            cartRefOrderModel.setStatus(orderList.get(i).getStatus());
            lists.add(cartRefOrderModel);
        }
        return lists;
    }
}
