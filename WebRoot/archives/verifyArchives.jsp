<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.*" %>  
<%@page import="com.yz.manager.dao.*" %> 
<%@page import="com.yz.manager.date.*" %> 
<%@page import="com.yz.manager.page.*" %> 
<%@page import="com.yz.manager.archives.bean.*" %> 
<%@page import="java.util.*" %> 
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�������</title>
</head>
<body bgcolor="#E4FAF9">
 <%
  user user=(user)session.getAttribute("us");
  if(user==null) response.sendRedirect("../index.jsp"); 
  
    PageSet pg=new PageSet(archivesDao.selectArchives2Size(user.getUserName()),15);  
     int totalsize=pg.getTotalsize();
     int totalPage=pg.getTotalpage();
     int currentPage=Integer.valueOf(request.getParameter("currentPage")).intValue();
     List<archives> ar=new ArrayList<archives>();
     ar=archivesDao.selectArchives2(user.getUserName(),currentPage,pg.getPagesize());
     
  %>   
  <table class="actionmessage" width="100%"  align="center" border="0" cellspacing="0" cellpadding="0" >
        <tr><td align="center"> <s:actionmessage></s:actionmessage></td></tr>
     </table>   
       <table class="left-font01" width="100%"  align="center" border="1" cellspacing="0" cellpadding="0" >
          
          <%
		            out.println(
		             "<tr height='23' class='tableth'bgcolor='#8E8EFF'>"+
		             "<th>���</th><th>�ļ�����</th><th>�ļ����Ӱ�</th><th>�������</th><th>��������</th><th>������</th><th>��������</th><th>���</th>"+
		             "</tr>"
		            );
		            int i=1;
		            for(archives a : ar){
		            int d=Integer.valueOf(a.getDepartment()).intValue();
		            String gdp=daoUtil.selectDepartment3(d);
		            out.println(
		              "<tr height='23'>"+
		              "<td align='center'>"+ i++ +"</td>"+
		              "<td align='center'>"+a.getFileName()+"</td>");
		            if(a.getFileDir()==null){
		              out.println(
		              "<td align='center'>�޵��ӵ�</td>");
		            }
		            else{
		            out.println(
		              "<td align='center'><a class='left-font01' href='"+ a.getFileDir()+"' >����</a></td>");
		            }
		             out.println(
		              "<td align='center'>"+a.getFileNumber()+"</td>" + 
		              "<td align='center'>"+gdp+"</td>" + 
		              "<td align='center'>"+a.getGiveArName()+"</td>" + 
		              "<td align='center'>"+CurrentDate.parseDate1(a.getArDate().toString())+"</td>"+ 
		              "<td align='center'><a class='left-font01' href='verifyArchivesDetail.jsp?aId="+a.getId()+"' >>></a></td>"+         		            
		              "</tr>");
		              }   
		           %>
         
       </table>
         <table class="tablelink">
           <tr align="right">
             <td>��<%= totalsize%>����¼&nbsp;|</td>
             <td>��<%= totalPage%>ҳ&nbsp;|</td>
             <td>��ǰ��<%= currentPage%>ҳ&nbsp;|</td>
             <td><a class="tablelink" href="verifyArchives.jsp?currentPage=1">��ҳ</a>&nbsp;&nbsp;</td>
             <td><a class="tablelink" href="verifyArchives.jsp?currentPage=<%=pg.searchCurrentPage(currentPage-1) %>">��һҳ</a>&nbsp;&nbsp;</td>
             <td><a class="tablelink" href="verifyArchives.jsp?currentPage=<%=pg.searchCurrentPage(currentPage+1)%>">��һҳ</a>&nbsp;&nbsp;</td>
             <td><a class="tablelink" href="verifyArchives.jsp?currentPage=<%=totalPage %>">βҳ</a>&nbsp;&nbsp;</td>
             <td>��ת����<select name="selectPage" onchange="document.location.href=this.value">        
             <%
                for(int j=1;j<=pg.getTotalpage();j++){
                 if(j==currentPage){
                      out.println(
                  "<option  selected value='verifyArchives.jsp?currentPage="+j+"'>&nbsp;&nbsp;"+j+"&nbsp;&nbsp;</option>");
                 }else{
                 out.println(
                  "<option value='verifyArchives.jsp?currentPage="+j+"'>&nbsp;&nbsp;"+j+"&nbsp;&nbsp;</option>");
                }
              }   
              %>           
             </select>ҳ</td>
           </tr>
         
         </table>
   
   
     
</body>
</html>