package com.cn.dao;

import java.util.List;
import java.util.Map;

import com.cn.entity.book;

public interface bookMapper {
   
	  int selectAllCount();
	  List<book> selectBookList(Map param);

}
