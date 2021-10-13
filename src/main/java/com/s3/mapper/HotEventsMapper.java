package com.s3.mapper;

import com.s3.pojo.HotEvents;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface HotEventsMapper {
    // 根据关键字查询
    int getCount(@Param("keyWord") String keyWord);
    List<HotEvents> get4Page(@Param("keyWord") String keyWord,
                             @Param("from") Integer from,
                             @Param("pageSize") Integer pageSize);
}
