<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.*" %>  
<%@page import="com.yz.manager.dao.*" %> 
<%@page import="com.yz.manager.date.*" %> 
<%@page import="com.yz.manager.personal.bean.*" %> 
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>��ϵ������</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#E4FAF9">
 <%
  user user=(user)session.getAttribute("us");
  if(user==null) response.sendRedirect("../index.jsp"); 
    String aId=(String)request.getParameter("aId");
    personal ps=personalDao.selectPersonal(aId); 

    request.setAttribute("p1",ps); 
    String fc=daoUtil.selectFirstClass5(Integer.valueOf(ps.getFirstCName()).intValue());
    String sc=daoUtil.selectSecondClass8(ps.getSecondCName());     
    String gd=daoUtil.selectDepartment3(Integer.valueOf(ps.getDepartment()).intValue());
    String sname=daoUtil.selectUser(ps.getUserName().trim());
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
              <td align="center" width="15%">��ϵ��</td><td width="35%">&nbsp;<%= ps.getContactName() %></td><td align="center" width="15%">����</td><td width="35%">&nbsp;<%= fc%>--<%= sc%></td>
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
              <td align="center">��Ӳ���</td><td>&nbsp;<%= gd%></td>
          </tr>
           <tr height="25">
             <td align="center">�����</td><td>&nbsp;<%= sname %></td>
              <td align="center">�������</td><td>&nbsp;<%= CurrentDate.parseDate4(ps.getRegisterDate().toString()) %></td>
         </tr>
          <tr height="25">
              <td   align="center">��ע</td><td colspan="3">&nbsp;<%= ps.getRemarks() %></td>   
          </tr>
       </table>
 
</body>
</html>