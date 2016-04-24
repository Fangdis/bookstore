package com.zjnu.fd.bookstore.admin.controller;

import com.zjnu.fd.bookstore.admin.model.OrderModel;
import com.zjnu.fd.bookstore.admin.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by xqYang on 2016/4/3.
 */
@RequestMapping("order")
@Controller
public class OrderController {
    @Resource
    private OrderService orderService;
    @RequestMapping("list")
    public ModelAndView list(ModelAndView modelAndView){
        List<OrderModel> orderModels = orderService.listAll(0, 100);
        modelAndView.addObject("orders",orderModels);
        modelAndView.setViewName("/orderManage/orderList");
        return modelAndView;
    }
    @RequestMapping("update")
    public String update(@RequestParam("id") Integer id,@RequestParam("status") Integer status){
        orderService.update(id,status);
        return "redirect:/order/list";
    }
}
