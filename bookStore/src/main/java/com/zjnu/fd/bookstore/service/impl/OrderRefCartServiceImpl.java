package com.zjnu.fd.bookstore.service.impl;

import com.zjnu.fd.bookstore.dao.OrderRefCartMapper;
import com.zjnu.fd.bookstore.po.OrderRefCart;
import com.zjnu.fd.bookstore.service.OrderRefCartService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by xqYang on 2016/3/27.
 */
@Service
public class OrderRefCartServiceImpl implements OrderRefCartService {
    @Resource
    public OrderRefCartMapper orderRefCartMapper;
    public int insert(String ids, String orderNumber) {
        String[] stts=ids.split(",");
        for (int i=0;i<stts.length;i++){
            OrderRefCart orderRefCart=new OrderRefCart();
            if (stts[i]!=null&&stts[i]!="")
            orderRefCart.setCartId(Integer.parseInt(stts[i]));
            orderRefCart.setOrderNumber(orderNumber);
            orderRefCartMapper.insert(orderRefCart);
        }
        return 0;
    }
}
