package com.qf.dao;

import com.qf.domain.HouseLog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface HouseLogMapper {

        @Select("select * from house_log where IDnumber =#{IDnumber}")
        HouseLog logincount(HouseLog houseLog);

        @Insert("insert into house_log (IDnumber,password,username)values(#{IDnumber},#{password},#{username})")
        void registerUser(HouseLog houseLog);

      List<HouseLog> selectLog(HouseLog houseLog);
}
