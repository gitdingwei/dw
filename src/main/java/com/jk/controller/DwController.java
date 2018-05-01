package com.jk.controller;


import com.jk.model.Dw;
import com.jk.service.DwService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value="dw")
public class DwController {
    @Autowired
    private DwService dwservice;
    //查询
    @RequestMapping(value="querydw")
    @ResponseBody
    public List<Dw> querydw(){
   return dwservice.querydw();
    }
    //新增
    @RequestMapping(value="adddw")
    @ResponseBody
    public void adddw(Dw dw){
        dwservice.adddw(dw);
    }
    //删除
    @RequestMapping(value="deletedw")
    @ResponseBody
    public void deletedw(Integer dwid){
        dwservice.deletedw(dwid);
    }
    //回显
    @RequestMapping(value="queryhui")
    @ResponseBody
    public Dw queryhui(Integer dwid){
   return dwservice.queryhui(dwid);
    }
    //修改
    @RequestMapping(value="updatedw")
    @ResponseBody
    public void updatedw(Dw dw){
        dwservice.updatedw(dw);

    }
}
