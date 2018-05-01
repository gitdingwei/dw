package com.jk.dao;

import com.jk.model.Dw;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DwDao {
    List<Dw> querydw();

    void adddw(Dw dw);

    void deletedw(Integer dwid);

    Dw queryhui(Integer dwid);

    void updatedw(Dw dw);
}
