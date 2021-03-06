package com.zjnu.fd.bookstore.admin.dao;



import com.zjnu.fd.bookstore.admin.po.Book;

import java.util.List;

public interface BookMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Book record);

    int insertSelective(Book record);

    Book selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Book record);

    int updateByPrimaryKey(Book record);

    List<Book> getBookListByType(int type);

    List<Book> listAll(int beg, int end);
}