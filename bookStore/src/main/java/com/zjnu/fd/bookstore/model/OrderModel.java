package com.zjnu.fd.bookstore.model;

import com.zjnu.fd.bookstore.po.Cart;

import java.io.Serializable;

/**
 * Created by xqYang on 2016/3/27.
 */
public class OrderModel implements Serializable {
    private String addTime;
    private String orderNumber;
    private int status;
    private Cart cart;

    public String getAddTime() {
        return addTime;
    }

    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }
}
