<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.*" %>  
<%@page import="com.yz.manager.dao.*" %> 
<%@page import="java.util.*" %> 
<%@page import="com.yz.manager.custom.bean.*" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�ͻ�״̬����</title>
	<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#E4FAF9">
 <%
  user user=(user)session.getAttribute("us");
  if(user==null) response.sendRedirect("../index.jsp"); 
    
     List<customState> cm=daoUtil.selectCustomState();
  %>
       <table class="left-font01"  align="center" border="0" cellspacing="0" cellpadding="0" >
         <tr><td><a class="left-font01" href="addCustomState.jsp">���ӿͻ�״̬</a></td></tr>
       </table>
       
       <table class="left-font01" width="80%"  align="center" border="1" cellspacing="0" cellpadding="0" >
          <tr height="25" class="tableth" bgcolor="#8E8EFF">
          <th>�ͻ�״̬���</th><th>�ͻ�״̬</th><th>ɾ��</th><th>�޸�</th>
          </tr>
          <%
            for(customState c : cm){
            out.println(
              "<tr height='25'>"+
              "<td align='center'>"+c.getId()+"</td>"+
              "<td align='center'>"+c.getStateName()+"</td>"+
              "<td align='center'><a class='left-font01' href='deleteCustomState.action?Id="+c.getId()+"' >ɾ��</a></td>"+
              "<td align='center'><a class='left-font01' href='modifyCustomState.jsp?Id="+c.getId()+"' >�޸�</a></td>"+
              "</tr>");
            };                   
           %>
       </table>
      
</body>
</html>