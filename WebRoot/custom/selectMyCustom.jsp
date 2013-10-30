<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.*" %>  
<%@page import="com.yz.manager.dao.*" %> 
<%@page import="com.yz.manager.date.*" %> 
<%@page import="com.yz.manager.custom.bean.*" %> 
<%@page import="com.yz.manager.page.*" %> 
<%@page import="java.util.*" %> 
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="struts" uri="/struts-dojo-tags" %>

<%
   user user=(user)session.getAttribute("us");
   if(user==null) response.sendRedirect("../index.jsp"); 
    power pw=user.getPower(); 
   
	List<customArea> ca = new ArrayList<customArea>();
	ca = daoUtil.selectUserAreaByUser(user.getDepartment(),user.getUserName());	
	List<customType> ctype = new ArrayList<customType>();
	ctype = daoUtil.selectCustomType();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<struts:head/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�ͻ���ѯ</title>
	<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#E4FAF9">
 <%  
     int totalsize=0;
     int totalPage=1;
     int currentPage=1;
     PageSet pg=new PageSet();
     List<custom> cs=new ArrayList<custom>();
    
     pg=new PageSet(customDao.selectCustomSize(user.getDepartment(),user.getUserName(),false),15);  
     
     totalsize=pg.getTotalsize();
     totalPage=pg.getTotalpage();
     currentPage=Integer.valueOf(request.getParameter("currentPage")).intValue();
    
     cs=customDao.selectMyCustom(user.getDepartment(),user.getUserName(),false,currentPage,pg.getPagesize());
  
  %>   
    <s:form name="myform" action="selectMyCustomByOption?currentPage=1" method="post" theme="simple" >
      <table class="left-font01" align="center" border="0" cellspacing="0" cellpadding="0" >
          <tr>
           <s:hidden name="department" value="%{#session.us.department}" ></s:hidden>
            <s:hidden name="userName" value="%{#session.us.userName}" ></s:hidden>

              <td align="center" >��������:</td>
             <td  >
                  <select name="areaName"  style="width:100px;" size="1"> 
        			   <option selected value="0">ѡ������</option> 
        			   <%
								for (customArea f2 : ca) {
							%>
							<option value="<%=f2.getId()%>"><%=f2.getAreaName()%></option>

							<%
								}
							%>
                 </select>
             </td>
             
               <td align="center">
						&nbsp;&nbsp;�ͻ�����:
					</td>
					<td>
						<select style="width:100px;" name="customType">	
						  <option selected value="0">ѡ��ͻ�����</option> 
							<%
								for (customType f : ctype) {
							%>
							<option value="<%=f.getId()%>"><%=f.getTypeName()%></option>

							<%
								}
							%>
						</select>
				</td>
        </tr>
         <tr><td>&nbsp;</td></tr>
        <tr>
         <td align="center">��������:</td>
           <td>
            <select name="select"  style="width:100px;" size="1"> 
			           <option selected value="1">��ϵ��</option> 
			           <option  value="2">�ֻ���</option> 
			           <option  value="3">������</option> 
			           <option  value="4">��λ����</option> 
			           <option  value="5">��λ��ַ</option>
			           <option  value="6">��ע</option>  
           </select>
         <s:textfield name="search" size="20"></s:textfield></td>
          
        <td align="center">&nbsp;&nbsp;�������:</td>
           <td>
           	  <struts:datetimepicker  cssStyle="width:80px;" name="dateBegin" displayFormat="yyyy-MM-dd"  />                       
                ��<struts:datetimepicker cssStyle="width:80px;" name="dateEnd" displayFormat="yyyy-MM-dd"  />                         
           </td>

              <td> &nbsp;&nbsp;&nbsp;&nbsp;<s:submit style="font-size:14px" name="submit" value="�� ��"></s:submit>  </td>                     
         </tr>
       <tr><td>&nbsp;</td></tr>
        </table>
      </s:form>
     
       <table class="left-font01" width="100%"  align="center" border="1" cellspacing="0" cellpadding="0" >
          <tr height="23" class="tableth" bgcolor="#8E8EFF" >
          <th>���</th><th>�������</th><th>����</th><th>��λ����</th><th>��ϵ��</th><th>��ϵ�绰</th><th>�ͻ�����</th><th>��Ӳ���</th><th>�����</th><th>����</th><th>ɾ��</th><th>�޸�</th>
          </tr>
          <%
           int i=1;
            for(custom a : cs){
              String dp=daoUtil.selectDepartment3(Integer.valueOf(a.getDepartment()).intValue());
              String sname=daoUtil.selectUser(a.getUserName().trim());
              String ct=daoUtil.selectCustomTypeName(Integer.valueOf(a.getCustomType()).intValue());
              
              String an=daoUtil.selectCustomAreaName(Integer.valueOf(a.getAreaName()).intValue());
            out.println(
              "<tr height='23'>"+
              "<td align='center'>"+ i++ +"</td>"+
              "<td align='center'>&nbsp;"+CurrentDate.parseDate1(a.getAddDate().toString())+"</td>"+
              "<td align='center'>&nbsp;"+an+"</td>" +  
              "<td align='center'>&nbsp;"+a.getCompanyName()+"</td>" +   
              "<td align='center'>&nbsp;"+a.getContactName()+"</td>"+ 
              "<td align='center'>&nbsp;"+a.getMobilePhone()+"/"+a.getWorkPhone()+"</td>" +         
              "<td align='center'>&nbsp;"+ct+"</td>" +  
              "<td align='center'>&nbsp;"+dp+"</td>" +             
              "<td align='center'>&nbsp;"+sname+"</td>" + 
              "<td align='center'><a class='left-font01' href='detailCustom.jsp?aId="+a.getId()+"' >>></a></td>");
            
              if(pw.isCmsdelete()){
                    out.println(
               "<td align='center'><a class='left-font01' href='deleteMyCustomAction.action?aId="+a.getId()+"' >>></a></td>");
               }else{
                        out.println(
               "<td align='center' style='color:red'>��</td>");
               }
               if(pw.isCmsmodify()){
                      out.println(
                       "<td align='center'><a class='left-font01' href='modifyCustom.jsp?aId="+a.getId()+"' >>></a></td>");            
               }else{
                       out.println(
                       "<td align='center' style='color:red'>��</td>");            
               }
                out.println("</tr>");
              }                            
           %>
         
       </table>
         <table class="tablelink">
           <tr align="right">
             <td>��<%= totalsize%>����¼&nbsp;|</td>
             <td>��<%= totalPage%>ҳ&nbsp;|</td>
             <td>��ǰ��<%= currentPage%>ҳ&nbsp;|</td>
             <td><a class="tablelink" href="selectMyCustom.jsp?currentPage=1">��ҳ</a>&nbsp;</td>
             <td><a class="tablelink" href="selectMyCustom.jsp?currentPage=<%=pg.searchCurrentPage(currentPage-1) %>">��һҳ</a>&nbsp;</td>
             <td><a class="tablelink" href="selectMyCustom.jsp?currentPage=<%=pg.searchCurrentPage(currentPage+1)%>">��һҳ</a>&nbsp;</td>
             <td><a class="tablelink" href="selectMyCustom.jsp?currentPage=<%=totalPage %>">βҳ</a>&nbsp;</td>
             <td>��ת����<select name="selectPage" onchange="document.location.href=this.value">           
             <%
                for(int j=1;j<=pg.getTotalpage();j++){
                if(j==currentPage){
                out.println(
                  "<option  selected value='selectMyCustom.jsp?currentPage="+j+"'>&nbsp;&nbsp;"+j+"&nbsp;&nbsp;</option>");
                }else {
                 out.println(
                  "<option value='selectMyCustom.jsp?currentPage="+j+"'>&nbsp;&nbsp;"+j+"&nbsp;&nbsp;</option>");
                }
              }   
              %>           
             </select>ҳ</td>
           </tr>
         
         </table>
   
     
</body>
</html>