package com.zjnu.fd.bookstore.service.impl;

import com.zjnu.fd.bookstore.dao.AddressMapper;
import com.zjnu.fd.bookstore.po.Address;
import com.zjnu.fd.bookstore.po.User;
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

    public int insert(Address address) {
        if (address.getStatus()==null)
            address.setStatus(0);
        if (address.getId()!=null){
            return addressMapper.updateByPrimaryKey(address);
        }
        return addressMapper.insert(address);
    }

    public int setMask(Integer id, User user) {
        List<Address> addresses = addressMapper.listByUserId(user.getId());
        for (int i=0;i<addresses.size();i++){
            if (addresses.get(i).getStatus()!=null&&addresses.get(i).getStatus()==1){
                addresses.get(i).setStatus(0);
                addressMapper.updateByPrimaryKey(addresses.get(i));
            }
        }
        Address address = addressMapper.selectByPrimaryKey(id);
        address.setStatus(1);
        addressMapper.updateByPrimaryKey(address);
        return 0;
    }

    public int delete(Integer id, User user) {
        Address address = addressMapper.selectByPrimaryKey(id);
        address.setStatus(2);
        addressMapper.updateByPrimaryKey(address);
        return 0;
    }
}
