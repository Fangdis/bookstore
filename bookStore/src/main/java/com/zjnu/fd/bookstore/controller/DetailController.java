package com.zjnu.fd.bookstore.controller;

import com.zjnu.fd.bookstore.service.BookService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * Created by xqYang on 2016/3/26.
 */
@RequestMapping("detail")
@Controller
public class DetailController {
    @Resource
    BookService bookService;

    @RequestMapping("detail")
    public ModelAndView detail(@RequestParam("id") int id,ModelAndView modelAndView){
        modelAndView.setViewName("detail/detail");
        modelAndView.addObject("detail",bookService.getBookById(id));
        return modelAndView;
    }
}
