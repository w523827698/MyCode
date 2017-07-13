package com.cn.controller;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cn.common.PageBean;
import com.cn.entity.book;
import com.cn.service.bookinfo;

@Controller
@RequestMapping("/book")
public class bookController {
	@Autowired
	bookinfo bookService ;
	@RequestMapping("/hello.do")
	public ModelAndView execute( HttpServletRequest req){
		ModelAndView av = new ModelAndView("index");
		av.getModel().put("msg", "你好");//ModelAndView 中有一个Map，可以携带自定义的参数，然后有机制就会在前台编译
		req.setAttribute("mm", "ceshi");
		int num = bookService.bookNum();
		req.setAttribute("num", num);
		//req.getSession().setAttribute("mm", "ceshi");
		return av;
	}
	
	@RequestMapping("/demo.do")
	public ModelAndView demo( HttpServletRequest req){
		ModelAndView av = new ModelAndView("demo");

		return av;
	}
	@RequestMapping("/book.do")
	public ModelAndView book( HttpServletRequest req,
			@RequestParam(value = "author", defaultValue = "")String author ,
			@RequestParam(value = "priceBegin", defaultValue = "")String priceBegin ,
			@RequestParam(value = "priceAfter", defaultValue = "")String priceAfter 
			
			){
		 //组件封装数据的对象
			PageBean pageBean = new PageBean();
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("author",author);
		param.put("priceBegin",priceBegin);
		param.put("priceAfter",priceAfter);
			int pageSize = 5;
			int limitStart;
			int limitOffset;
			if(req.getParameter("pageNo") != null && req.getParameter("pageNo") != ""){
				limitStart = (Integer.parseInt(req.getParameter("pageNo"))-1)*pageSize;
				limitOffset = Integer.parseInt(req.getParameter("pageNo"))*pageSize;
				 pageBean.setPageNo(Integer.parseInt(req.getParameter("pageNo")));
			}else{
				 pageBean.setPageNo(1);
				limitStart = 0;
				limitOffset = 5;
			}
			int pageCount = bookService.bookNum();//总数据的条数
			
			if (pageCount % pageSize == 0){
				pageCount = (pageCount / pageSize);
			}else{
				pageCount = (pageCount / pageSize + 1);
			}
			param.put("limitStart", limitStart);
			param.put("limitOffset", limitOffset);
		List<book> list = new LinkedList<book>();
		list = bookService.selectBookList(param);		

	
		   
			pageBean.setPageSize(10);
			pageBean.setData(list);
			pageBean.setCount(bookService.bookNum());//总条数

		ModelAndView av = new ModelAndView("demo");
		req.setAttribute("pageCount",pageCount);
		req.setAttribute("pageInfo", pageBean);
		req.setAttribute("BookList", list);
		System.out.println("---------"+list.size());
		return av;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
