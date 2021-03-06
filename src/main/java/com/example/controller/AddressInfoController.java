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
import com.example.entity.Account;
import com.example.entity.AddressInfo;
import com.example.service.*;
import com.example.vo.AddressInfoVo;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping(value = "/addressInfo")
public class AddressInfoController {
    @Resource
    private AddressInfoService addressInfoService;

    @PostMapping
    public Result<AddressInfo> add(@RequestBody AddressInfoVo addressInfo, HttpServletRequest request) {
        Account account = (Account) request.getSession().getAttribute("user");
        addressInfo.setUserId(account.getId());
        addressInfoService.add(addressInfo);
        return Result.success(addressInfo);
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Long id) {
        addressInfoService.delete(id);
        return Result.success();
    }

    @PutMapping
    public Result update(@RequestBody AddressInfoVo addressInfo) {
        addressInfoService.update(addressInfo);
        return Result.success();
    }

    @GetMapping("/{id}")
    public Result<AddressInfo> detail(@PathVariable Long id) {
        AddressInfo addressInfo = addressInfoService.findById(id);
        return Result.success(addressInfo);
    }

    @GetMapping
    public Result<List<AddressInfoVo>> all() {
        return Result.success(addressInfoService.findAll());
    }

    @GetMapping("/user/{userId}")
    public Result<List<AddressInfoVo>> findByUserId(@PathVariable Long userId, HttpServletRequest request) {
        Account account = (Account) request.getSession().getAttribute("user");
        if(account.getLevel() == 1 || account.getLevel() == 2) {
            return Result.success(new ArrayList<>());
        }
        return Result.success(addressInfoService.findByUserId(userId));
    }

    @GetMapping("/page/{name}")
    public Result<PageInfo<AddressInfoVo>> page(@PathVariable String name,
                                                @RequestParam(defaultValue = "1") Integer pageNum,
                                                @RequestParam(defaultValue = "5") Integer pageSize,
                                                HttpServletRequest request) {
        return Result.success(addressInfoService.findPage(name, pageNum, pageSize, request));
    }

    /**
    * ????????????excel????????????
    * @param file excel??????
    * @throws IOException
    */
    @PostMapping("/upload")
    public Result upload(MultipartFile file) throws IOException {

        List<AddressInfo> infoList = ExcelUtil.getReader(file.getInputStream()).readAll(AddressInfo.class);
        if (!CollectionUtil.isEmpty(infoList)) {
            // ?????????????????????
            List<AddressInfo> resultList = infoList.stream().filter(x -> ObjectUtil.isNotEmpty(x.getName())).collect(Collectors.toList());
            for (AddressInfo info : resultList) {
                addressInfoService.add(info);
            }
        }
        return Result.success();
    }

    @GetMapping("/getExcelModel")
    public void getExcelModel(HttpServletResponse response) throws IOException {
        // 1. ??????excel
        Map<String, Object> row = new LinkedHashMap<>();
		row.put("name", "");
		row.put("phone", "");
		row.put("man", "");

        List<Map<String, Object>> list = CollUtil.newArrayList(row);

        // 2. ???excel
        ExcelWriter writer = ExcelUtil.getWriter(true);
        writer.write(list, true);

        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        response.setHeader("Content-Disposition","attachment;filename=addressInfoModel.xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        writer.close();
        IoUtil.close(System.out);
    }
}
