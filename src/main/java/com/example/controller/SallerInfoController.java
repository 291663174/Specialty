package com.example.controller;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelWriter;
import com.example.common.Result;
import com.example.common.ResultCode;
import com.example.entity.SallerInfo;
import com.example.service.SallerInfoService;
import com.example.exception.CustomException;
import com.example.common.ResultCode;
import com.example.vo.SallerInfoVo;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.example.service.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Value;
import cn.hutool.core.util.StrUtil;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping(value = "/sallerInfo")
public class SallerInfoController {

    @Resource
    private SallerInfoService sallerInfoService;

    @PostMapping
    public Result<SallerInfo> add(@RequestBody SallerInfoVo sallerInfo) {
        sallerInfoService.add(sallerInfo);
        return Result.success(sallerInfo);
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Long id) {
        sallerInfoService.delete(id);
        return Result.success();
    }

    @PutMapping
    public Result update(@RequestBody SallerInfoVo sallerInfo) {
        sallerInfoService.update(sallerInfo);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<SallerInfo> detail(@PathVariable Long id) {
        SallerInfo sallerInfo = sallerInfoService.findById(id);
        return Result.success(sallerInfo);
    }

    @GetMapping
    public Result<List<SallerInfoVo>> all() {
        return Result.success(sallerInfoService.findAll());
    }

    @GetMapping("/page/{name}")
    public Result<PageInfo<SallerInfoVo>> page(@PathVariable String name,
                                                @RequestParam(defaultValue = "1") Integer pageNum,
                                                @RequestParam(defaultValue = "5") Integer pageSize,
                                                HttpServletRequest request) {
        return Result.success(sallerInfoService.findPage(name, pageNum, pageSize, request));
    }

    @PostMapping("/register")
    public Result<SallerInfo> register(@RequestBody SallerInfo sallerInfo) {
        if (StrUtil.isBlank(sallerInfo.getName()) || StrUtil.isBlank(sallerInfo.getPassword())) {
            throw new CustomException(ResultCode.PARAM_ERROR);
        }
        return Result.success(sallerInfoService.add(sallerInfo));
    }

    /**
    * 批量通过excel添加信息
    * @param file excel文件
    * @throws IOException
    */
    @PostMapping("/upload")
    public Result upload(MultipartFile file) throws IOException {

        List<SallerInfo> infoList = ExcelUtil.getReader(file.getInputStream()).readAll(SallerInfo.class);
        if (!CollectionUtil.isEmpty(infoList)) {
            // 处理一下空数据
            List<SallerInfo> resultList = infoList.stream().filter(x -> ObjectUtil.isNotEmpty(x.getName())).collect(Collectors.toList());
            for (SallerInfo info : resultList) {
                sallerInfoService.add(info);
            }
        }
        return Result.success();
    }

    @GetMapping("/getExcelModel")
    public void getExcelModel(HttpServletResponse response) throws IOException {
        // 1. 生成excel
        Map<String, Object> row = new LinkedHashMap<>();
		row.put("name", "张天志");
		row.put("password", "123456");
		row.put("nickName", "老张");
		row.put("sex", "男");
		row.put("age", 22);
		row.put("birthday", "TIME");
		row.put("phone", "18843232356");
		row.put("address", "上海市");
		row.put("email", "aa@163.com");
		row.put("cardId", "342425199001116372");
		row.put("level", 2);

        List<Map<String, Object>> list = CollUtil.newArrayList(row);

        // 2. 写excel
        ExcelWriter writer = ExcelUtil.getWriter(true);
        writer.write(list, true);

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        response.setHeader("Content-Disposition","attachment;filename=sallerInfoModel.xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        writer.close();
        IoUtil.close(System.out);
    }
}
