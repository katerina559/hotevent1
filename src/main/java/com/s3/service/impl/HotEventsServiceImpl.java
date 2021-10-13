package com.s3.service.impl;

import com.s3.mapper.HotEventsMapper;
import com.s3.pojo.HotEvents;
import com.s3.service.HotEventsService;
import com.s3.util.PageUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class HotEventsServiceImpl implements HotEventsService {

    @Resource
    HotEventsMapper hotEventsMapper;

    @Override
    public PageUtil<HotEvents> get4Page(String keyWord, Integer pageIndex, Integer pageSize) {
        PageUtil<HotEvents> page = new PageUtil<>();
        page.setPageIndex(pageIndex);
        page.setPageSize(pageSize);
        page.setTotalCount(hotEventsMapper.getCount(keyWord));
        page.setList(hotEventsMapper.get4Page(keyWord,(pageIndex-1)*pageSize,pageSize));
        return page;
    }
}
