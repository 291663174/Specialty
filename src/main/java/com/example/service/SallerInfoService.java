package com.example.service;

import com.example.dao.SallerInfoDao;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import com.example.entity.SallerInfo;
import com.example.exception.CustomException;
import com.example.common.ResultCode;
import com.example.vo.SallerInfoVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import cn.hutool.crypto.SecureUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Service
public class SallerInfoService {

    @Resource
    private SallerInfoDao sallerInfoDao;

    public SallerInfo add(SallerInfo sallerInfo) {
        // 唯一校验
        int count = sallerInfoDao.checkRepeat("name", sallerInfo.getName(), null);
        if (count > 0) {
            throw new CustomException("1001", "用户名\"" + sallerInfo.getName() + "\"已存在");
        }
        if (StringUtils.isEmpty(sallerInfo.getPassword())) {
            // 默认密码123456
            sallerInfo.setPassword(SecureUtil.md5("123456"));
        } else {
            sallerInfo.setPassword(SecureUtil.md5(sallerInfo.getPassword()));
        }
        sallerInfoDao.insertSelective(sallerInfo);
        return sallerInfo;
    }

    public void delete(Long id) {
        sallerInfoDao.deleteByPrimaryKey(id);
    }

    public void update(SallerInfo sallerInfo) {
        sallerInfoDao.updateByPrimaryKeySelective(sallerInfo);
    }

    public SallerInfo findById(Long id) {
        return sallerInfoDao.selectByPrimaryKey(id);
    }

    public List<SallerInfoVo> findAll() {
        return sallerInfoDao.findByName("all");
    }

    public PageInfo<SallerInfoVo> findPage(String name, Integer pageNum, Integer pageSize, HttpServletRequest request) {
        PageHelper.startPage(pageNum, pageSize);
        List<SallerInfoVo> all = sallerInfoDao.findByName(name);
        return PageInfo.of(all);
    }

    public SallerInfoVo findByUserName(String name) {
        return sallerInfoDao.findByUsername(name);
    }

    public SallerInfo login(String username, String password) {
        SallerInfo sallerInfo = sallerInfoDao.findByUsername(username);
        if (sallerInfo == null) {
            throw new CustomException(ResultCode.USER_ACCOUNT_ERROR);
        }
        if (!SecureUtil.md5(password).equalsIgnoreCase(sallerInfo.getPassword())) {
            throw new CustomException(ResultCode.USER_ACCOUNT_ERROR);
        }
        return sallerInfo;
    }

}
