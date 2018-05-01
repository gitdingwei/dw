package com.jk.service;

import com.jk.dao.DwDao;
import com.jk.model.Dw;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DwService {
    @Autowired
    private DwDao dwdao;
    public List<Dw>querydw(){
        List<Dw> list=dwdao.querydw();
      return list;
    }
    public void adddw(Dw dw){
        dwdao.adddw(dw);
    }
    public void deletedw(Integer dwid){
        dwdao.deletedw(dwid);
    }
    public Dw queryhui(Integer dwid){
     return dwdao.queryhui(dwid);
    }
    public void updatedw(Dw dw){
        dwdao.updatedw(dw);
    }
}
