<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.manager" %> 
<%@page import="com.yz.manager.bean.user" %> 
<%@page import="com.yz.manager.dao.daoUtil" %>

<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�޸Ĺ���Ա��Ϣ</title>
</head>
<body>
<%
  user user=(user)session.getAttribute("us");
  if(user==null) response.sendRedirect("../index.jsp"); 
  manager m3=daoUtil.selectManager(Integer.valueOf(request.getParameter("mId").trim()).intValue());
  request.setAttribute("m3",m3);
  String depart=daoUtil.selectDepartment3(Integer.valueOf(m3.getDepartment()).intValue());
  request.setAttribute("depart",depart);
  %>
 <h1 align="center">�޸Ĺ���Ա��Ϣ</h1>
 
 <s:form action="modifyManager" method="post" theme="simple">
        <s:token></s:token>
       <table  align="center" border="1" cellspacing="0" cellpadding="0" >
           <tr >
             <td> ����Ա��ţ�</td>
             <td align="center"> <s:textfield name="managerId" value="%{#request.m3.id}"  readonly="true" size="30" ></s:textfield></td>
         </tr>
                
          <tr >
             <td> �û�����</td>
             <td align="center"> <s:textfield name="userName" value="%{#request.m3.userName}" readonly="true" size="30" ></s:textfield></td>
        
          <tr>
             <td> ��  �ţ�</td>
              <td align="center"> <s:textfield name="department" value="%{#request.depart}" readonly="true" size="30" ></s:textfield></td>
         </tr>
         
        <tr>
            <td>���Ź���Ա��</td>
           <td align="center">
						<input type="checkbox" name="departmentManager" value="true" />
					</td>          
         </tr>                        
           <tr>
            <td>ϵͳ����Ա��</td>
           <td align="center">
						<input type="checkbox" name="systemManager" value="true" />
					</td>          
         </tr> 
          <tr>
            <td align="right">
              
            </td>
            <td align="center">
              <s:submit name="submit" value="�� ��"></s:submit>
              <s:reset name="reset" value="�� ��"></s:reset>             
            <br></td>
          </tr>
       </table>
       
       
       </s:form>
           
</body>
</html>