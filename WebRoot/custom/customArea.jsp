<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.*" %>  
<%@page import="com.yz.manager.dao.*" %> 
<%@page import="java.util.*" %> 
<%@page import="com.yz.manager.page.*" %> 
<%@page import="com.yz.manager.custom.bean.*" %>  
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>���Ź���</title>
	<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#E4FAF9">
 <%
  user user=(user)session.getAttribute("us");
  if(user==null) response.sendRedirect("../index.jsp"); 
  
   HashMap<String,String> department=new LinkedHashMap<String,String>();
	  department=( HashMap<String,String>)daoUtil.selectDepartment();
	  request.setAttribute("department",department);
     int totalsize=0;
     int totalPage=1;
     int currentPage=1;
     PageSet pg=new PageSet();

     pg=new PageSet(daoUtil.selectCustomAreaSize(),15);  
     
     totalsize=pg.getTotalsize();
     totalPage=pg.getTotalpage();
     currentPage=Integer.valueOf(request.getParameter("currentPage")).intValue();
     List<customArea> cs=daoUtil.selectCustomArea(currentPage,pg.getPagesize());
  %>
       <s:form action="customAreaByOption.action?currentPage=1" method="post" theme="simple">
       <table class="left-font01" width="60%"  align="center" border="0" cellspacing="0" cellpadding="0" >
          <tr>
            <td align="center"> <s:select name="department" list="#request.department"  headerKey="-1" headerValue="���в���" listKey="key" listValue="value" ></s:select>
            &nbsp;&nbsp; <s:submit name="submit" value="�� ��"></s:submit>  &nbsp;&nbsp;            
             <a class="left-font01" href="addCustomArea.jsp">���ӿͻ�����</a></td>
        </tr>
       </table>
       </s:form>
       <table class="left-font01" width="80%"  align="center" border="1" cellspacing="0" cellpadding="0" >
          <tr height="25" height="25" class="tableth" bgcolor="#8E8EFF">
          <th>������</th><th>��������</th><th>��������</th><th>ɾ��</th><th>�޸�</th>
          </tr>
          <%
            for(customArea c : cs){
            out.println(
              "<tr height='25'>"+
              "<td align='center'>"+c.getId()+"</td>"+
              "<td align='center'>"+c.getAreaName()+"</td>"+
              "<td align='center'>"+daoUtil.selectDepartment3(Integer.valueOf(c.getDepartment()).intValue())+"</td>"+
              "<td align='center'><a class='left-font01' href='deleteCustomArea.action?cId="+c.getId()+"' >>></a></td>"+
              "<td align='center'><a class='left-font01' href='modifyCustomArea.jsp?cId="+c.getId()+"' >>></a></td>"+
              "</tr>");
            };                   
           %>
         
       </table>
       <table class="tablelink" align="center">
           <tr align="right">
             <td>��<%= totalsize%>����¼|</td>
             <td>��<%= totalPage%>ҳ|</td>
             <td>��ǰ��<%= currentPage%>ҳ|</td>
             <td><a class="tablelink" href="customArea.jsp?currentPage=1">��ҳ</a></td>
             <td><a class="tablelink" href="customArea.jsp?currentPage=<%=pg.searchCurrentPage(currentPage-1) %>">��һҳ</a></td>
             <td><a class="tablelink" href="customArea.jsp?currentPage=<%=pg.searchCurrentPage(currentPage+1)%>">��һҳ</a></td>
             <td><a class="tablelink" href="customArea.jsp?currentPage=<%=totalPage %>">βҳ</a></td>
             <td>��ת����<select name="selectPage" onchange="document.location.href=this.value">           
             <%
                for(int j=1;j<=pg.getTotalpage();j++){
                if(j==currentPage){
                out.println(
                  "<option  selected value='customArea.jsp?currentPage="+j+"'>&nbsp;&nbsp;"+j+"&nbsp;&nbsp;</option>");
                }else {
                 out.println(
                  "<option value='customArea.jsp?currentPage="+j+"'>&nbsp;&nbsp;"+j+"&nbsp;&nbsp;</option>");
                }
              }   
              %>           
             </select>ҳ</td>
           </tr>
         
         </table> 
   
     
</body>
</html>