package com.s3.service;

import com.s3.pojo.HotEvents;
import com.s3.util.PageUtil;

public interface HotEventsService {
    PageUtil<HotEvents> get4Page(String keyWord,Integer pageIndex,Integer pageSize);
}
