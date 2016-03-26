package com.zjnu.fd.bookstore.service;

import com.zjnu.fd.bookstore.model.CartRefOrderModel;

import java.util.List;

/**
 * Created by xqYang on 2016/3/26.
 */
public interface OrderService {
    public List<CartRefOrderModel>listByUserId(int userId);
}
