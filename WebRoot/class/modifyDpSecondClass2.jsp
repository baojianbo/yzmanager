<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.user" %> 
<%@page import="com.yz.manager.bean.secondClass" %> 
<%@page import="com.yz.manager.dao.daoUtil" %>
<%@page import="java.util.*" %> 
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�޶���������</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#E4FAF9"> 
<%
  user user=(user)session.getAttribute("us");
  if(user==null) response.sendRedirect("../index.jsp"); 
  secondClass fc=daoUtil.selectSecondClass3(Integer.valueOf(request.getParameter("sId").trim()).intValue());
  request.setAttribute("fc",fc); 
  String system=daoUtil.selectSystem2(Integer.valueOf(fc.getSystemName()).intValue()); 
  request.setAttribute("s",system);  
  String fcn=daoUtil.selectFirstClass5(Integer.valueOf(fc.getFirstCName()).intValue());
  request.setAttribute("fcn",fcn);
  %>
 <h1 class="h1" align="center">�޸Ķ���������</h1>
 
 <s:form action="modifyDpSecondClassAction2" method="post" theme="simple">
        <s:token></s:token>
       <table  class="left-font01" align="center" border="0" cellspacing="0" cellpadding="0" >
          <tr>    
             <td > <s:hidden name="department" value="%{#session.us.department}"></s:hidden></td>
         </tr> 
           <tr >
             <td> �����ţ�</td>
             <td align="center"> <s:textfield name="id" value="%{#request.fc.id}"  readonly="true" size="30" ></s:textfield></td>
         </tr>   
          <tr><td>&nbsp;</td></tr>  
          <tr>
             <td> ϵͳ��</td>
             <td align="center"> <s:textfield  name="system" value="%{#request.s}" readonly="true"  size="30"></s:textfield></td>
         </tr>
          <tr><td>&nbsp;</td></tr> 
         <tr>
            <td> һ�����ࣺ</td>
             <td align="center"> <s:textfield  name="firstCName" value="%{#request.fcn}" readonly="true"  size="30"></s:textfield></td>
         </tr>
          <tr><td>&nbsp;</td></tr> 
           <tr>
             <td>�·��ࣺ</td>
             <td align="center"> <s:textfield name="secondCName"  size="30"></s:textfield></td>
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