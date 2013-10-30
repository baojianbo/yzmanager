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
<title>�������</title>
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
          <td> ���ţ�</td>
             <td align="center"> <s:select name="department" list="#request.department"  headerKey="-1" headerValue="���в���" listKey="key" listValue="value" ></s:select></td>
            <td> &nbsp;ϵͳ��</td>
             <td align="center"> <s:select name="systemName" list="#request.system"  headerKey="-1" headerValue="����ϵͳ" listKey="key" listValue="value" ></s:select></td>
              <td> &nbsp;</td>  
              <td> <s:submit name="submit" value="�� ��"></s:submit>  </td> 
              <td align="center"><a class="left-font01" href="addfirstClass.jsp" >����һ������</a></td>
              <td>&nbsp;</td>
              <td align="center"><a class="left-font01" href="addsecondClass2.jsp" >���Ӷ�������</a></td>            
               <td>&nbsp;</td>
              <td align="center"><a  class="left-font01" href="managerSClass.jsp?currentPage=1" >�޸Ķ�������</a></td>           
         </tr>
      
        </table>
      </s:form>
     
       <table class="left-font01" width="80%"  align="center" border="1" cellspacing="0" cellpadding="0" >
          <tr height="25" class="tableth" bgcolor="#8E8EFF" >
          <th>����</th><th>ϵͳ</th><th>һ������</th><th>ɾ��</th><th>�޸�</th><th>�鿴��Ӧ��������</th>
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
              "<td align='center'><a class='left-font01' href='deleteFirstAction.action?fId="+f.getId()+"' >ɾ��</a</td>"+
               "<td align='center'><a class='left-font01' href='/class/modifyFirstClass.jsp?fId="+f.getId()+"' >�޸�</a</td>"+
               "<td align='center'><a class='left-font01' href='/class/modifyFSClass.jsp?currentPage=1&fId="+f.getId()+"' >�鿴</a</td>"+    
              "</tr>");
              }                       
           %>
         
       </table>
        <table class="tablelink"  align="center">
           <tr align="right">
             <td>��<%= totalsize%>����¼|</td>
             <td>��<%= totalPage%>ҳ|</td>
             <td>��ǰ��<%= currentPage%>ҳ|</td>
             <td><a class="tablelink" href="managerClass.jsp?currentPage=1">��ҳ</a></td>
             <td><a class="tablelink" href="managerClass.jsp?currentPage=<%=pg.searchCurrentPage(currentPage-1) %>">��һҳ</a></td>
             <td><a class="tablelink" href="managerClass.jsp?currentPage=<%=pg.searchCurrentPage(currentPage+1)%>">��һҳ</a></td>
             <td><a class="tablelink" href="managerClass.jsp?currentPage=<%=totalPage %>">βҳ</a></td>
             <td>��ת����<select name="selectPage" onchange="document.location.href=this.value">           
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
             </select>ҳ</td>
           </tr>
         
         </table> 
   
   
     
</body>
</html>