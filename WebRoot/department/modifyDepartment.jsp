<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.user" %> 

<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�޸Ĳ���</title>
	<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#E4FAF9">
<%
  user user=(user)session.getAttribute("us");
  if(user==null) response.sendRedirect("../index.jsp"); 
  request.setAttribute("dpId",request.getParameter("dpId"));
  %>
 <h1 align="center" class="h1">�޸Ĳ�������</h1>

    <s:form action="modifyDepartment" method="post" theme="simple">
        <s:token></s:token>
       <table class="left-font01" align="center" border="0" cellspacing="0" cellpadding="0" >
          <tr >
             <td class="left-font01"> ���ű�ţ�</td>
             <td align="center"> <s:textfield name="departmentId" value="%{#request.dpId}"  readonly="true" size="30" ></s:textfield></td>
         </tr>
          <tr><td>&nbsp;</td></tr>   
          <tr >
             <td class="left-font01"> �²�������</td>
             <td align="center"> <s:textfield name="department"  size="30" ></s:textfield></td>
         </tr>
       <tr><td>&nbsp;</td></tr>   
          <tr>
            <td align="right">
              
            </td>
            <td align="center">
              <s:submit name="submit" value="�� ��"></s:submit>
              <s:reset name="reset" value="�� ��"></s:reset>             
            </td>
          </tr>
       </table>
       
       
       </s:form>
           
     
</body>
</html>