package com.zjnu.fd.bookstore.controller;

import com.sun.javafx.sg.prism.NGShape;
import com.zjnu.fd.bookstore.po.Address;
import com.zjnu.fd.bookstore.po.Cart;
import com.zjnu.fd.bookstore.service.AddressService;
import com.zjnu.fd.bookstore.service.CartService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by xqYang on 2016/3/26.
 */
@RequestMapping("order")
@Controller
public class OrderController {

    @Resource
    private CartService cartService;

    @Resource
    private AddressService addressService;

    @RequestMapping("cart")
    public String cart(Cart cart){
        cart.setUserid(1);
        cartService.insert(cart);
        return "redirect:/order/shopCart";
    }
    @RequestMapping("shopCart")
    public ModelAndView shopCart(ModelAndView modelAndView){
        List<Cart> list=cartService.listByUserId(1);
        modelAndView.addObject("cart",list);
        modelAndView.setViewName("order/shopCart");
        return modelAndView;
    }
    @RequestMapping("delete")
    public String deleteCart(int id){
        cartService.deleteById(id);
        return "redirect:/order/shopCart";
    }
    @RequestMapping("shopOrder")
    public ModelAndView order(ModelAndView modelAndView){
        List<Cart> list=cartService.listByUserId(1);
        modelAndView.addObject("cart",list);
        List<Address> addressList = addressService.listByUserId(1);
        modelAndView.addObject("addressList",addressList);
        modelAndView.setViewName("order/order");
        return modelAndView;
    }
}
