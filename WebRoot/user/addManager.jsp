<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="gb2312"%>
<%@page import="java.util.*" %>
<%@page import="com.yz.manager.dao.daoUtil"%>
<%@page import="com.yz.manager.bean.*" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>���ӹ���Ա</title>
</head>
<body>

 <h1 align="center">���ӹ���Ա</h1>
   <%
      user user=(user)session.getAttribute("us");
      if(user==null) response.sendRedirect("../index.jsp"); 
	      
	     List<String> department=new ArrayList<String>();
	     department=daoUtil.selectDepartment4();
	     request.setAttribute("department",department);
	
	     HashMap<String, List<String>> userName= new HashMap<String, List<String>>();
	     userName=daoUtil.selectDoubleUser();	   
	     request.setAttribute("userName",userName);
	      
    %>
 
    <s:form action="addManagerAction" method="post" theme="simple">
      
       <table width="600" align="center" border="1" cellspacing="0" cellpadding="0" >
          <tr>
             <td>ѡ���û� </td>
             <td><s:doubleselect  name="department" list="#request.department"
		doubleName="userName" doubleList="#request.userName.get(top)" ></s:doubleselect></td>
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
          <td>       
              <s:submit name="submit" value="�� ��"></s:submit>
              <s:reset name="reset" value="�� ��"></s:reset>             
         </td>
          </tr>
       </table>
       
       
       </s:form>
           
     
</body>
</html>