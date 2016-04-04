package com.zjnu.fd.bookstore.admin.service;



import com.zjnu.fd.bookstore.admin.model.OrderModel;
import com.zjnu.fd.bookstore.admin.po.Order;

import java.util.List;

/**
 * Created by xqYang on 2016/3/26.
 */
public interface OrderService {
    public List<OrderModel>listByUserId(int userId);

    public int insert(Order order);

    List<OrderModel> listAll(int beg, int end);
}
