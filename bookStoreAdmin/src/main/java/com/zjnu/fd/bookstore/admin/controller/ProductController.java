package com.zjnu.fd.bookstore.admin.controller;

import com.zjnu.fd.bookstore.admin.po.Book;
import com.zjnu.fd.bookstore.admin.service.BookService;
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
    public ModelAndView list(ModelAndView modelAndView){
        modelAndView.setViewName("/productManage/peoductList");
        List<Book> books = bookService.listAll(0, 100);
        modelAndView.addObject("books",books);
        return modelAndView;
    }
    @RequestMapping("add")
    public ModelAndView add(ModelAndView modelAndView,Book book){

        bookService.update(book);
        modelAndView.setViewName("redirect:/product/list");
        return modelAndView;
    }
    @RequestMapping("addPage")
    public ModelAndView toAddPage(ModelAndView modelAndView){
        modelAndView.setViewName("/productManage/productAdd");
        return  modelAndView;
    }
    @RequestMapping("edit")
    public ModelAndView edit(@RequestParam("id")int id,ModelAndView modelAndView){
        modelAndView.setViewName("/productManage/productEdit");
        modelAndView.addObject("book",bookService.getBookById(id));
        return modelAndView;
    }
    @RequestMapping("delete")
    public ModelAndView delete(ModelAndView modelAndView,@RequestParam("id")int id){
        bookService.delete(id);
        modelAndView.setViewName("redirect:/product/list");
        return modelAndView;
    }
}
