<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.user" %> 
<%@page import="com.yz.manager.custom.bean.*" %> 
<%@page import="com.yz.manager.dao.daoUtil" %>
<%@page import="java.util.*" %> 
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�޸�����</title>
	<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#E4FAF9">
<%
  user user=(user)session.getAttribute("us");
  if(user==null) response.sendRedirect("../index.jsp"); 
   HashMap<String,String> department=new LinkedHashMap<String,String>();
	   department=( HashMap<String,String>)daoUtil.selectDepartment();
	   request.setAttribute("department",department);
   customArea g=new customArea();
  if(null==request.getAttribute("c")){
     g=daoUtil.selectCustomArea(Integer.valueOf(request.getParameter("cId").trim()).intValue());
     request.setAttribute("g",g); 
  }else request.setAttribute("g",(customArea)request.getAttribute("c"));
  %>
 <h1 align="center" class="h1">�޸�����</h1>

    <s:form action="modifyCustomArea" method="post" theme="simple">
        <table class="left-font01" align="center" border="0" cellspacing="0" cellpadding="0" >
           <tr >
             <td> �����ţ�</td>
             <td align="center"> <s:textfield name="id" value="%{#request.g.id}"  readonly="true" size="30" ></s:textfield></td>
         </tr> 
         <tr><td>&nbsp;</td></tr>
           <tr >
             <td> ԭ��������</td>
             <td align="center"> <s:textfield  value="%{#request.g.areaName}"  readonly="true" size="30" ></s:textfield></td>
         </tr>  
         <tr><td>&nbsp;</td></tr>    
           <tr>
             <td>����������</td>
             <td align="center"> <s:textfield name="areaName"  size="30"></s:textfield></td>
            <td class="actionmessage">
              <s:fielderror>
                 <s:param>nullareaName</s:param>
              </s:fielderror>
            </td>
         </tr>
          <tr><td>&nbsp;</td></tr>         
           <tr>
          <td> �������ţ�</td>
         <td > <s:select style="width: 150px; height:24px" name="department" list="#request.department"   listKey="key" listValue="value" ></s:select></td>
         </tr>
          <tr><td>&nbsp;</td></tr>
              
          <tr>
            <td align="right">
              
            </td>
            <td align="center">
              <s:submit name="submit" value="�� ��"></s:submit>&nbsp;&nbsp;
              <s:reset name="reset" value="�� ��"></s:reset>             
            <br></td>
          </tr>
       </table>
       
       
       </s:form>
           
     
</body>
</html>