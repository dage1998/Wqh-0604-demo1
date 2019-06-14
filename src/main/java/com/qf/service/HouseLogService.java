package com.qf.service;

import com.qf.domain.HouseLog;

import java.util.List;

public interface HouseLogService {

    HouseLog logincount(HouseLog houseLog);

    void registerUser(HouseLog houseLog);

    List<HouseLog> selectLog(HouseLog houseLog);
}
