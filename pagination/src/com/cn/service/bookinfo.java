package com.cn.service;

import java.util.List;
import java.util.Map;

import com.cn.entity.book;

public interface bookinfo {
     int bookNum();
     List<book> selectBookList(Map param);
}
