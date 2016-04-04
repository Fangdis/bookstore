package com.zjnu.fd.bookstore.service;

import com.zjnu.fd.bookstore.po.Book;

import java.util.List;

/**
 * Created by xqYang on 2016/3/26.
 */
public interface BookService {
    /**
     * 精选新书
     * @return
     */
    public List<Book>getNewBooks();

    /**
     * 特价好书
     * @return
     */
    public List<Book>getBargainPriceBooks();

    /**
     * 为你推荐
     * @return
     */
    public List<Book>getRecommendBooks();

    /**
     * 根据id获取书
     * @param id
     * @return
     */
    public Book getBookById(int id);


    List<Book> findByKindAndMinK(String kind, String minKind);
}
