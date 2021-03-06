package com.zjnu.fd.bookstore.controller;

import com.zjnu.fd.bookstore.model.OrderModel;
import com.zjnu.fd.bookstore.po.Address;
import com.zjnu.fd.bookstore.po.Cart;
import com.zjnu.fd.bookstore.po.User;
import com.zjnu.fd.bookstore.service.AddressService;
import com.zjnu.fd.bookstore.service.CartService;
import com.zjnu.fd.bookstore.service.OrderService;
import com.zjnu.fd.bookstore.service.UserService;
import com.zjnu.fd.bookstore.util.OutPut;
import com.zjnu.fd.bookstore.util.RandomUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * Created by xqYang on 2016/3/26.
 */
@RequestMapping("user")
@Controller
public class UserController {

    @Resource
    private UserService userService;

    @Resource
    private OrderService orderService;
    @Resource
    private AddressService addressService;

    @Resource
    private CartService cartService;
    @RequestMapping("register")
    @ResponseBody
    public String register(@RequestParam("phone") String phone,@RequestParam("password") String password,@RequestParam("code") String code,HttpServletRequest request){
        HttpSession session = request.getSession();
        String sessionCode= (String) session.getAttribute("code");
        Map map=new HashMap();
        if (userService.findByPhone(phone)==null&&sessionCode!=null&&sessionCode.equals(code)){
            User user=new User();
            user.setPhone(phone);
            user.setPassword(password);
            user.setAvatar("imgs/user.png");
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
    public String login(@RequestParam("phone") String phone,@RequestParam("password") String password,HttpServletRequest request){
        User user=userService.findByPhone(phone);
        HttpSession session = request.getSession();
        Map map=new HashMap();
        if (user!=null&&user.getPassword().equals(password)){
            session.setAttribute("user",user);
            List<Cart> list=cartService.listByUserId(user.getId());
            session.setAttribute("sumCart",list.size());
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
    @RequestMapping("userCenter")
    public String userCenter(){
        return "userCenter/myInformation";
    }

    @RequestMapping("userOrder")
    public ModelAndView userOrder(HttpServletRequest request,ModelAndView modelAndView){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user==null) {
            modelAndView.setViewName("redirect:/user/loginPage");
            return modelAndView;
        }
        List<OrderModel> cartRefOrderModels = orderService.listByUserId(user.getId());
        modelAndView.setViewName("userCenter/myOrder");
        modelAndView.addObject("orders",cartRefOrderModels);
        return  modelAndView;
    }

    @RequestMapping("/myAddress")
    public ModelAndView userAddress(HttpServletRequest request,ModelAndView modelAndView){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user==null) {
            modelAndView.setViewName("redirect:/user/loginPage");
            return modelAndView;
        }
        List<Address> addressList = addressService.listByUserId(user.getId());
        modelAndView.addObject("addressList",addressList);
        modelAndView.setViewName("userCenter/myAddress");
        return modelAndView;
    }
    @RequestMapping("myInformation")
    public ModelAndView myInformation(HttpServletRequest request,ModelAndView modelAndView){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user==null) {
            modelAndView.setViewName("redirect:/user/loginPage");
            return modelAndView;
        }
        modelAndView.setViewName("userCenter/myInformation");
        return modelAndView;
    }
    @RequestMapping("updateInformation")
    @ResponseBody
    public String updateInformation(HttpServletRequest request,User user){
        HttpSession session = request.getSession();
       User us= (User) session.getAttribute("user");
        if (user.getAvatar()!=null)
            us.setAvatar(user.getAvatar());
        if (user.getNickname()!=null)
            us.setNickname(user.getNickname());
        if (user.getIntroduction()!=null)
            us.setIntroduction(user.getIntroduction());
        if (user.getPosnum()!=null)
            us.setPosnum(user.getPosnum());
        if (user.getProvince()!=null)
            us.setProvince(user.getProvince());
        if (user.getCity()!=null)
            us.setCity(user.getCity());
        userService.update(us);
        session.setAttribute("user",us);
        return OutPut.json(200, "success", "", 0);
    }
    @RequestMapping("upLoadPhoto")
    @ResponseBody
    public String upLoadUserPhoto( HttpServletRequest request){
        Map map=new HashMap();
        try {
            CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
            //判断 request 是否有文件上传,即多部分请求
            if(multipartResolver.isMultipart(request)) {
                //转换成多部分request
                MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
                //取得request中的所有文件名
                Iterator<String> fileNames = multiRequest.getFileNames();
                String filePath = null;
                while(fileNames.hasNext()) {
                    MultipartFile file = multiRequest.getFile(fileNames.next());
                   filePath = uploadFile(file, request);
                }

                map.put("filePath", filePath);
                return OutPut.json(200, "success", map, 0);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
    private  String uploadFile(MultipartFile file, HttpServletRequest request) throws IOException {
        String fileName = file.getOriginalFilename();
        String path=request.getServletContext().getRealPath("/imgs/");
        File tempFile = new File(path, new Date().getTime() + fileName.substring(fileName.lastIndexOf(".")));
        if (!tempFile.getParentFile().exists()) {
            tempFile.getParentFile().mkdir();
        }
        if (!tempFile.exists()) {
            tempFile.createNewFile();
        }
        file.transferTo(tempFile);
        return FILE_PATH + tempFile.getName();
    }

    public static File getFile(String fileName) {
        return new File(FILE_PATH, fileName);
    }
    public static final String FILE_PATH = "/imgs/";

    @RequestMapping("myPassword")
    public  String myPassword(){
        return "userCenter/myPassword";
    }
    @RequestMapping("updatePsw")
    @ResponseBody
    public String updatePsw(String oldPassword,String password,String newPassword,HttpServletRequest request){
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (password==null||!password.equals(newPassword)||user==null||!user.getPassword().equals(oldPassword)){
            return OutPut.json(200, "error", "error", 0);
        }
        user.setPassword(newPassword);
        userService.update(user);
        session.setAttribute("user",user);
        return OutPut.json(200, "success", "success", 0);
    }
}
