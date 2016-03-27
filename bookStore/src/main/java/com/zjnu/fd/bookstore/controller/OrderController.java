package com.zjnu.fd.bookstore.controller;


import com.zjnu.fd.bookstore.po.Address;
import com.zjnu.fd.bookstore.po.Cart;
import com.zjnu.fd.bookstore.po.Order;
import com.zjnu.fd.bookstore.po.User;
import com.zjnu.fd.bookstore.service.AddressService;
import com.zjnu.fd.bookstore.service.CartService;
import com.zjnu.fd.bookstore.service.OrderRefCartService;
import com.zjnu.fd.bookstore.service.OrderService;
import com.zjnu.fd.bookstore.util.DateTimeUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
    @Resource
    private OrderRefCartService orderRefCartService;

    @Resource
    private OrderService orderService;
    @RequestMapping("cart")
    public String cart(Cart cart, HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user==null)
            return "redirect:/user/loginPage";
        cart.setUserid(user.getId());
        cartService.insert(cart);
        return "redirect:/order/shopCart";
    }
    @RequestMapping("shopCart")
    public ModelAndView shopCart(ModelAndView modelAndView,HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user==null) {
            modelAndView.setViewName("redirect:/user/loginPage");
            return modelAndView;
        }
        List<Cart> list=cartService.listByUserId(user.getId());
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
    public ModelAndView order(ModelAndView modelAndView,@RequestParam("ids") String ids,HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user==null) {
            modelAndView.setViewName("redirect:/user/loginPage");
            return modelAndView;
        }
        List<Cart> list=cartService.listByUserIdAndIds(user.getId(),ids);
        modelAndView.addObject("cart",list);
        List<Address> addressList = addressService.listByUserId(user.getId());
        modelAndView.addObject("addressList",addressList);
        modelAndView.setViewName("order/order");
        return modelAndView;
    }
    @RequestMapping("makeOrder")
    public ModelAndView makeOrder(ModelAndView modelAndView,Order order,HttpServletRequest request,@RequestParam("ids") String ids){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user==null) {
            modelAndView.setViewName("redirect:/user/loginPage");
            return modelAndView;
        }
        order.setUserId(user.getId());
        order.setAddTime(DateTimeUtils.getNowDateTime());
        String orderNumber =String.valueOf( System.currentTimeMillis());
        order.setOderNumber(orderNumber);
        order.setStatus(0);
        orderService.insert(order);
        orderRefCartService.insert(ids,orderNumber);
        modelAndView.setViewName("redirect:/user/userOrder");
        return modelAndView;
    }
}
