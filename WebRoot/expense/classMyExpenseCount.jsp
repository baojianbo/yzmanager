<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.*" %>  
<%@page import="com.yz.manager.dao.*" %>  
<%@page import="com.yz.manager.date.*" %>  
<%@page import="java.util.*" %>
<%@page import="com.yz.manager.expense.bean.*" %>  
<%@page import="java.text.DecimalFormat"%> 
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="struts" uri="/struts-dojo-tags" %>

<%
   user user=(user)session.getAttribute("us");
   if(user==null) response.sendRedirect("../index.jsp"); 
   String systemName="3";
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
    int scount=daoUtil.selectSecondClassSize(user.getDepartment(),systemName);
    double expenseCount [][]=new double[scount][12];
    expenseCount=expenseDao.selectClassExpenseCount(user.getDepartment(),user.getUserName(),systemName,String.valueOf(CurrentDate.getCurrentYear()),"����","0");
  
     String sdp=daoUtil.selectDepartment3(Integer.valueOf(user.getDepartment()).intValue());
       String cmName="���й�˾";
      List<firstClass> dfc=new ArrayList<firstClass>();
      dfc=daoUtil.selectFirstClass3(user.getDepartment(),systemName);
       List<secondClass> dsc=new ArrayList<secondClass>();
      dsc=daoUtil.selectSecondClass6(user.getDepartment(),systemName);
      String us4=user.getName();
  %>   
    <s:form name="myform" action="classMyExpenseCountByOption" method="post" theme="simple" >
      <table class="left-font01" align="center" border="0" cellspacing="0" cellpadding="0" >
         
           <s:hidden name="department" value="%{#session.us.department}" ></s:hidden>
           <s:hidden name="userName" value="%{#session.us.userName}" ></s:hidden>
          <tr>
       
            <td>ͳ�����:</td>
           <td>
           	  <select  name="year" style="width:80px;" > 
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
					 <select  name="gCompany" style="width:80px;"> 
              <option selected value="0"></option> 
            <% 
		
		   for(gCompany d :  g){
		    %> 
		  <option value="<%= d.getId()%>"><%=d.getCompanyName()%></option> 
		
		 <% }
        %> 
            </select>				
					</td>
              <td> &nbsp;<s:submit style="font-size:14px" name="submit" value="�� ��"></s:submit>  </td>                     
         </tr>
       <tr><td>&nbsp;</td></tr>
        </table>
      </s:form>
     
        <table class="left-font01" width="100%"  align="center" border="1" cellspacing="0" cellpadding="0" >
          <tr height='25' class="tableth" bgcolor="#8E8EFF" >
          <th align="center">����</th><th align="center">�û�</th><th align="center">һ������</th><th align="center">��������</th><th align="center">1��</th><th align="center">2��</th><th align="center">3��</th><th align="center">4��</th><th align="center">5��</th><th align="center">6��</th><th align="center">7��</th><th align="center">8��</th><th align="center">9��</th><th align="center">10��</th><th align="center">11��</th><th align="center">12��</th><th align="center">�ϼ�</th>
          </tr>
          <%    
                
                int p=0; 
                 double rcount[]=new double[12];
                 double ccount=0;
                 double totalCount=0;
                 double classCount=0;
                 DecimalFormat dr=new DecimalFormat();
                 dr.setMaximumFractionDigits(2);
               if(dfc.size()==0){
                         out.println("<tr  height='25'><td align='center'width='10%'>&nbsp;"+sdp+"<br>("+cmName+")</td>");
						 out.println("<td align='center'width='10%' colspan='3'>&nbsp;</td>");       
					                for(int i=0; i<12;i++){
				                          out.println("<td align='center'>&nbsp;</td>");
				                     }  
				        out.println("<td align='center'>&nbsp;</td></tr>");               
               }else{
		                for(int j=0;j<dfc.size();j++){  
		                   int m=daoUtil.selectSecondClassSize(String.valueOf(dfc.get(j).getId()));            
		                    int l=0;
		                   for(int k=0;k<dsc.size();k++){           
					          if(dsc.get(k).getFirstCName().equals(String.valueOf(dfc.get(j).getId()))){
					             out.println(
						              "<tr  height='25'>");
						              if(k==0){
						              		out.println( "<td align='center' width='7%' rowspan='"+dsc.size()+dfc.size()+1 +"'>"+sdp+"<br>("+cmName+")</td>");
						                    out.println( "<td align='center' width='7%' rowspan='"+dsc.size()+dfc.size()+1 +"'>"+us4+"</td>");
						              }
						              if(l==0){
							              out.println(
							              "<td align='center'width='10%' rowspan='"+m+"'>"+dfc.get(j).getFirstCName()+"</td>");
					                      l++;
					                   }
					                   out.println(
					                       "<td align='center' width='10%'>"+dsc.get(k).getSecondCName()+"</td>");
					                for(int i=0; i<12;i++){
				                          out.println(	           
							              "<td align='center'>&nbsp;"+dr.format(expenseCount[p][i])+"</td>");
							               rcount[i]=rcount[i]+expenseCount[p][i];
				                           ccount=ccount + expenseCount[p][i];   
				                     }
				                         classCount=classCount+ccount;  
				                         p++; 
				                           out.println(	           
							              "<td align='center'>&nbsp;"+dr.format(ccount)+"</td>");    
							              ccount=0;
							   }
							              out.println("</tr>");     
		
		                    } 
		                     out.println(	           
							 "<tr height='25'><td align='center' colspan='2'>&nbspС��</td>");
							
				                          out.println(	 
				                          "<td align='center' colspan='12'>&nbsp</td>"+          
							              "<td align='center' style='color:red'>&nbsp;"+dr.format(classCount)+"</td>");
					                     classCount=0;
					  }
					   out.println(	           
							 "<tr height='25'><td align='center' colspan='2'>&nbsp;�ܼ�</td>");
							  for(int i=0; i<12;i++){
				                          out.println(	           
							              "<td align='center'>&nbsp;"+dr.format(rcount[i])+"</td>");
							              totalCount=totalCount+rcount[i];
				              }   
				               out.println(	           
			  		              "<td align='center' style='color:red'>&nbsp;"+dr.format(totalCount)+"</td></tr>");	      
		           }
		   %>
		         
       </table>
       <table>
         <tr><td>&nbsp;</td></tr>
          <tr><td>&nbsp;</td></tr>
       </table>
         
</body>
</html>