package com.zjnu.fd.bookstore.service.impl;

import com.zjnu.fd.bookstore.dao.AddressMapper;
import com.zjnu.fd.bookstore.po.Address;
import com.zjnu.fd.bookstore.service.AddressService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by xqYang on 2016/3/26.
 */
@Service
public class AddressServiceImpl implements AddressService {
    @Resource
    private AddressMapper addressMapper;
    public List<Address> listByUserId(int userId) {
       return addressMapper.listByUserId(userId);
    }
}
