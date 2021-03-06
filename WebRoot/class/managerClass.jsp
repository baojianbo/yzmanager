<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.*" %>  
<%@page import="com.yz.manager.dao.*" %> 
<%@page import="java.util.*" %> 
<%@page import="com.yz.manager.page.*" %> 
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分类管理</title>
	<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#E4FAF9">
 <%
  user user=(user)session.getAttribute("us");
  if(user==null) response.sendRedirect("../index.jsp"); 
   int totalsize=0;
     int totalPage=1;
     int currentPage=1;
     PageSet pg=new PageSet();
     pg=new PageSet(daoUtil.selectFirstClassSize(),10);  
     totalsize=pg.getTotalsize();
     totalPage=pg.getTotalpage();
     currentPage=Integer.valueOf(request.getParameter("currentPage")).intValue();
	 List<firstClass> fc=new ArrayList<firstClass>();
	 fc=daoUtil.selectFirstClass2(currentPage,pg.getPagesize());
	  
	  HashMap<String,String> department=new LinkedHashMap<String,String>();
     department=( HashMap<String,String>)daoUtil.selectDepartment();
     request.setAttribute("department",department);

     HashMap<String,String> system=new LinkedHashMap<String,String>();
     system=( HashMap<String,String>)daoUtil.selectSystem();
     request.setAttribute("system",system);  
  %>   
    <s:form action="selectFirstClassAction?currentPage=1" method="post" theme="simple">
      <table class="left-font01" align="center" border="0" cellspacing="0" cellpadding="0" >
          <tr>
          <td> 部门：</td>
             <td align="center"> <s:select name="department" list="#request.department"  headerKey="-1" headerValue="所有部门" listKey="key" listValue="value" ></s:select></td>
            <td> &nbsp;系统：</td>
             <td align="center"> <s:select name="systemName" list="#request.system"  headerKey="-1" headerValue="所有系统" listKey="key" listValue="value" ></s:select></td>
              <td> &nbsp;</td>  
              <td> <s:submit name="submit" value="查 找"></s:submit>  </td> 
              <td align="center"><a class="left-font01" href="addfirstClass.jsp" >增加一级分类</a></td>
              <td>&nbsp;</td>
              <td align="center"><a class="left-font01" href="addsecondClass2.jsp" >增加二级分类</a></td>            
               <td>&nbsp;</td>
              <td align="center"><a  class="left-font01" href="managerSClass.jsp?currentPage=1" >修改二级分类</a></td>           
         </tr>
      
        </table>
      </s:form>
     
       <table class="left-font01" width="80%"  align="center" border="1" cellspacing="0" cellpadding="0" >
          <tr height="25" class="tableth" bgcolor="#8E8EFF" >
          <th>部门</th><th>系统</th><th>一级分类</th><th>删除</th><th>修改</th><th>查看对应二级分类</th>
          </tr>
          <%
            for(firstClass f : fc){
            String sdp=daoUtil.selectDepartment3(Integer.valueOf(f.getDepartment()).intValue());
            String s=daoUtil.selectSystem2(Integer.valueOf(f.getSystemName()).intValue());
            out.println(
              "<tr height='25'>"+  
              "<td align='center'>"+sdp+"</td>"+
              "<td align='center'>"+s+"</td>"+
              "<td align='center'>"+f.getFirstCName()+"</td>" +  
              "<td align='center'><a class='left-font01' href='deleteFirstAction.action?fId="+f.getId()+"' >删除</a</td>"+
               "<td align='center'><a class='left-font01' href='/class/modifyFirstClass.jsp?fId="+f.getId()+"' >修改</a</td>"+
               "<td align='center'><a class='left-font01' href='/class/modifyFSClass.jsp?currentPage=1&fId="+f.getId()+"' >查看</a</td>"+    
              "</tr>");
              }                       
           %>
         
       </table>
        <table class="tablelink"  align="center">
           <tr align="right">
             <td>共<%= totalsize%>条记录|</td>
             <td>共<%= totalPage%>页|</td>
             <td>当前第<%= currentPage%>页|</td>
             <td><a class="tablelink" href="managerClass.jsp?currentPage=1">首页</a></td>
             <td><a class="tablelink" href="managerClass.jsp?currentPage=<%=pg.searchCurrentPage(currentPage-1) %>">上一页</a></td>
             <td><a class="tablelink" href="managerClass.jsp?currentPage=<%=pg.searchCurrentPage(currentPage+1)%>">下一页</a></td>
             <td><a class="tablelink" href="managerClass.jsp?currentPage=<%=totalPage %>">尾页</a></td>
             <td>跳转到第<select name="selectPage" onchange="document.location.href=this.value">           
             <%
                for(int j=1;j<=pg.getTotalpage();j++){
                if(j==currentPage){
                out.println(
                  "<option  selected value='managerClass.jsp?currentPage="+j+"'>&nbsp;&nbsp;"+j+"&nbsp;&nbsp;</option>");
                }else {
                 out.println(
                  "<option value='managerClass.jsp?currentPage="+j+"'>&nbsp;&nbsp;"+j+"&nbsp;&nbsp;</option>");
                }
              }   
              %>           
             </select>页</td>
           </tr>
         
         </table> 
   
   
     
</body>
</html>