<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.*" %>  
<%@page import="com.yz.manager.dao.*" %> 
<%@page import="com.yz.manager.date.*" %> 
<%@page import="com.yz.manager.expense.bean.*" %> 
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
  expense ps=new expense();
    String aId=(String)request.getParameter("aId");
    
    if(aId!=null){
    ps=expenseDao.selectExpense(aId); 
    }
    else {
    String said=(String)request.getAttribute("said");
    if(said!=null) ps=expenseDao.selectExpense(said);
    }
    request.setAttribute("ps",ps); 
    String fc=daoUtil.selectFirstClass5(Integer.valueOf(ps.getFirstCName()).intValue());
    String sc=daoUtil.selectSecondClass8(ps.getSecondCName());     
    String gd=daoUtil.selectDepartment3(Integer.valueOf(ps.getDepartment()).intValue());
    String sname=daoUtil.selectUser(ps.getUserName().trim());
    String vname=daoUtil.selectUser(ps.getEverifyName().trim());
    String cm=daoUtil.selectGCompanyName(Integer.valueOf(ps.getCompany()).intValue());
    String pm=daoUtil.selectPayModeName(Integer.valueOf(ps.getPayMode()).intValue());
    String status;
    if(ps.getEverify()==0)status="δ���";
    else if(ps.getEverify()==1)status="���ͨ��";
    else status="���δͨ��";
  %>
     <s:form action="modifyExpenseAction" method="post" theme="simple">
       <table class="actionmessage" align="center" >
         <tr><td>&nbsp;</td></tr>
      
      <tr><td class="actionmessage"> <s:actionmessage/></td></tr>
      
            <tr><td>&nbsp;</td></tr>
       </table>
       <table class="left-font01" width="80%"  align="center" border="1" cellspacing="0" cellpadding="0" >
               <s:hidden name="id" value="%{#request.ps.id}" ></s:hidden>
          <tr height="25">
              <td align="center" width="15%">����</td><td width="35%"><%= CurrentDate.parseDate4(ps.getAddDate().toString()) %></td><td align="center" width="15%">����</td><td width="35%"><%= gd%></td>
          </tr>
            <tr height="25">
              <td align="center">������</td><td><%= sname%></td><td align="center">��������</td><td><%= ps.getNature() %></td>
          </tr>
            <tr height="25">
              <td align="center">����</td><td><%= fc%>--<%= sc%></td>
              <td align="center">����</td><td><%= ps.getContent() %></td>
          </tr>
            <tr height="25">
              <td align="center">��Ӧ��</td><td><s:textfield name="supplier" value="%{#request.ps.supplier}" ></s:textfield><span class="xiugai">*���޸�</span></td><td align="center">��Ӧ�̵�ַ</td><td><s:textfield size="40" name="supplierAddress" value="%{#request.ps.supplierAddress}" ></s:textfield><span class="xiugai">*���޸�</span></td>
          </tr>
          <tr height="25">
              <td align="center">��ϵ��</td><td><s:textfield name="contactName" value="%{#request.ps.contactName}" ></s:textfield><span class="xiugai">*���޸�</span></td>
              <td align="center">��ϵ�绰</td><td><s:textfield name="contactPhone" value="%{#request.ps.contactPhone}" ></s:textfield><span class="xiugai">*���޸�</span></td>
          </tr>
           <tr height="25">
              <td align="center">����</td><td><%= ps.getUnitPrice() %></td>
              <td align="center">����</td><td><%= ps.getTotalPrice()%>&nbsp;<%= ps.getUnit()%></td>
          </tr> 
           <tr height="25">
              <td align="center">�ܼ�</td><td><%= ps.getTotalPrice() %></td>
              <td align="center">���˹�˾</td><td><%= cm %></td>
         
          </tr>
          <tr height="25">
              <td align="center">���ʽ</td><td><%= pm %></td>
              <td align="center">�����</td><td><%= vname%></td>
         
          </tr>
              <tr height="25">
               <td align="center">���״̬</td><td><%= status %></td>
              <td  align="center">������ע</td><td><s:textarea name="remarks" value="%{#request.ps.remarks}" cols="25" rows="4" ></s:textarea><span class="xiugai">*���޸�</span></td>
          </tr>
           <tr height="25">
            <td align="center" colspan="4">
              <s:submit name="submit" style="font-size:14px"value="��   ��"></s:submit>&nbsp;&nbsp;&nbsp;&nbsp;
              <s:reset name="reset" style="font-size:14px"value="��   ��"></s:reset>             
            <br></td>
          </tr>
       </table>
   </s:form>
</body>
</html>