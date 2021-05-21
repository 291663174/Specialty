package com.example.dao;

import com.example.entity.SallerInfo;
import com.example.vo.SallerInfoVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

@Repository
public interface SallerInfoDao extends Mapper<SallerInfo> {
    List<SallerInfoVo> findByName(@Param("name") String name);
    
    int checkRepeat(@Param("column") String column, @Param("value") String value, @Param("id") Long id);
    SallerInfoVo findByUsername(String username);
    Integer count();
}
