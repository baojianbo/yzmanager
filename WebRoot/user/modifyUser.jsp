<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.user" %> 
<%@page import="com.yz.manager.dao.daoUtil" %>
<%@page import="java.util.*" %> 
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�޸��û���Ϣ</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body >
<%
  user user=(user)session.getAttribute("us");
  if(user==null) response.sendRedirect("../index.jsp"); 
  user u2=new user();
  if(request.getAttribute("usId")==null){
       u2=daoUtil.selectUser(Integer.valueOf(request.getParameter("usId").trim()).intValue());
  }
  else {
       u2=daoUtil.selectUser(Integer.valueOf((String)request.getAttribute("usId")).intValue());
  }
  request.setAttribute("u2",u2);
   HashMap<String,String> department=new LinkedHashMap<String,String>();
   department=( HashMap<String,String>)daoUtil.selectDepartment();
   request.setAttribute("department",department);
   
  %>
 <h1 class="h1" align="center">�޸��û���Ϣ</h1>
 
 <s:form action="modifyUser" method="post" theme="simple">
        <s:token></s:token>
       <table class="left-font01" align="center" border="0" cellspacing="0" cellpadding="0" >
           <tr >
             <td align="center"> �û���ţ�</td>
             <td align="center"> <s:textfield style="width:200px;" name="userId" value="%{#request.u2.userId}"  readonly="true" size="40" ></s:textfield></td>
         </tr>
             <tr><td>&nbsp;</td></tr>   
          <tr >
             <td align="center"> �û�����</td>
             <td align="center"> <s:textfield style="width:200px;" name="userName" value="%{#request.u2.userName}" readonly="true" size="40"  ></s:textfield></td>
         </tr>
          <tr><td>&nbsp;</td></tr>
          <tr>
             <td align="center"> �����룺</td>
             <td align="center"> <s:password style="width:200px;"  name="userPassword" size="42"></s:password></td>
              <td class="actionmessage"> 
                 <s:fielderror  >   
                         <s:param>nullPassword</s:param>
                 </s:fielderror>
                   <s:fielderror  >   
                         <s:param>newPasswordlength</s:param>
                 </s:fielderror>
             </td>
         
         </tr>
          <tr><td>&nbsp;</td></tr>
           <tr>
             <td align="center">��    ����</td>
             <td align="center"> <s:textfield style="width:200px;" name="name" value="%{#request.u2.name}" size="40" ></s:textfield></td>
         </tr>
          <tr><td>&nbsp;</td></tr>
           <tr>
             <td align="center"> ��    ��</td>
             <td align="center"> 
             <input type="radio"  name="sex" value="��"  checked="checked"/>��
             <input type="radio"  name="sex" value="Ů" />Ů            
              </td>            
         </tr>
         <tr><td>&nbsp;</td></tr>
          <tr>
             <td align="center"> ��    �ţ�</td>
             <td align="center"> <s:select style="width:200px;" name="department" list="#request.department"  listKey="key" listValue="value" value="%{#request.u2.department}" ></s:select></td>
         </tr>
           <tr><td>&nbsp;</td></tr>
          <tr>
             <td align="center"> ״̬��</td>
             <td align="center"> 
             <input type="radio"  name="status" value="true"  checked="checked"/>����
             <input type="radio"  name="status" value="false" />����            
              </td>            
         </tr>
                <tr><td>&nbsp;</td></tr>  
         <tr> 
             <td align="center"> ְλ��</td>
             <td align="center"> <s:textfield style="width:200px;" name="post" value="%{#request.u2.post}" size="30"></s:textfield></td>
         </tr>
           <tr><td>&nbsp;</td></tr>
          <tr>
             <td align="center"> ��ע��</td>
             <td align="center"> <s:textfield style="width:200px;" name="remarks" value="%{#request.u2.remarks}" size="30"></s:textfield></td>
         </tr>
         <tr><td>&nbsp;</td></tr>   
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