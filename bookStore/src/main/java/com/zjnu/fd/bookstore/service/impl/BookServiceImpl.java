package com.zjnu.fd.bookstore.service.impl;

import com.zjnu.fd.bookstore.dao.BookMapper;
import com.zjnu.fd.bookstore.po.Book;
import com.zjnu.fd.bookstore.service.BookService;
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

    public List<Book> findByKindAndMinK(String kind, String minKind) {
        if (minKind==null||minKind==""){
            return bookMapper.findByKind(kind);
        }else{
            return bookMapper.findByKindAndMink(kind,minKind);
        }
    }

    public List<Book> findByFlagAndSearchName(String flag, String searchName) {
        if ("1".equals(flag)){
            return bookMapper.findByBookName("%"+searchName+"%");
        }else
        return bookMapper.findByAuthor("%"+searchName+"%");
    }
}
