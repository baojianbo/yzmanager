<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.user" %> 
<%@page import="com.yz.manager.bean.firstClass" %> 
<%@page import="com.yz.manager.dao.daoUtil" %>
<%@page import="java.util.*" %> 
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改一级分类名</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#E4FAF9"> 
<%
  user user=(user)session.getAttribute("us");
  if(user==null) response.sendRedirect("../index.jsp"); 
  firstClass fc=daoUtil.selectFirstClass4(Integer.valueOf(request.getParameter("fId").trim()).intValue());
  request.setAttribute("fc",fc); 
  String system=daoUtil.selectSystem2(Integer.valueOf(fc.getSystemName()).intValue()); 
  request.setAttribute("s",system);  
  String sdp=daoUtil.selectDepartment3(Integer.valueOf(fc.getDepartment()).intValue());
  request.setAttribute("sdp1",sdp);
  %>
 <h1 class="h1" align="center">修改一级分类名</h1>
 
 <s:form action="modifyDpFirstClassAction" method="post" theme="simple">
        <s:token></s:token>
       <table class="left-font01" align="center" border="0" cellspacing="0" cellpadding="0" >
           <tr >
             <td> 分类编号：</td>
             <td align="center"> <s:textfield name="id" value="%{#request.fc.id}"  readonly="true" size="30" ></s:textfield></td>
         </tr>
             <tr><td>&nbsp;</td></tr> 
          <tr >
             <td> 部门：</td>
             <td align="center"> <s:textfield name="department" value="%{#request.sdp1}" readonly="true" size="30" ></s:textfield></td>
         </tr>
           <tr><td>&nbsp;</td></tr> 
          <tr>
             <td> 系统：</td>
             <td align="center"> <s:textfield  name="system" value="%{#request.s}" readonly="true"  size="30"></s:textfield></td>
         </tr>
           <tr><td>&nbsp;</td></tr> 
           <tr>
             <td>新分类：</td>
             <td align="center"> <s:textfield name="firstCName"  size="30"></s:textfield></td>
         </tr>
               <tr><td>&nbsp;</td></tr>           
          <tr>
            <td align="right">
              
            </td>
            <td align="center">
              <s:submit name="submit" value="提 交"></s:submit>&nbsp;&nbsp;
              <s:reset name="reset" value="重 置"></s:reset>             
            <br></td>
          </tr>
       </table>
       
       
       </s:form>
           
</body>
</html>