<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.*" %>  
<%@page import="com.yz.manager.dao.*" %> 
<%@page import="com.yz.manager.date.*" %> 
<%@page import="com.yz.manager.archives.bean.*" %> 
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>������ѯ</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#E4FAF9">
 <%
  user user=(user)session.getAttribute("us");
  if(user==null) response.sendRedirect("../index.jsp"); 
    String aId=(String)request.getParameter("aId");
    archives ar=archivesDao.selectArchives1(aId); 
    String averify=String.valueOf(ar.getAverify());  
    if("0".equals(averify))averify="δ���";
    else if("1".equals(averify))averify="���ͨ��";
    else if("2".equals(averify))averify="���δͨ��";
     request.setAttribute("ar",ar); 
    String fc=daoUtil.selectFirstClass5(Integer.valueOf(ar.getFirstCName()).intValue());
    String sc=daoUtil.selectSecondClass8(ar.getSecondCName());     
    String gd=daoUtil.selectDepartment3(Integer.valueOf(ar.getDepartment()).intValue());
    String sd=daoUtil.selectDepartment3(Integer.valueOf(ar.getSaveArDepartment()).intValue());
    String sname=daoUtil.selectUser(ar.getSaveArName().trim());
    String date="��δ�浵";
    if(ar.getSaveArDate()!=null)date= CurrentDate.parseDate1(ar.getSaveArDate().toString());
  %>
       <table class="left-font01" align="center">
        <tr><td><a class="left-font01" href='javascript:history.go(-1);'>����</a></td></tr>
       </table>
       <table class="left-font01" width="80%"  align="center" border="1" cellspacing="0" cellpadding="0" >
          <tr height="25">
              <td align="center" width="15%">�ļ�����</td><td width="35%"><%= ar.getFileName() %></td><td align="center" width="15%">����</td><td width="35%"><%= fc%>--<%= sc%></td>
          </tr>
            <tr height="25">
              <td align="center">�������</td><td><%= ar.getFileNumber() %></td><td align="center">ҳ��</td><td><%= ar.getFilePages() %></td>
          </tr>
            <tr height="25">
              <td align="center">����</td><td>&nbsp;<%= ar.getFileCoverNumber() %></td><td align="center">��������</td><td>&nbsp;<%= ar.getSaveYears() %></td>
          </tr>
            <tr height="25">
              <td align="center"> ��������</td><td><%= gd %></td><td align="center">������</td><td><%= ar.getGiveArName() %></td>
          </tr>
            <tr height="25">
              <td align="center">�浵����</td><td><%= sd %></td><td align="center">�浵��</td><td><%= sname %></td>
          </tr>
           <tr height="25">
              <td align="center">��������</td><td><%= CurrentDate.parseDate1(ar.getArDate().toString()) %></td><td align="center">�浵����</td><td><%=  date%></td>
          </tr>
           <tr height="25">
           <td align="center">�ļ�����</td>
           <%
             if(ar.getFileDir()==null){
                 out.println(
		              "<td>�޵��ӵ��ļ�</td>" 
		             ); 
             }else{
                 out.println(
		              "<td><a class='left-font01' href='"+ ar.getFileDir()+"' >���ز���</a></td>" 
		              );
             }
            %> 
              <td align="center">���״̬</td><td ><%= averify%></td>          
          </tr> 
           <tr height="25">
        <td align="center">������ע</td><td ><%= ar.getRemarks()%></td> <td align="center">������</td><td>&nbsp;<%= ar.getSaveArRemarks() %></td>
          </tr>             
        
       </table>
 
</body>
</html>