<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.*" %>  
<%@page import="com.yz.manager.dao.*" %> 
<%@page import="com.yz.manager.date.*" %> 
<%@page import="com.yz.manager.personal.bean.*" %> 
<%@page import="java.util.*" %> 
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>������ѯ</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#E4FAF9">
 <%
  user user=(user)session.getAttribute("us");
  if(user==null) response.sendRedirect("../index.jsp"); 
  personal ps=new personal();
    String aId=(String)request.getParameter("aId");
    
    if(aId!=null){
    ps=personalDao.selectPersonal(aId); 
    }
    else {
    String said=(String)request.getAttribute("said");
    if(said!=null) ps=personalDao.selectPersonal(said);
    }
    request.setAttribute("ps",ps); 
    String fc=daoUtil.selectFirstClass5(Integer.valueOf(ps.getFirstCName()).intValue());
    String sc=daoUtil.selectSecondClass8(ps.getSecondCName());     
    String gd=daoUtil.selectDepartment3(Integer.valueOf(ps.getDepartment()).intValue());
    String sname=daoUtil.selectUser(ps.getUserName().trim());
  %>
     <s:form action="modifyPersonalAction" method="post" theme="simple">
       <table class="actionmessage" align="center" >
         <tr><td>&nbsp;</td></tr>
       <tr><td>&nbsp;</td></tr>
       <tr><td>&nbsp;</td></tr>
      <tr><td class="actionmessage"> <s:actionmessage/></td></tr>
      
            <tr><td>&nbsp;</td></tr>
       </table>
       <table class="left-font01" width="80%"  align="center" border="1" cellspacing="0" cellpadding="0" >
               <s:hidden name="id" value="%{#request.ps.id}" ></s:hidden>
          <tr height="25">
              <td align="center" width="15%">��ϵ��</td><td width="35%"><%= ps.getContactName()%></td><td align="center" width="15%">����</td><td width="35%"><%= fc%>--<%= sc%></td>
          </tr>
            <tr height="25">
              <td align="center">��λ����</td><td><s:textfield name="companyName" value="%{#request.ps.companyName}" ></s:textfield><span class="xiugai">*���޸�</span></td><td align="center">��λ��ַ</td><td><s:textfield size="40" name="companyAddress" value="%{#request.ps.companyAddress}" ></s:textfield><span class="xiugai">*���޸�</span></td>
          </tr>
            <tr height="25">
              <td align="center">�ʱ��ַ</td><td><s:textfield name="zipCode" value="%{#request.ps.zipCode}" ></s:textfield><span class="xiugai">*���޸�</span></td><td align="center">ְλ</td><td><s:textfield name="post" value="%{#request.ps.post}" ></s:textfield><span class="xiugai">*���޸�</span></td>
          </tr>
            <tr height="25">
              <td align="center">�ֻ�����</td><td><s:textfield name="mobilePhone" value="%{#request.ps.mobilePhone}" ></s:textfield><span class="xiugai">*���޸�</span></td><td align="center">��������</td><td><s:textfield name="workPhone" value="%{#request.ps.workPhone}" ></s:textfield><span class="xiugai">*���޸�</span></td>
          </tr>
          <tr height="25">
              <td align="center">����</td><td><s:textfield name="fax" value="%{#request.ps.fax}" ></s:textfield><span class="xiugai">*���޸�</span></td>
              <td align="center">��������</td><td><s:textfield name="mail" value="%{#request.ps.mail}" ></s:textfield><span class="xiugai">*���޸�</span></td>
          </tr>
           <tr height="25">
              <td align="center">QQ����</td><td><s:textfield name="qq" value="%{#request.ps.qq}" ></s:textfield><span class="xiugai">*���޸�</span></td>
              <td align="center">��Ӳ���</td><td><%= gd %></td>
          </tr> 
           <tr height="25">
              <td align="center">�����</td><td><%= sname %></td>
              <td align="center">�������</td><td><%= CurrentDate.parseDate4(ps.getRegisterDate().toString()) %></td>
         
          </tr>
              <tr height="25">
              <td  align="center">������ע</td><td colspan="3"><s:textarea name="remarks" value="%{#request.ps.remarks}" cols="30" rows="4" ></s:textarea><span class="xiugai">*���޸�</span></td>
          </tr>
           <tr height="25">
            <td align="center" colspan="4">
              <s:submit name="submit" style="font-size:14px"value="��  ��"></s:submit>&nbsp;&nbsp;
              <s:reset name="reset" style="font-size:14px"value="��  ��"></s:reset>             
            <br></td>
          </tr>
       </table>
   </s:form>
</body>
</html>