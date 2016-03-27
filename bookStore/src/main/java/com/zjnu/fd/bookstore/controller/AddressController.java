package com.zjnu.fd.bookstore.controller;

import com.zjnu.fd.bookstore.po.Address;
import com.zjnu.fd.bookstore.po.User;
import com.zjnu.fd.bookstore.service.AddressService;
import com.zjnu.fd.bookstore.util.OutPut;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by xqYang on 2016/3/27.
 */
@RequestMapping("address")
@Controller
public class AddressController {
    @Resource
    private AddressService addressService;

    @RequestMapping("add")
    @ResponseBody
    public String add(Address address, HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user==null) {
            return "redirect:/user/loginPage";
        }
        address.setUserid(user.getId());
        addressService.insert(address);
        return OutPut.json(200,"success","",0);
    }
}
