<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.*" %>  
<%@page import="com.yz.manager.dao.*" %> 
<%@page import="com.yz.manager.date.*" %> 
<%@page import="com.yz.manager.storehouse.bean.*" %> 
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>��������</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#E4FAF9">
 <%
  user user=(user)session.getAttribute("us");
  if(user==null) response.sendRedirect("../index.jsp"); 
    storeHouse ps=new storeHouse();
    String aId=(String)request.getParameter("aId");
    
    if(aId!=null){
    ps=storeHouseDao.selectHouse(aId); 
    }
    else {
    String said=(String)request.getAttribute("said");
    if(said!=null) ps=storeHouseDao.selectHouse(said); 
    }
    request.setAttribute("ps",ps); 
    String shn=daoUtil.selectShouseName(Integer.valueOf(ps.getHouseId()).intValue());
    String fc=daoUtil.selectFirstClass5(Integer.valueOf(ps.getFirstCName()).intValue());
    String sc=daoUtil.selectSecondClass8(ps.getSecondCName());     
    String gd=daoUtil.selectDepartment3(Integer.valueOf(ps.getDepartment()).intValue());
    String sname=daoUtil.selectUser(ps.getUserName().trim());
    String vname=daoUtil.selectUser(ps.getInVerifyName().trim());
    String status;
    if(ps.getInVerify()==0)status="δ���";
       else if(ps.getInVerify()==1)status="���ͨ��";
            else status="���δͨ��";
  %>
     <s:form action="verifyStoreAction" method="post" theme="simple">
       <table class="actionmessage" align="center" >
           <tr><td>&nbsp; <s:actionmessage/></td></tr>
      
       </table>
       <table class="left-font01" width="80%"  align="center" border="1" cellspacing="0" cellpadding="0" >
               <s:hidden name="id" value="%{#request.ps.id}" ></s:hidden>
          <tr height="25">
              <td align="center" width="15%">����</td><td width="35%"><%= CurrentDate.parseDate4(ps.getInDate().toString()) %></td><td width="15%" align="center">����</td><td width="35%"><%= gd%></td>
          </tr>
            <tr height="25">
              <td align="center">�ⷿ</td><td><%= shn %></td><td align="center">����</td><td><%= fc%>--<%= sc%></td>
          </tr>
            <tr height="25">
              <td align="center">�����</td><td><%= sname%></td>
              <td align="center">���</td><td><%= ps.getInContent()%></td>
          </tr>
           <tr height="25">
              <td align="center">����</td><td><%= ps.getUnitPrice() %></td>
              <td align="center">����</td><td><%= ps.getInCount()%>&nbsp;<%= ps.getUnit()%></td>
          </tr>  
          <tr height="25">
              <td align="center">�ܼ�</td><td><%= ps.getTotalPrice() %></td>
              <td align="center">�����</td><td><%= vname%></td>
          </tr>
              <tr height="25">
                <td align="center">���״̬</td><td><%= status %></td>
                <td align="center">��ⱸע</td><td><%= ps.getInRemarks() %></td>
           </tr>
             <tr height="25">	
            	<td align="center">
						�� �ˣ�
					</td>
					<td align="left">
						<input type="radio" name="inVerify" value="1" checked="checked" />
						ͨ��
						<input type="radio" name="inVerify" value="2" />
						��ͨ��
					</td>
					<td align="center">������</td>
					<td><s:textarea name="verifyRemarks" value="ͬ��" cols="23" rows="4"></s:textarea></td>
				</tr>
           <tr height="26">
            <td align="center" colspan="4">
              <s:submit name="submit" style="font-size:12px"value="���ȷ��"></s:submit>&nbsp;&nbsp;&nbsp;&nbsp;
              <s:reset name="reset" style="font-size:12px"value="������д"></s:reset>             
            <br></td>
          </tr>
       </table>
   </s:form>
</body>
</html>