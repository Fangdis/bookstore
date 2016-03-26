package com.zjnu.fd.bookstore.service;

import com.zjnu.fd.bookstore.po.Address;

import java.util.List;

/**
 * Created by xqYang on 2016/3/26.
 */
public interface AddressService {
    public List<Address> listByUserId(int userId);
}
