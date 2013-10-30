<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.*" %>  
<%@page import="com.yz.manager.dao.*" %> 
<%@page import="java.util.*" %> 
<%@page import="com.yz.manager.storehouse.bean.*" %> 
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>库房管理员管理</title>
	<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#E4FAF9">
 <%
  user user=(user)session.getAttribute("us");
  if(user==null) response.sendRedirect("../index.jsp"); 
    List<houseManager> hm=new ArrayList<houseManager>();
    hm=daoUtil.selectHouseManager();
  %>
       <table class="left-font01"  align="center" border="0" cellspacing="0" cellpadding="0" >
         <tr><td><a class="left-font01" href="addhouseManager.jsp">增加库房管理员</a></td></tr>
       </table>
       
       <table class="left-font01" width="80%"  align="center" border="1" cellspacing="0" cellpadding="0" >
          <tr height="25" class="tableth" bgcolor="#8E8EFF">
          <th>库房编号</th><th>归属部门</th><th>库房名称</th><th>管理员</th><th>删除</th><th>修改</th>
          </tr>
          <%
            for(houseManager s : hm){
            out.println(
              "<tr height='25'>"+
              "<td align='center'>"+s.getHouseId()+"</td>"+
              "<td align='center'>"+daoUtil.selectDepartment3(Integer.valueOf(s.getDepartment()).intValue())+"</td>"+
              "<td align='center'>&nbsp;"+daoUtil.selectShouseName(Integer.valueOf(s.getHouseId()).intValue())+"</td>"+
              "<td align='center'>&nbsp;"+daoUtil.selectUser(s.getManagerName().trim())+"</td>"+
              "<td align='center'><a class='left-font01' href='deletehouseManagerAction.action?mId="+s.getId()+"' >删除</a></td>"+
              "<td align='center'><a class='left-font01' href='modifyHouseManager.jsp?Id="+s.getId()+"' >修改</a></td>"+
              "</tr>");
            };                   
           %>
       </table>
      
</body>
</html>