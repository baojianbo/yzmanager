<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.*" %>  
<%@page import="com.yz.manager.dao.*" %> 
<%@page import="java.util.*" %> 
<%@page import="com.yz.manager.page.*" %> 
<%@ taglib prefix="s" uri="/struts-tags" %>
  <%
  user user=(user)session.getAttribute("us");
  if(user==null) response.sendRedirect("../index.jsp"); 
    
     int totalsize=0;
     int totalPage=1;
     int currentPage=1;
     PageSet pg=new PageSet();
     String fid=(String)request.getParameter("fId");
     String scn=(String)request.getAttribute("scn");
     if(fid==null||fid.equals("")){
      fid=scn;
     }
     pg=new PageSet(daoUtil.selectHouseSecondClassSize2(fid),10);  
     totalsize=pg.getTotalsize();
     totalPage=pg.getTotalpage();
     currentPage=Integer.valueOf(request.getParameter("currentPage")).intValue();
	  List<secondClass> sc=new ArrayList<secondClass>();
	 sc=daoUtil.selectHouseSecondClass2(fid,currentPage,pg.getPagesize());
  %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�������</title>
	<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#E4FAF9"> 
      
   
      <table class="left-font01" width="60%" align="center" border="0" cellspacing="0" cellpadding="0" >
        
         <tr height="25"><td>&nbsp;</td></tr>
        </table>
     
       <table class="left-font01" width="80%"  align="center" border="1" cellspacing="0" cellpadding="0" >
          <tr height="25" class="tableth" bgcolor="#8E8EFF">
         <th>����</th><th>�ⷿ</th><th>һ������</th><th>��������</th><th>����</th><th>��λ</th><th>ɾ��</th><th>�޸�</th>
          </tr>
          <%
            for(secondClass f : sc){
            String sdp=daoUtil.selectDepartment3(Integer.valueOf(f.getDepartment()).intValue());
            String s=daoUtil.selectShouseName(Integer.valueOf(f.getHouseId()).intValue());
            String fcn=daoUtil.selectFirstClass5(Integer.valueOf(f.getFirstCName()).intValue());
            out.println(
              "<tr height='25'>"+
              "<td align='center'>"+sdp+"</td>"+
              "<td align='center'>"+s+"</td>"+
              "<td align='center'>"+fcn+"</td>" +  
              "<td align='center'>"+f.getSecondCName()+"</td>" +  
               "<td align='center'>"+f.getUnitPrice()+"</td>" +  
                "<td align='center'>"+f.getUnit()+"</td>" +  
              "<td align='center'><a class='left-font01' href='deleteHouseFSAction.action?sId="+f.getId()+"' >ɾ��</a</td>"+
               "<td align='center'><a class='left-font01' href='/shouse/modifyHouseSecondClass.jsp?sId="+f.getId()+"'>�޸�</a</td>"+            
              "</tr>");
              }                       
           %>
         
       </table>
       <table class="tablelink" width="60%" align="center">
           <tr align="right">
             <td>��<%= totalsize%>����¼|</td>
             <td>��<%= totalPage%>ҳ|</td>
             <td>��ǰ��<%= currentPage%>ҳ&nbsp;|</td>
             <td><a class="tablelink" href="modifyHouseFSClass.jsp?currentPage=1&fId=<%=fid %>">��ҳ</a></td>
             <td><a class="tablelink" href="modifyHouseFSClass.jsp?currentPage=<%=pg.searchCurrentPage(currentPage-1) %>&fId=<%=fid %>">��һҳ</a></td>
             <td><a class="tablelink" href="modifyHouseFSClass.jsp?currentPage=<%=pg.searchCurrentPage(currentPage+1)%>&fId=<%=fid %>&fId=<%=fid %>">��һҳ</a></td>
             <td><a class="tablelink" href="modifyHouseFSClass.jsp?currentPage=<%=totalPage %>&fId=<%=fid %>">βҳ</a></td>
             <td>��ת����<select name="selectPage" onchange="document.location.href=this.value">           
             <%
                for(int j=1;j<=pg.getTotalpage();j++){
                if(j==currentPage){
                out.println(
                  "<option  selected value='modifyHouseFSClass.jsp?fId="+fid+"&currentPage="+j+"'>&nbsp;&nbsp;"+j+"&nbsp;&nbsp;</option>");
                }else {
                 out.println(
                  "<option value='modifyHouseFSClass.jsp?fId="+fid+"&currentPage="+j+"'>&nbsp;&nbsp;"+j+"&nbsp;&nbsp;</option>");
                }
              }   
              %>           
             </select>ҳ</td>
           </tr>
         
         </table> 
   
     
</body>
</html>