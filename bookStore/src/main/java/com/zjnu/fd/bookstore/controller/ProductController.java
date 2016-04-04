package com.zjnu.fd.bookstore.controller;

import com.zjnu.fd.bookstore.po.Book;
import com.zjnu.fd.bookstore.service.BookService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by xqYang on 2016/4/3.
 */
@RequestMapping("product")
@Controller
public class ProductController {
    @Resource
    private BookService bookService;
    @RequestMapping("list")
    public ModelAndView list(ModelAndView modelAndView, @RequestParam("kind") String kind,@RequestParam(value = "minKind",required = false) String minKind){
        List<Book> byKindAndMinK = bookService.findByKindAndMinK(kind, minKind);
        modelAndView.setViewName("detail/list");
        modelAndView.addObject("books",byKindAndMinK);
        modelAndView.addObject("kind",kind);
        modelAndView.addObject("minKind",minKind);
        return modelAndView;
    }
}
