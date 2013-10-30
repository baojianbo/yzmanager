<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.*" %>  
<%@page import="com.yz.manager.dao.*" %> 
<%@page import="java.util.*" %>
<%@page import="com.yz.manager.expense.bean.*" %>  
<%@page import="java.text.DecimalFormat"%> 
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="struts" uri="/struts-dojo-tags" %>

<%
   user user=(user)session.getAttribute("us");
   if(user==null) response.sendRedirect("../index.jsp"); 
  
   List<user> us=new ArrayList<user>();
    us=daoUtil.selectUser2(user.getDepartment());

	List<gCompany> g=new ArrayList<gCompany>();	
	g=daoUtil.selectGCompany();	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<struts:head/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�¶ȷ��û���</title>
	<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#E4FAF9">
 <%  
      double expenseCount[]=new double[12];
      List<String> du=new ArrayList<String>();
      String sdp="";
      String userName="";
      String cmName=(String)request.getAttribute("cmName");
   if(request.getAttribute("count3")!=null){ 
        expenseCount = (double[])request.getAttribute("count3");
        sdp=daoUtil.selectDepartment3(Integer.valueOf((String)request.getAttribute("dp1")).intValue());
        userName=daoUtil.selectUser((String)request.getAttribute("userName"));
     }
  %>   
      <s:form name="myform" action="monthDpExpenseByOption" method="post" theme="simple" >
      <table class="left-font01" align="center" border="0" cellspacing="0" cellpadding="0" >
          <s:hidden name="department" value="%{#session.us.department}" ></s:hidden>
          <tr>
            <td >������:</td>
             <td  >
                  <select name="userName"  style="width:100px;" size="1"> 
           <option selected value="0"></option>  
           <% 
		
		   for(user d :us){
		    %> 
		  <option value="<%= d.getUserName()%>"><%=d.getName() %></option> 
		
		 <% }
        %> 
            </select>       
             </td>
            <td>&nbsp;&nbsp;ͳ�����:</td>
           <td>
           	  <select  name="year" style="width:100px;" > 
              <option value="2012">2012</option>  
              <option value="2013" selected>2013</option>  
              <option value="2014" >2014</option>  
              <option value="2015">2015</option>  
            </select>
           </td>
            <td align="center">
						&nbsp;&nbsp;�������ʣ�
		   </td>
		   <td align="center">
						<input type="radio" name="nature" value="����" checked="checked" />
						����&nbsp;
						<input type="radio" name="nature" value="���" />
						���
					</td>
		 <td align="center">
						&nbsp;&nbsp;���˹�˾��
					</td>
					<td align="center">
					 <select  name="gCompany" style="width:100px;"> 
              <option selected value="0"></option> 
            <% 
		
		   for(gCompany d :  g){
		    %> 
		  <option value="<%= d.getId()%>"><%=d.getCompanyName()%></option> 
		
		 <% }
        %> 
            </select>				
					</td>
              <td> &nbsp;<s:submit style="font-size:14px" name="submit" value="��  ��"></s:submit>  </td>                     
         </tr>
       <tr><td>&nbsp;</td></tr>
        </table>
      </s:form>
     
       <table class="left-font01" width="100%"  align="center" border="1" cellspacing="0" cellpadding="0" >
          <tr height='25' class="tableth" bgcolor="#8E8EFF" >
          <th align="center">����</th><th align="center">������</th><th align="center">1��</th><th align="center">2��</th><th align="center">3��</th><th align="center">4��</th><th align="center">5��</th><th align="center">6��</th><th align="center">7��</th><th align="center">8��</th><th align="center">9��</th><th align="center">10��</th><th align="center">11��</th><th align="center">12��</th><th align="center">�ϼ�</th>
          </tr>
          <%    
                double rCount=0;
                DecimalFormat dr=new DecimalFormat();
                dr.setMaximumFractionDigits(2);
              
                    out.println(
			              "<tr  height='25'> <td align='center'>"+sdp +"<br>("+cmName+")</td><td align='center'>"+userName +"</td>");
                    for(int i=0; i<12;i++){
                          out.println(	           
			              "<td align='center'>"+dr.format(expenseCount[i]) +"</td>"); 
			              rCount=rCount+expenseCount[i];
                    }  
                                    
                      out.println("<td align='center'>"+dr.format(rCount) +"</td></tr>");
             
           %>
         
       </table>
         
</body>
</html>