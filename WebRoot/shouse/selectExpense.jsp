<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.*" %>  
<%@page import="com.yz.manager.dao.*" %> 
<%@page import="com.yz.manager.date.*" %> 
<%@page import="com.yz.manager.expense.bean.*" %> 
<%@page import="com.yz.manager.page.*" %> 
<%@page import="java.util.*" %> 
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="struts" uri="/struts-dojo-tags" %>

<%
   user user=(user)session.getAttribute("us");
   if(user==null) response.sendRedirect("../index.jsp"); 
   
   List<firstClass> fc=new ArrayList<firstClass>(); 
   String systemName="3";
   fc=daoUtil.selectFirstClassId(systemName);
    
    List<secondClass> sc=new ArrayList<secondClass>();
    sc=daoUtil.selectAllSecondClass(systemName);
    
    List<user> us=new ArrayList<user>();
    us=daoUtil.selectUser();
    
    List<gCompany> g=new ArrayList<gCompany>();	
	g=daoUtil.selectGCompany();
    
    List<department> department=new ArrayList<department>();
	 department=daoUtil.selectDepartmentId();	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<struts:head/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>���ò�ѯ</title>
	<link href="../css/css.css" rel="stylesheet" type="text/css" />
	<script language="javascript">
			var onecount;
			onecount=0;
			subcat=new  Array();  
			<%
			int count=0;
			for(user user1: us){
			 %>
			 subcat[<%=count%>]=new Array("<%= user1.getUserName()%>","<%=user1.getName()%>","<%=user1.getDepartment()%>");
			 <%
			 count = count + 1 ; 	
			}
			%>
			onecount=<%=count%>;
			function changelocation(locationid){
			document.myform.secondCName.length=0;
			document.myform.secondCName.options[0]=new Option('','0'); 
			
			document.myform.userName.length=0;
			var locationid=locationid;
			var i;
			document.myform.userName.options[0]=new Option('','0'); 
			for(i=0;i<onecount;i++){
			if (subcat[i][2] == locationid) 
			{ 
			document.myform.userName.options[document.myform.userName.length] = new Option(subcat[i][1], subcat[i][0]); 
			} 
			} 		   
			
			var onecount1;
			onecount1=0;
			subcat1=new  Array();  
			<%
			int count1=0;
			for(firstClass sf: fc){
			 %>
			 subcat1[<%=count1%>]=new Array("<%= sf.getId()%>","<%=sf.getFirstCName()%>","<%=sf.getDepartment()%>");
			 <%
			 count1 = count1 + 1 ; 	
			}
			%>
			onecount1=<%=count1%>;
			document.myform.firstCName.length=0;
			var i1;
			document.myform.firstCName.options[0]=new Option('','0'); 
			for(i1=0;i1<onecount1;i1++){
			if (subcat1[i1][2] == locationid) 
			{ 
			document.myform.firstCName.options[document.myform.firstCName.length] = new Option(subcat1[i1][1], subcat1[i1][0]); 
			} 			   
			}		
			}
			</script>
			
			<script language="javascript">
			var onecount2;
			onecount2=0;
			subcat2=new  Array();  
			<%
			int count2=0;
			for(secondClass sc1: sc){
			 %>
			 subcat2[<%=count2%>]=new Array("<%= sc1.getId()%>","<%=sc1.getSecondCName()%>","<%=sc1.getFirstCName()%>");
			 <%
			 count2 = count2 + 1 ; 	
			}
			%>
			onecount2=<%=count2%>;
			function changelocation1(locationid){
			document.myform.secondCName.length=0;
			var locationid2=locationid;
			var i2;
			document.myform.secondCName.options[0]=new Option('','0'); 
			for(i2=0;i2<onecount2;i2++){
			if (subcat2[i2][2] == locationid2) 
			{ 
			document.myform.secondCName.options[document.myform.secondCName.length] = new Option(subcat2[i2][1], subcat2[i2][0]); 
			} 
			} 		   
			}
			</script>
</head>
<body bgcolor="#E4FAF9">
 <%  
     int totalsize=0;
     int totalPage=1;
     int currentPage=1;
     PageSet pg=new PageSet();
     List<expense> ep=new ArrayList<expense>();
    
     pg=new PageSet(expenseDao.selectExpenseSize(user.getDepartment()),15);  
     
     totalsize=pg.getTotalsize();
     totalPage=pg.getTotalpage();
     currentPage=Integer.valueOf(request.getParameter("currentPage")).intValue();
    
     ep=expenseDao.selectExpense(user.getDepartment(),currentPage,pg.getPagesize());
  
  %>   
    <s:form name="myform" action="selectExpenseByOption?currentPage=1" method="post" theme="simple" >
      <table class="left-font01" align="center" border="0" cellspacing="0" cellpadding="0" >
          <tr>
          <td  align="center"> ���ţ�</td>
             <td > 
             <select  name="department"  style="width:100px;" onChange="changelocation(document.myform.department.options[document.myform.department.selectedIndex].value)" size="1"> 
              <option selected value="0"></option> 
            <% 
		
		   for(department d :department){
		    %> 
		  <option value="<%= d.getDepartmentId()%>"><%=d.getDepartment()%></option> 
		
		 <% }
        %> 
            </select>
            </td>
         <td  align="center">
           ������:</td>
            <td >
                  <select name="userName"  style="width:100px;" size="1"> 
           <option selected value="0"></option> 
         <% 
		   for(user su :us){
		    %> 
		  <option value="<%= su.getUserName()%>"><%=su.getName()%></option> 
		
		 <% }
        %> 
            </select>          
            
           </td>
             
              <td align="center">
						&nbsp;&nbsp;&nbsp;&nbsp;���˹�˾��
					</td>
					<td >
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
             </tr>
             <tr><td>&nbsp;</td></tr>
             <tr>
              <td align="center">һ�����ࣺ</td> 
              <td>
                <select name="firstCName" style="width:100px;" onChange="changelocation1(document.myform.firstCName.options[document.myform.firstCName.selectedIndex].value)" size="1"> 
              <option selected value="0"></option>     
            </select>
            </td>
              <td  align="center">
             �������ࣺ
             </td>
             <td>
            <select name="secondCName" style="width:100px;"  size="1"> 
              <option selected value="0"></option> 
                 </select>              
          </td> 
      
         <td align="center">&nbsp;&nbsp;����:</td>
           <td>
            <select name="select"  style="width:100px;" size="1"> 
			           <option selected value="1">��ϵ��</option> 
			           <option  value="2">�绰</option> 
			           <option  value="3">��Ӧ��</option> 
			           <option  value="4">��Ӧ�̵�ַ</option> 
			           <option  value="5">����</option>
			           <option  value="6">��ע</option>  
           </select>
         <s:textfield name="search" size="20"></s:textfield></td>
         </tr>
         <tr><td>&nbsp;</td></tr>
         <tr> 
        <td>�������:</td>
           <td>
           	  <struts:datetimepicker  cssStyle="width:80px;" name="dateBegin" displayFormat="yyyy-MM-dd"  />                       
            </td>
             <td align="center">  
               ��</td>
               <td>
              <struts:datetimepicker cssStyle="width:80px;" name="dateEnd" displayFormat="yyyy-MM-dd"  />                         
           </td>
         
            <td align="center">
						&nbsp;&nbsp;&nbsp;&nbsp;�������ʣ�
					</td>
					<td >
						<input type="radio" name="nature" value="����" checked="checked" />
						����&nbsp;&nbsp;
						<input type="radio" name="nature" value="���" />
						���
					</td>
         
              <td> &nbsp;<s:submit style="font-size:14px" name="submit" value="�� ��"></s:submit>  </td>                     
         </tr>
      
        </table>
      </s:form>
     
       <table class="left-font01" width="100%"  align="center" border="1" cellspacing="0" cellpadding="0" >
          <tr height="23" class="tableth" bgcolor="#8E8EFF" >
          <th>���</th><th>�������</th><th>����</th><th>����</th><th>����</th><th>��λ</th><th>�ܼ�</th><th>��Ӧ��</th><th>��ϵ��</th><th>��ϵ�绰</th><th>������</th><th>��������</th><th>��ע</th><th>����</th><th>ɾ��</th><th>�޸�</th>
          </tr>
          <%
           int i=1;
            for(expense a : ep){
              String sname=daoUtil.selectUser(a.getUserName().trim());
            out.println(
              "<tr height='23'>"+
              "<td align='center'>"+ i++ +"</td>"+
              "<td align='center'>&nbsp;"+CurrentDate.parseDate1(a.getAddDate().toString())+"</td>"+
                "<td align='center'>&nbsp;"+a.getContent()+"</td>"+ 
               "<td align='center'>&nbsp;"+a.getUnitPrice()+"</td>"+ 
              "<td align='center'>&nbsp;"+a.getNumber()+"</td>"+ 
              "<td align='center'>&nbsp;"+a.getUnit()+"</td>"+ 
              "<td align='center'>&nbsp;"+a.getTotalPrice()+"</td>"+          
             "<td align='center'>&nbsp;"+a.getSupplier()+"</td>"+ 
              "<td align='center'>&nbsp;"+a.getContactName()+"</td>"+ 
              "<td align='center'>&nbsp;"+a.getContactPhone()+"</td>"+ 
             "<td align='center'>&nbsp;"+sname+"</td>"+ 
              "<td align='center'>&nbsp;"+a.getNature()+"</td>"+ 
               "<td align='center'>&nbsp;"+a.getRemarks()+"</td>" +      
              "<td align='center'><a class='left-font01' href='detailExpense.jsp?aId="+a.getId()+"' >>></a></td>"+
              "<td align='center'><a class='left-font01' href='deleteExpenseAction.action?aId="+a.getId()+"' >>></a></td>"+
               "<td align='center'><a class='left-font01' href='modifyExpense.jsp?aId="+a.getId()+"' >>></a></td>"+             
              "</tr>");
              }                       
           %>
         
       </table>
         <table class="tablelink">
           <tr align="right">
             <td>��<%= totalsize%>����¼&nbsp;|</td>
             <td>��<%= totalPage%>ҳ&nbsp;|</td>
             <td>��ǰ��<%= currentPage%>ҳ&nbsp;|</td>
             <td><a class="tablelink" href="selectExpense.jsp?currentPage=1">��ҳ</a>&nbsp;</td>
             <td><a class="tablelink" href="selectExpense.jsp?currentPage=<%=pg.searchCurrentPage(currentPage-1) %>">��һҳ</a>&nbsp;</td>
             <td><a class="tablelink" href="selectExpense.jsp?currentPage=<%=pg.searchCurrentPage(currentPage+1)%>">��һҳ</a>&nbsp;</td>
             <td><a class="tablelink" href="selectExpense.jsp?currentPage=<%=totalPage %>">βҳ</a>&nbsp;</td>
             <td>��ת����<select name="selectPage" onchange="document.location.href=this.value">           
             <%
                for(int j=1;j<=pg.getTotalpage();j++){
                if(j==currentPage){
                out.println(
                  "<option  selected value='selectExpense.jsp?currentPage="+j+"'>&nbsp;&nbsp;"+j+"&nbsp;&nbsp;</option>");
                }else {
                 out.println(
                  "<option value='selectExpense.jsp?currentPage="+j+"'>&nbsp;&nbsp;"+j+"&nbsp;&nbsp;</option>");
                }
              }   
              %>           
             </select>ҳ</td>
           </tr>
         
         </table>
   
     
</body>
</html>