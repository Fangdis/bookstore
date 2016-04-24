package com.zjnu.fd.bookstore.admin.service.impl;



import com.zjnu.fd.bookstore.admin.dao.BookMapper;
import com.zjnu.fd.bookstore.admin.po.Book;
import com.zjnu.fd.bookstore.admin.service.BookService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by xqYang on 2016/3/26.
 */
@Service
public class BookServiceImpl implements BookService {
    @Resource
    private BookMapper bookMapper;

    public List<Book> getNewBooks() {
        return bookMapper.getBookListByType(1);
    }

    public List<Book> getBargainPriceBooks() {
        return bookMapper.getBookListByType(2);
    }

    public List<Book> getRecommendBooks() {
        return bookMapper.getBookListByType(3);
    }

    public Book getBookById(int id) {
       return bookMapper.selectByPrimaryKey(id);
    }

    public List<Book> listAll(int beg, int end) {
        return bookMapper.listAll(beg,end);
    }

    public int update(Book book) {
        book.setNowtotal(book.getTotal());
        book.setPicture(book.getCover());
        if (book.getId()!=null){
            bookMapper.updateByPrimaryKeySelective(book);
        }else bookMapper.insertSelective(book);
        return 0;
    }

    public int delete(int id) {
        bookMapper.deleteByPrimaryKey(id);
        return 0;
    }
}
