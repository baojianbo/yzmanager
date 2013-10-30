<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.*" %>  
<%@page import="com.yz.manager.dao.*" %> 
<%@page import="com.yz.manager.date.*" %> 
<%@page import="com.yz.manager.expense.bean.*" %> 
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>��������</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#E4FAF9">
 <%
  user user=(user)session.getAttribute("us");
  if(user==null) response.sendRedirect("../index.jsp"); 
    String aId=(String)request.getParameter("aId");
    expense ps=expenseDao.selectExpense(aId); 

    request.setAttribute("p1",ps); 
    String fc=daoUtil.selectFirstClass5(Integer.valueOf(ps.getFirstCName()).intValue());
    String sc=daoUtil.selectSecondClass8(ps.getSecondCName());     
    String gd=daoUtil.selectDepartment3(Integer.valueOf(ps.getDepartment()).intValue());
    String sname=daoUtil.selectUser(ps.getUserName().trim());
    String everifyName=daoUtil.selectUser(ps.getEverifyName().trim());
    String cm=daoUtil.selectGCompanyName(Integer.valueOf(ps.getCompany()).intValue());
    String pm=daoUtil.selectPayModeName(Integer.valueOf(ps.getPayMode()).intValue());
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
              <td width="15%"align="center">����</td><td width="35%">&nbsp;<%= CurrentDate.parseDate4(ps.getAddDate().toString()) %></td><td align="center" width="15%">���ò���</td><td width="35%">&nbsp;<%= gd%></td>
          </tr>
           <tr height="25">
              <td align="center">������</td><td>&nbsp;<%= sname %></td><td align="center">��������</td><td>&nbsp;<%= ps.getNature()%></td>
          </tr>
          <tr height="25">
              <td align="center">����</td><td>&nbsp;<%= fc%>--<%= sc%></td><td align="center">����</td><td>&nbsp;<%= ps.getContent()%></td>
          </tr>
            <tr height="25">
              <td align="center">��Ӧ��</td><td>&nbsp;<%= ps.getSupplier() %></td><td align="center">��Ӧ�̵�ַ</td><td>&nbsp;<%= ps.getSupplierAddress()%></td>
          </tr>
           <tr height="25">
              <td align="center">��ϵ��</td><td>&nbsp;<%= ps.getContactName()%></td><td align="center">��ϵ�绰</td><td>&nbsp;<%= ps.getContactPhone()%></td>
          </tr>
            <tr height="25">
              <td align="center">����</td><td>&nbsp;<%= ps.getUnitPrice() %></td><td align="center">����</td><td>&nbsp;<%= ps.getNumber() %>&nbsp;<%= ps.getUnit()%></td>
          </tr>
          <tr height="25">
              <td align="center">�ܼ�</td><td>&nbsp;<%= ps.getTotalPrice()%></td>
              <td align="center">���˹�˾</td><td>&nbsp;<%= cm %></td>
          </tr>
          <tr height="25">
              <td align="center">���ʽ</td><td>&nbsp;<%= pm %></td>
              <td align="center">�����</td><td>&nbsp;<%= everifyName%></td>
          </tr>    
          <tr height="25">
               <td align="center">���״̬</td>
               <% 
              if(0==ps.getEverify()){
		       out.println(													
					"<td >&nbsp;δ���</td>");
		     }else if(1==ps.getEverify()){
		         out.println(													
						"<td >&nbsp;���ͨ��</td>");
		     }else{
		         out.println(													
						"<td >&nbsp;���û��ͨ��</td>");
		     }
             %>  
              <td align="center">��ע</td><td colspan="3">&nbsp;<%= ps.getRemarks() %></td>   
          </tr>
       </table>
 
</body>
</html>