<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.*" %>  
<%@page import="com.yz.manager.dao.*" %> 
<%@page import="com.yz.manager.date.*" %> 
<%@page import="com.yz.manager.page.*" %> 
<%@page import="com.yz.manager.expense.bean.*" %> 
<%@page import="java.util.*" %> 
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="struts" uri="/struts-dojo-tags" %>
<%
      user user=(user)session.getAttribute("us");
      if(user==null) response.sendRedirect("../index.jsp"); 
      
      String everify=request.getParameter("everify").trim();  
      request.setAttribute("everify",everify);
      String everify1=(String)request.getAttribute("everify");	
      List<secondClass> sc=new ArrayList<secondClass>();
      sc=daoUtil.selectSecondClassId2(user.getDepartment(),"3");
      power pw=daoUtil.selectPower(user.getUserName());
      List<firstClass> fc=new ArrayList<firstClass>();
	  String department=user.getDepartment().trim();
	  String systemName="3";
      fc=daoUtil.selectFirstClassId(department,systemName);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<struts:head/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>������ѯ</title>
	<script language="javascript">
		var onecount;
		onecount=0;
		subcat=new  Array();  
		<%
		int count=0;
		for(secondClass s : sc){
		 %>
		 subcat[<%=count%>]=new Array("<%= s.getId()%>","<%=s.getSecondCName()%>","<%=s.getFirstCName()%>");
		 <%
		 count = count + 1 ; 	
		}
		%>
		onecount=<%=count%>;
		function changelocation(locationid){
		document.myform.secondCName.length=0;
		var locationid=locationid;
		var i;
		document.myform.secondCName.options[0]=new Option('==ѡ���������==','0'); 
		for(i=0;i<onecount;i++){
		if (subcat[i][2] == locationid) 
		{ 
		document.myform.secondCName.options[document.myform.secondCName.length] = new Option(subcat[i][1], subcat[i][0]); 
		} 
		} 		   
		}
		</script>
</head>
<body bgcolor="#E4FAF9">
 <%
     PageSet pg=new PageSet(expenseDao.selectExpenseByVerifySize(user.getUserName(),Integer.valueOf(everify).intValue()),15);  
     int totalsize=pg.getTotalsize();
     int totalPage=pg.getTotalpage();
     int currentPage=Integer.valueOf(request.getParameter("currentPage")).intValue();
     List<expense> ep=new ArrayList<expense>();
     if(everify1!=null)everify=everify1;
     ep=expenseDao.selectExpenseByVerify(user.getUserName(),Integer.valueOf(everify).intValue(),currentPage,pg.getPagesize());
     
  %>   
    <s:form name="myform" action="applyExpenseByOption?currentPage=1" method="post" theme="simple" >
      <table  class="left-font01" align="center" border="0" cellspacing="0" cellpadding="0" >
        <tr><td><s:hidden name="everify" value="%{#request.everify}"/></td></tr>
          <tr>
              <td >���ࣺ</td> 
              <td>
                <select name="firstCName" style="width:100px;" onChange="changelocation(document.myform.firstCName.options[document.myform.firstCName.selectedIndex].value)" size="1"> 
              <option selected value="0"></option>
               <% 
		
		   for(firstClass f :fc){
		    %> 
		  <option value="<%= f.getId()%>"><%=f.getFirstCName()%></option> 
		
		 <% }
        %>      
            </select>
            <select name="secondCName" style="width:100px;"  size="1"> 
              <option selected value="0"></option> 
                 </select>              
          </td>      
       
        <td>&nbsp;&nbsp;����:</td>
           <td>
           	  <struts:datetimepicker  cssStyle="width:100px;" name="addDateBegin" displayFormat="yyyy-MM-dd"  />                       
                ��<struts:datetimepicker cssStyle="width:100px;" name="addDateEnd" displayFormat="yyyy-MM-dd"  />                         
           </td>            
              <td> &nbsp;&nbsp;&nbsp;<s:submit style="font-size:14px" name="submit" value="��  ��"></s:submit>  </td>                     
         </tr>
       <tr><td>&nbsp;</td></tr>
        </table>
      </s:form>
  
   
      <table class="left-font01" align="center" border="0" cellspacing="0" cellpadding="0" >
          <tr class="tableth">
          <%
            if("0".equals(everify)){
             out.println(
               "<td><a target='main' class='left-font01' style='color : red' href='applyExpenseState.jsp?everify=0&currentPage=1'>δ���</a></td>"+
               "<td>&nbsp;&nbsp;&nbsp;&nbsp;</td> "
             );
            }else{
               out.println(
               "<td><a target='main' class='left-font01'  href='applyExpenseState.jsp?everify=0&currentPage=1'>δ���</a></td>"+
               "<td>&nbsp;&nbsp;&nbsp;&nbsp;</td> "
             );
            }
            
            if("1".equals(everify)){
             out.println(
               "<td><a target='main' class='left-font01' style='color : red' href='applyExpenseState.jsp?everify=1&currentPage=1'>���ͨ��</a></td>"+
               "<td>&nbsp;&nbsp;&nbsp;&nbsp;</td> "
             );
            }else{
               out.println(
               "<td><a target='main' class='left-font01'  href='applyExpenseState.jsp?everify=1&currentPage=1'>���ͨ��</a></td>"+
               "<td>&nbsp;&nbsp;&nbsp;&nbsp;</td> "
             );
            }
             if("2".equals(everify)){
             out.println(
               "<td><a target='main' class='left-font01' style='color : red' href='applyExpenseState.jsp?everify=2&currentPage=1'>���δͨ��</a></td>"+
               "<td>&nbsp;&nbsp;&nbsp;&nbsp;</td> "
             );
            }else{
               out.println(
               "<td><a target='main' class='left-font01'  href='applyExpenseState.jsp?everify=2&currentPage=1'>���δͨ��</a></td>"+
               "<td>&nbsp;&nbsp;&nbsp;&nbsp;</td> "
             );
            }
           %>                    
         </tr>
      
        </table>
    
     
       <table class="left-font01" width="100%"  align="center" border="1" cellspacing="0" cellpadding="0" >
          
          <%
		        out.println(
		             "<tr height='23' class='tableth'bgcolor='#8E8EFF'>"+
		             "<th>���</th><th>�������</th><th>����</th><th>����</th><th>����</th><th>��λ</th><th>�ܼ�</th><th>��Ӧ��</th><th>��ϵ��</th><th>�绰</th><th>��������</th><th>�����</th><th>״̬</th><th>����</th><th>ɾ��</th>"+
		             "</tr>"
		            );
		            int k=1;;
		            for(expense e : ep){

		             out.println(
		              "<tr height='23'>"+
		              "<td align='center'>"+ k++ +"</td>"+
		               "<td align='center'>&nbsp;"+CurrentDate.parseDate1(e.getAddDate().toString())+"</td>"+
		              "<td align='center'>&nbsp;"+e.getContent()+"</td>" + 
		              "<td align='center'>&nbsp;"+e.getUnitPrice()+"</td>" + 
		              "<td align='center'>&nbsp;"+e.getNumber()+"</td>"+
		              "<td align='center'>&nbsp;"+e.getUnit()+"</td>"+
		              "<td align='center'>&nbsp;"+e.getTotalPrice()+"</td>"+
		              "<td align='center'>&nbsp;"+e.getSupplier()+"</td>"+
		              "<td align='center'>&nbsp;"+e.getContactName()+"</td>"+
		              "<td align='center'>&nbsp;"+e.getContactPhone()+"</td>"+
		              "<td align='center'>&nbsp;"+e.getNature()+"</td>"+
		               "<td align='center'>&nbsp;"+daoUtil.selectUser(e.getEverifyName())+"</td>");
		              if(e.getEverify()==0){
		                 out.println( "<td align='center'>δ���</td>");
		              }else if(e.getEverify()==1){
		                 out.println( "<td align='center'>���ͨ��</td>");
		              }else{
		                  out.println( "<td align='center'>���δͨ��</td>");
		              }
		               out.println(
		              "<td align='center'><a class='left-font01' href='detailExpense.jsp?aId="+e.getId()+"' >>></a></td>");
		              
		              if("0".equals(everify)){
		                 out.println(
		                  "<td align='center'><a class='left-font01' href='deleteExpenseAction1.action?aId="+e.getId()+"&everify="+everify +" '>>></a></td>");
		              }else if("2".equals(everify)){
		                 out.println(
		                  "<td align='center'><a class='left-font01' href='deleteExpenseAction1.action?aId="+e.getId()+"&everify="+everify +" '>>></a></td>");
		              }else if(pw.isEmsdelete()&"1".equals(everify)){
		                 out.println(
		                  "<td align='center'><a class='left-font01' href='deleteExpenseAction1.action?aId="+e.getId()+"&everify="+everify +" '>>></a></td>");
		              } else{
		                out.println(
		                  "<td align='center'>��</td>"); 
		                }         
		                 out.println( "</tr>");
		                 
		                 
		         } 
		         %>
         
       </table>
        <table class="tablelink">
           <tr align="right">
             <td>��<%= totalsize%>����¼&nbsp;|</td>
             <td>��<%= totalPage%>ҳ&nbsp;|</td>
             <td>��ǰ��<%= currentPage%>ҳ&nbsp;|</td>
             <td><a class="tablelink" href="applyExpenseState.jsp?everify=<%=everify %>&currentPage=1">��ҳ</a>&nbsp;&nbsp;</td>
             <td><a class="tablelink" href="applyExpenseState.jsp?everify=<%=everify %>&currentPage=<%=pg.searchCurrentPage(currentPage-1) %>">��һҳ</a>&nbsp;&nbsp;</td>
             <td><a class="tablelink" href="applyExpenseState.jsp?everify=<%=everify %>&currentPage=<%=pg.searchCurrentPage(currentPage+1)%>">��һҳ</a>&nbsp;&nbsp;</td>
             <td><a class="tablelink" href="applyExpenseState.jsp?everify=<%=everify %>&currentPage=<%=totalPage %>">βҳ</a>&nbsp;&nbsp;</td>
             <td>��ת����<select name="selectPage" onchange="document.location.href=this.value">         
             <%
                for(int j=1;j<=pg.getTotalpage();j++){
                 if(j==currentPage){
                   out.println(
                  "<option selected value='applyExpenseState.jsp?everify="+everify+"&currentPage="+j+"'>&nbsp;&nbsp;"+j+"&nbsp;&nbsp;</option>");
                 }else{
                 out.println(
                  "<option value='applyExpenseState.jsp?everify="+everify+"&currentPage="+j+"'>&nbsp;&nbsp;"+j+"&nbsp;&nbsp;</option>");
              }
              }   
              %>           
             </select>ҳ</td>
           </tr>
         
         </table>
   
   
     
</body>
</html>