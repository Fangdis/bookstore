package com.zjnu.fd.bookstore.admin.service.impl;


import com.zjnu.fd.bookstore.admin.dao.CartMapper;
import com.zjnu.fd.bookstore.admin.dao.OrderMapper;
import com.zjnu.fd.bookstore.admin.dao.OrderRefCartMapper;
import com.zjnu.fd.bookstore.admin.model.OrderModel;
import com.zjnu.fd.bookstore.admin.po.Cart;
import com.zjnu.fd.bookstore.admin.po.Order;
import com.zjnu.fd.bookstore.admin.po.OrderRefCart;
import com.zjnu.fd.bookstore.admin.service.OrderService;
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
    @Resource
    private OrderRefCartMapper orderRefCartMapper;

    public List<OrderModel> listByUserId(int userId) {
        List<Order> orderList=orderMapper.list(userId);
        List<OrderModel> lists=new ArrayList<OrderModel>();
        for (int i=0;i<orderList.size();i++){
            OrderModel orderModel=new OrderModel();
            List<OrderRefCart> orderRefCarts = orderRefCartMapper.selectByOrderNumber(orderList.get(i).getOderNumber());
            ArrayList<Cart> carts = new ArrayList<Cart>();
            for (int j=0;j<orderRefCarts.size();j++){
                Cart cart=cartMapper.selectByPrimaryKey(orderRefCarts.get(j).getCartId());
                carts.add(cart);
            }
            orderModel.setStatus(orderList.get(i).getStatus());
            orderModel.setOrderNumber(orderList.get(i).getOderNumber());
            orderModel.setAddTime(orderList.get(i).getAddTime());
            orderModel.setCart(carts);
            lists.add(orderModel);
        }
        return lists;
    }

    public int insert(Order order) {
        return orderMapper.insert(order);
    }

    public List<OrderModel> listAll(int beg, int end) {
        List<Order> orderList=orderMapper.listAll(beg,end);
        List<OrderModel> lists=new ArrayList<OrderModel>();
        for (int i=0;i<orderList.size();i++){
            OrderModel orderModel=new OrderModel();
            List<OrderRefCart> orderRefCarts = orderRefCartMapper.selectByOrderNumber(orderList.get(i).getOderNumber());
            ArrayList<Cart> carts = new ArrayList<Cart>();
            for (int j=0;j<orderRefCarts.size();j++){
                Cart cart=cartMapper.selectByPrimaryKey(orderRefCarts.get(j).getCartId());
                carts.add(cart);
                orderModel.setUserId(cart.getUserid());
            }
            orderModel.setStatus(orderList.get(i).getStatus());
            orderModel.setOrderNumber(orderList.get(i).getOderNumber());
            orderModel.setAddTime(orderList.get(i).getAddTime());
            orderModel.setCart(carts);
            lists.add(orderModel);
        }
        return lists;
    }
}
