<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.*" %>  
<%@page import="com.yz.manager.dao.*" %> 
<%@page import="com.yz.manager.date.*" %> 
<%@page import="com.yz.manager.custom.bean.*" %> 
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�ͻ���Ϣ����</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#E4FAF9">
 <%
  user user=(user)session.getAttribute("us");
  if(user==null) response.sendRedirect("../index.jsp"); 
    String aId=(String)request.getParameter("aId");
    custom ps=customDao.selectCustom(aId); 

    request.setAttribute("p1",ps); 
              String dp=daoUtil.selectDepartment3(Integer.valueOf(ps.getDepartment()).intValue());
              String sname=daoUtil.selectUser(ps.getUserName().trim());
              String ct=daoUtil.selectCustomTypeName(Integer.valueOf(ps.getCustomType()).intValue());
              String cstate=daoUtil.selectCustomStateName(Integer.valueOf(ps.getCustomState()).intValue());
              String an=daoUtil.selectCustomAreaName(Integer.valueOf(ps.getAreaName()).intValue());
  %>
       <table class="left-font01" align="center">
       <tr><td>&nbsp;</td></tr>
       <tr><td>&nbsp;</td></tr>
       <tr><td>&nbsp;</td></tr>
        <tr><td><a class="left-font01" href='javascript:history.go(-1);'>����</a></td></tr>
            <tr><td>&nbsp;</td></tr>
       </table>
       <table class="left-font01" width="80%"  align="center" border="1" cellspacing="0" cellpadding="0" >
           <tr height="25">
              <td align="center" width="15%">�ͻ�����</td><td width="35%">&nbsp;<%= an %></td><td align="center" width="15%">�ͻ�����</td><td width="35%">&nbsp;<%= ct%></td>
          </tr>
           <tr height="25">
              <td align="center" width="15%">�ͻ�״̬</td><td width="35%">&nbsp;<%= cstate %></td> <td align="center" width="15%">��ϵ��</td><td width="35%">&nbsp;<%= ps.getContactName() %></td>
          </tr>
         
            <tr height="25">
              <td align="center">��λ����</td><td>&nbsp;<%= ps.getCompanyName() %></td><td align="center">��λ��ַ</td><td>&nbsp;<%= ps.getCompanyAddress()%></td>
          </tr>
           <tr height="25">
              <td align="center">�ʱ��ַ</td><td>&nbsp;<%= ps.getZipCode()%></td><td align="center">ְλ</td><td>&nbsp;<%= ps.getPost()%></td>
          </tr>
            <tr height="25">
              <td align="center">�ֻ�����</td><td>&nbsp;<%= ps.getMobilePhone() %></td><td align="center">��������</td><td>&nbsp;<%= ps.getWorkPhone() %></td>
          </tr>
          <tr height="25">
              <td align="center">����</td><td>&nbsp;<%= ps.getFax()%></td>
              <td align="center">��������</td><td>&nbsp;<%= ps.getMail() %></td>
          </tr>
          <tr height="25">
              <td align="center">QQ����</td><td>&nbsp;<%= ps.getQq() %></td>
              <td align="center">��Ӳ���</td><td>&nbsp;<%= dp%></td>
          </tr>
           <tr height="25">
             <td align="center">�����</td><td>&nbsp;<%= sname %></td>
              <td align="center">�������</td><td>&nbsp;<%= CurrentDate.parseDate4(ps.getAddDate().toString()) %></td>
         </tr>
          <tr height="25">
              <td   align="center">�ͻ���ע</td><td colspan="3">&nbsp;<%= ps.getRemarks() %></td>   
          </tr>
       </table>
 
</body>
</html>