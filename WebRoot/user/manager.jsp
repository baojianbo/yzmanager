<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.*" %>  
<%@page import="com.yz.manager.dao.*" %> 
<%@page import="java.util.*" %> 
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>����Ա����</title>
</head>
<body>
 <%
  user user=(user)session.getAttribute("us");
  if(user==null) response.sendRedirect("../index.jsp"); 
  List<manager> m=new ArrayList<manager>();

  m=(List<manager>)daoUtil.selectManager();
    
  %>
      
   
      <table  align="center" border="0" cellspacing="0" cellpadding="0" >
          <tr>     
             <td align="right"><a href="/user/addManager.jsp">���ӹ���Ա</a></td>
         </tr>
        </table>
   
       <table width="60%"  align="center" border="1" cellspacing="0" cellpadding="0" >
          <tr >
          <th>���</th><th>�û���</th><th>����</th><th>���Ź���Ա</th><th>ϵͳ����Ա</th><th>ɾ��</th><th>�޸�</th>
          </tr>
          <%
            for(manager m1 : m){
            String dp=daoUtil.selectDepartment3(Integer.valueOf(m1.getDepartment()).intValue());
            String systemManager="��";
            String departmentManager="��";
            if(m1.isSystemManager())systemManager="��";
            if(m1.isDepartmentManager()) departmentManager="��";
            out.println(
              "<tr>"+
              "<td align='center'>"+m1.getId()+"</td>"+
              "<td align='center'>"+m1.getUserName()+"</td>"+
               "<td align='center'>"+dp+"</td>"+
              "<td align='center'>"+departmentManager+"</td>"+
              "<td align='center'>"+systemManager+"</td>");
              if("admin".equals(m1.getUserName().trim())){
              out.println(
              "<td align='center'>����ɾ��</td>"            
              );
               out.println(
              "<td align='center'>�����޸�</td>"            
              );
              }else{
               out.println(
              "<td align='center'><a href='deleteManager.action?mId="+m1.getId()+"' >ɾ��</a></td>"
              );
                         
               out.println(
              "<td align='center'><a href='/user/modifyManager.jsp?mId="+m1.getId()+"' >�޸�</a></td>"+
              "</tr>");
            }; 
            }                  
           %>
         
       </table>
       
   
     
</body>
</html>