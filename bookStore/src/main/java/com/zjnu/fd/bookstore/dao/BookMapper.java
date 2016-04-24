package com.zjnu.fd.bookstore.dao;

import com.zjnu.fd.bookstore.po.Book;

import java.util.List;

public interface BookMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Book record);

    int insertSelective(Book record);

    Book selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Book record);

    int updateByPrimaryKey(Book record);

    List<Book> getBookListByType(int type);

    List<Book> findByKind(String kind);

    List<Book> findByKindAndMink(String kind, String minKind);

    List<Book> findByBookName(String searchName);

    List<Book> findByAuthor(String searchName);
}