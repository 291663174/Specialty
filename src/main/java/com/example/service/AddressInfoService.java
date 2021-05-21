package com.example.service;

import cn.hutool.json.JSONUtil;
import com.example.dao.AddressInfoDao;
import org.springframework.stereotype.Service;
import com.example.entity.AddressInfo;
import com.example.entity.AuthorityInfo;
import com.example.entity.Account;
import com.example.vo.AddressInfoVo;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Service
public class AddressInfoService {

    @Resource
    private AddressInfoDao addressInfoDao;

    public AddressInfo add(AddressInfo addressInfo) {
        addressInfoDao.insertSelective(addressInfo);
        return addressInfo;
    }

    public void delete(Long id) {
        addressInfoDao.deleteByPrimaryKey(id);
    }

    public void update(AddressInfo addressInfo) {
        addressInfoDao.updateByPrimaryKeySelective(addressInfo);
    }

    public AddressInfo findById(Long id) {
        return addressInfoDao.selectByPrimaryKey(id);
    }

    public List<AddressInfoVo> findAll() {
        return addressInfoDao.findByName("all", null);
    }

    public PageInfo<AddressInfoVo> findPage(String name, Integer pageNum, Integer pageSize, HttpServletRequest request) {
        PageHelper.startPage(pageNum, pageSize);
        List<AddressInfoVo> all = findAllPage(request, name);
        return PageInfo.of(all);
    }

    public List<AddressInfoVo> findAllPage(HttpServletRequest request, String name) {
        Account account = (Account) request.getSession().getAttribute("user");
        if(account.getLevel() == 1 || account.getLevel() == 2) {
            return addressInfoDao.findByName(name, null);
        } else {
            return addressInfoDao.findByName(name, account.getId());
        }

    }

    public List<AddressInfoVo> findByUserId(Long userId) {
        return addressInfoDao.findByUserId(userId);
    }
}
