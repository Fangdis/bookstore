package com.zjnu.fd.bookstore.controller;

import com.zjnu.fd.bookstore.po.User;
import com.zjnu.fd.bookstore.service.UserService;
import com.zjnu.fd.bookstore.util.JsonUtil;
import com.zjnu.fd.bookstore.util.OutPut;
import com.zjnu.fd.bookstore.util.RandomUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by xqYang on 2016/3/26.
 */
@RequestMapping("user")
@Controller
public class UserController {
    @Resource
    private UserService userService;

    @RequestMapping("register")
    @ResponseBody
    public String register(@RequestParam("phone") String phone,@RequestParam("password") String password,@RequestParam("code") String code,HttpServletRequest request){
        HttpSession session = request.getSession();
        String sessionCode= (String) session.getAttribute("code");
        Map map=new HashMap();
        if (sessionCode!=null&&sessionCode.equals(code)){
            User user=new User();
            user.setPhone(phone);
            user.setPassword(password);
            user.setNickname("用户"+RandomUtil.randCode());
            userService.register(user);
            map.put("register","success");
        }else {
            map.put("register","error");
        }
        return OutPut.json(20,"success",map,0);
    }
    @ResponseBody
    @RequestMapping("randCode")
    public String randCode(HttpServletRequest request){
        HttpSession session = request.getSession();
        String code= RandomUtil.randCode();
        session.setAttribute("code",code);
        Map map=new HashMap();
       map.put("randCode","success");
        System.out.println("code: "+code);
        return OutPut.json(200,"success",map,0);
    }
    @ResponseBody
    @RequestMapping("login")
    public String login(@RequestParam("phone") String phone,@RequestParam("password") String password){
        User user=userService.findByPhone(phone);
        Map map=new HashMap();
        if (user!=null&&user.getPassword().equals(password)){
            map.put("login","success");
        }else
            map.put("login","error");
        return OutPut.json(200,"success",map,0);
    }
    @RequestMapping("loginPage")
    public String loginPage(){
        return "login/login";
    }
    @RequestMapping("registerPage")
    public String registerPage(){
        return "login/register";
    }
}
