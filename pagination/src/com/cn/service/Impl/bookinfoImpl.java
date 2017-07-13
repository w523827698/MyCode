package com.cn.service.Impl;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.dao.bookMapper;
import com.cn.entity.book;
import com.cn.service.bookinfo;

 @Service
public class bookinfoImpl implements bookinfo{
	 @Autowired
	bookMapper bookmapper;

	@Override
	public int bookNum() {
		int num = bookmapper.selectAllCount();
		return num;
	}

	@Override
	public List<book> selectBookList(Map param) {
		 for(Object obj : param.keySet()){
			 System.out.println(obj+"==========="+param.get(obj));
		 }
		
		List<book> list = new LinkedList<book>();
		list = bookmapper.selectBookList(param);
		return list;
	}
	
	
     
}
