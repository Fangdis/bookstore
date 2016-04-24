package com.zjnu.fd.bookstore.admin.controller;

import com.zjnu.fd.bookstore.admin.po.Book;
import com.zjnu.fd.bookstore.admin.service.BookService;
import com.zjnu.fd.bookstore.admin.util.OutPut;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        List list=new ArrayList();
        list.add("文学");
        list.add("少儿");
        list.add("教育");
        list.add("经管");
        list.add("励志");
        list.add("生活");
        list.add("科技");
        list.add("艺术");
        list.add("杂志");
        list.add("音像");
        modelAndView.addObject("kind",list);
        modelAndView.setViewName("/productManage/productAdd");
        return  modelAndView;
    }
    @RequestMapping("edit")
    public ModelAndView edit(@RequestParam("id")int id,ModelAndView modelAndView){
        modelAndView.setViewName("/productManage/productEdit");
        modelAndView.addObject("book",bookService.getBookById(id));
        List list=new ArrayList();
        list.add("文学");
        list.add("少儿");
        list.add("教育");
        list.add("经管");
        list.add("励志");
        list.add("生活");
        list.add("科技");
        list.add("艺术");
        list.add("杂志");
        list.add("音像");
        modelAndView.addObject("kind",list);
        return modelAndView;
    }
    @RequestMapping("delete")
    public ModelAndView delete(ModelAndView modelAndView,@RequestParam("id")int id){
        bookService.delete(id);
        modelAndView.setViewName("redirect:/product/list");
        return modelAndView;
    }
    @RequestMapping("getMinKind")
    @ResponseBody
    public String getMinKind(@RequestParam(name = "index")Integer index, HttpServletResponse response){
        response.setCharacterEncoding("utf-8");
    List list=new ArrayList();
        list.add("小说,传记,动漫,散文");
        list.add("卡通,绘本,科普百科");
        list.add("教材,外语,字典,考试");
        list.add("管理,经济,投资,股票");
        list.add("社交,心灵鸡汤,职场");
        list.add("家居,美食,出行,服饰");
        list.add("建筑,医学,农业,电子");
        list.add("摄影,设计,绘画,音乐");
        list.add("美妆,时尚,数码,影视");
        list.add("音乐,卡通,动漫影视");
        Map map=new HashMap();
        map.put("minKind",list.get(index));
        return OutPut.json(200,"",map,0);
    }
}
