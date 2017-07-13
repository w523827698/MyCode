package com.cn.common;

import java.io.Serializable;
import java.util.List;

public class PageBean implements Serializable {
	private Integer count = 0;
	private Integer pageNo = 1;//当前页
	private Integer pageSize = 10;//每页行数
	private List data;
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public void getPageSize() {
		if(pageSize==null){
			return;
		}
		this.pageSize = pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public List getData() {
		return data;
	}
	public void setData(List data) {
		this.data = data;
	}
	
	
	
	
	
}
