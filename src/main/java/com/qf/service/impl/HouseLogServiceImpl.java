package com.qf.service.impl;

import com.qf.dao.HouseLogMapper;
import com.qf.domain.HouseLog;
import com.qf.service.HouseLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HouseLogServiceImpl implements HouseLogService {

    @Autowired(required = false)
    private HouseLogMapper houseLogMapper;

    @Override
    public HouseLog logincount(HouseLog houseLog) {
        return houseLogMapper.logincount(houseLog);
    }

    @Override
    public void registerUser(HouseLog houseLog) {
        houseLogMapper.registerUser(houseLog);
    }

    @Override
    public  List<HouseLog> selectLog(HouseLog houseLog) {
        return houseLogMapper.selectLog(houseLog);
    }

}
