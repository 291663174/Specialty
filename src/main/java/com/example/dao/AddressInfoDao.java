package com.example.dao;

import com.example.entity.AddressInfo;
import com.example.vo.AddressInfoVo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

@Repository
public interface AddressInfoDao extends Mapper<AddressInfo> {
    List<AddressInfoVo> findByName(@Param("name") String name, @Param("userId") Long userId);

    @Select("select * from address_info where userId = #{userId}")
    List<AddressInfoVo> findByUserId(Long userId);
}
