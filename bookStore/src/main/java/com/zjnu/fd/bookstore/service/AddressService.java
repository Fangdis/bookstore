package com.zjnu.fd.bookstore.service;

import com.zjnu.fd.bookstore.po.Address;
import com.zjnu.fd.bookstore.po.User;

import java.util.List;

/**
 * Created by xqYang on 2016/3/26.
 */
public interface AddressService {
    public List<Address> listByUserId(int userId);

    public int insert(Address address);

    int setMask(Integer id, User user);

    int delete(Integer id, User user);
}
