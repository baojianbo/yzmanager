<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.*" %>  
<%@page import="com.yz.manager.dao.*" %> 
<%@page import="com.yz.manager.date.*" %> 
<%@page import="com.yz.manager.page.*" %> 
<%@page import="com.yz.manager.storehouse.bean.*" %> 
<%@page import="java.util.*" %> 
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>������</title>
</head>
<body bgcolor="#E4FAF9">
 <%
  user user=(user)session.getAttribute("us");
  if(user==null) response.sendRedirect("../index.jsp"); 
  
     PageSet pg=new PageSet(storeHouseDao.selectVerifyStoreSize(user.getUserName()),15);  
     int totalsize=pg.getTotalsize();
     int totalPage=pg.getTotalpage();
     int currentPage=Integer.valueOf(request.getParameter("currentPage")).intValue();
     List<storeHouse> sh=new ArrayList<storeHouse>();
     sh=storeHouseDao.selectVerifyStore(user.getUserName(),currentPage,pg.getPagesize());
  %>   
  <table class="actionmessage" width="100%"  align="center" border="0" cellspacing="0" cellpadding="0" >
        <tr><td align="center"> <s:actionmessage></s:actionmessage></td></tr>
     </table>   
       
       <table class="left-font01" width="100%"  align="center" border="1" cellspacing="0" cellpadding="0" >
          
          <%
		        out.println(
		             "<tr height='23' class='tableth'bgcolor='#8E8EFF'>"+
		             "<th>���</th><th>�������</th><th>�����</th><th>�ⷿ</th><th>��Ʒ����</th><th>��Ʒ����</th><th>���</th><th>����</th><th>����</th><th>��λ</th><th>�ܼ�</th><th>���</th>"+
		             "</tr>"
		            );
		            int k=1;;
		            for(storeHouse e : sh){
		               String shn=daoUtil.selectShouseName(Integer.valueOf(e.getHouseId()).intValue());
                       String fn=daoUtil.selectFirstClass5(Integer.valueOf(e.getFirstCName()).intValue());
                       String sn=daoUtil.selectSecondClass8(e.getSecondCName());
		             out.println(
		              "<tr height='23'>"+
		              "<td align='center'>"+ k++ +"</td>"+
		               "<td align='center'>&nbsp;"+CurrentDate.parseDate1(e.getInDate().toString())+"</td>"+
		              "<td align='center'>&nbsp;"+daoUtil.selectUser(e.getUserName())+"</td>"+
		              "<td align='center'>&nbsp;"+shn+"</td>" + 
		              "<td align='center'>&nbsp;"+fn+"</td>" + 
		              "<td align='center'>&nbsp;"+sn+"</td>" + 
		              "<td align='center'>&nbsp;"+e.getInContent()+"</td>" + 
		              "<td align='center'>&nbsp;"+e.getUnitPrice()+"</td>" + 
		              "<td align='center'>&nbsp;"+e.getInCount()+"</td>"+
		              "<td align='center'>&nbsp;"+e.getUnit()+"</td>"+
		              "<td align='center'>&nbsp;"+e.getTotalPrice()+"</td>"
		             );   
		              out.println(
		              "<td align='center'><a class='left-font01' href='verifyStoreDetail.jsp?aId="+e.getId()+"' >>></a></td>"+                 
		              "</tr>");
		              }   
		         %>
         
       </table>
         <table class="tablelink">
           <tr align="right">
             <td>��<%= totalsize%>����¼&nbsp;|</td>
             <td>��<%= totalPage%>ҳ&nbsp;|</td>
             <td>��ǰ��<%= currentPage%>ҳ&nbsp;|</td>
             <td><a class="tablelink" href="inStoreVerify.jsp?currentPage=1">��ҳ</a>&nbsp;&nbsp;</td>
             <td><a class="tablelink" href="inStoreVerify.jsp?currentPage=<%=pg.searchCurrentPage(currentPage-1) %>">��һҳ</a>&nbsp;&nbsp;</td>
             <td><a class="tablelink" href="inStoreVerify.jsp?currentPage=<%=pg.searchCurrentPage(currentPage+1)%>">��һҳ</a>&nbsp;&nbsp;</td>
             <td><a class="tablelink" href="inStoreVerify.jsp?currentPage=<%=totalPage %>">βҳ</a>&nbsp;&nbsp;</td>
             <td>��ת����<select name="selectPage" onchange="document.location.href=this.value">        
             <%
                for(int j=1;j<=pg.getTotalpage();j++){
                 if(j==currentPage){
                      out.println(
                  "<option  selected value='inStoreVerify.jsp?currentPage="+j+"'>&nbsp;&nbsp;"+j+"&nbsp;&nbsp;</option>");
                 }else{
                 out.println(
                  "<option value='inStoreVerify.jsp?currentPage="+j+"'>&nbsp;&nbsp;"+j+"&nbsp;&nbsp;</option>");
                }
              }   
              %>           
             </select>ҳ</td>
           </tr>
         
         </table>
   
   
     
</body>
</html>