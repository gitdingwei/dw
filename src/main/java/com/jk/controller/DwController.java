package com.jk.controller;


import com.jk.model.Dw;
import com.jk.service.DwService;
import net.minidev.json.JSONObject;
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
    public String querydw(){
        List list =dwservice.querydw();
        JSONObject obj=new JSONObject();
//前台通过key值获得对应的value值
        obj.put("code", 0);
        obj.put("msg", "");
        obj.put("count",1000);
        obj.put("data",list);

        return obj.toString();
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
