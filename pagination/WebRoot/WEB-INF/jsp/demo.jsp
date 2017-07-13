<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="/tag/jstl/fn" prefix="fn" %>
<%@ taglib uri="/tag/jstl/core" prefix="c"%>
<%@ taglib uri="/tag/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<%@ taglib uri="/tag/jstl/fn" prefix="fn" %>
	<%@ taglib uri="/tag/jstl/core" prefix="c"%>
	<%@ taglib uri="/tag/jstl/fmt" prefix="fmt"%>
	<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
    <base href="<%=basePath%>">
    <style type="text/css">
    div#containers{width:100%}
    div#model1 { height:10px; width:30%; float:left;}
    div#model2 { height:10px; width:30%; float:left;}
    
    div#pagin_btm2{width:100%}
    div#page_num { height:10px; width:30%; float:left;}
    div#page_skip { height:10px; width:30%; float:left;}
    
   </style>
   <link rel="stylesheet" type="text/css" href="css/common.css" />
   <script type="text/javascript" src="js/jquery-easyui/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="js/jquery-easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="js/jquery-easyui/themes/icon.css">
    <script type="text/javascript" src="js/jquery-easyui/jquery.easyui.min.js"></script>  
    <script type="text/javascript" src="js/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="js/commons.js"></script>
  
   <script type="text/javascript">
   $(function(){
       $("#model").bind('click',function(){
    	   $("#myform").attr("action","book/book.do");
   		    $("#myform").submit();
       });
   });
   function submitReportForm(){
		$("#myform").attr("action","book/book.do");
		$("#myform").submit();
	}
 function gotoPageForm(pageNo) {
		$("#pageNo").val(pageNo);
		submitReportForm();
	}
 function jumpToForm(pageCount) {
		var pageNo = $("#jumpPage").val();
		pageNo = pageNo.replace(/[^0-9]*/g, "");
		if (pageNo < 1) {
			pageNo = 1;
		}
		if (parseInt(pageNo)>parseInt(pageCount)) {
			pageNo = pageCount;
		}
		$("#pageNo").val(pageNo);
		submitReportForm();
	}
   
   </script>

  </head>
  
  <body>
  
   <form id="myform" method="post" action="">
	
				<div class="Current-page">
					<h1>书籍信息表</h1>					
				</div>
	
					 <div id="containers"  border="false" style="text-align:right;padding:5px 0;">
						<div id="model1" >
						<span>作者：</span> <input name="author" type="text" "/>
						</div>							
						<div id="model2">
						<span>价格：</span> <input name="priceBegin" type="text" "/>-
						                  <input name="priceAfter" type="text" "/>
						                  <a href="javascript:submitReportForm();">搜索</a>
						             <input id="model" value="搜索" type="button">
						</div>		
					</div>
               <!-- 书籍信息开始 -->
               <br>
               <input type="hidden" id="pageNo" name="pageNo" />
               
       </form>
   <fieldset id="productCheckList"  style="border-width:0px; border-color: #008000; width:1300px; height:200px" >  
                 <table border="0" align="center" cellpadding="2" cellspacing="0" id="booInfo_table" > 
                 <thead>
                  <tr bgcolor="#E6E6E6">
                  <td align="center" bgcolor="#EEEEEE">1</td>
		          <td align="center" bgcolor="#EEEEEE"></td>
				 
                    <td align="left" bgcolor="#EEEEEE" style="width:100px;">
                                                                                          是否可用
                   </td>
                   <td align="left" bgcolor="#EEEEEE" style="width:100px;">
                                                                        作者
                   </td>
                   <td align="left" bgcolor="#EEEEEE" style="width:100px;">
                                                                                   价格
                    </td>
                    <td align="left" bgcolor="#EEEEEE" style="width:100px;">
                                                                                        库存
                    </td>
                  </tr>
                 </thead>
                 <tbody>
                  <c:if test="${fn:length(BookList) > 0 }">
                  <c:forEach items="${BookList }" var="poVal" varStatus="stuts">
                    <tr>
                    <td   align="center"><span class="numberClass"></span></td>
                    <td align="center"><input style="width:15px;"   type="checkbox" name="id" value="${poVal.bookid}" /></td>
                     <td align="left">
                       <input name="author" maxlength="32" 
					  		type="text" class="inputxt"  style="width:50px;" value="${poVal.author}" >
                     </td>
                     <td align="left">
                       <input name="price" maxlength="32" 
					  		type="text" class="inputxt"  style="width:100px;" value="${poVal.price}" >
                     </td>
                     <td align="left">
                       <input name="stock" maxlength="32" 
					  		type="text" class="inputxt"  style="width:100px;" value="${poVal.stock}" >
                     </td>
                    </tr>
                  </c:forEach>
                  </c:if>          
                 </tbody>
                </table>        
     </fieldset> 		
					<div id="pagin_btm2" class="commonFont1">
					<div id="page_num">
						<c:choose>
							<c:when test="${pageInfo.pageNo<=1 }">
								<div class="prew2">
									<a> &lt;上一页</a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="prew">
									<a href="javascript:gotoPageForm(${pageInfo.pageNo-1 })">
										&lt;上一页 </a>
								</div>
							</c:otherwise>
						</c:choose>
						<c:if test="${pageInfo.pageNo-3>0}">
							<a>. . .</a>
						</c:if>
						<c:if test="${pageInfo.pageNo-2>0}">
							<a href="javascript:gotoPageForm(${pageInfo.pageNo-2})">
								${pageInfo.pageNo-2} </a>
						</c:if>
						<c:if test="${pageInfo.pageNo-1>0}">
							<a href="javascript:gotoPageForm(${pageInfo.pageNo-1})">
								${pageInfo.pageNo-1} </a>
						</c:if>
						<a class="current"> ${pageInfo.pageNo} </a>
						<c:if test="${pageInfo.pageNo+1<=pageCount}">
							<a href="javascript:gotoPageForm(${pageInfo.pageNo+1})">
								${pageInfo.pageNo+1} </a>
						</c:if>
						<c:if test="${pageInfo.pageNo+2<=pageCount}">
							<a href="javascript:gotoPageForm(${pageInfo.pageNo+2})">
								${pageInfo.pageNo+2} </a>
						</c:if>
						<c:if test="${pageInfo.pageNo+3<=pageCount}">
							<a>. . .</a>
						</c:if>
						<c:choose>
							<c:when test="${pageInfo.pageNo>=pageCount }">
								<div class="next2">
									<a> 下一页&gt;</a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="next">
									<a href="javascript:gotoPageForm(${pageInfo.pageNo+1})">
										下一页&gt;</a>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="page_skip">
						<span>共${pageCount }页&nbsp;&nbsp;到第 
						<input class="jumpto" style="width:20px" name="jumpPage" id="jumpPage"
							value="${pageInfo.pageNo }" type="text" />页
						</span><a href="javascript:void(0)" class="btn_skipsearch"  onclick="jumpToForm(${pageCount })">确定</a>
					</div>
				</div>
			</div>
		</div>
			
			
		
  </body>
</html>
