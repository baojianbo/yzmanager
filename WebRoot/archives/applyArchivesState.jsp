<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.*" %>  
<%@page import="com.yz.manager.dao.*" %> 
<%@page import="com.yz.manager.date.*" %> 
<%@page import="com.yz.manager.page.*" %> 
<%@page import="com.yz.manager.archives.bean.*" %> 
<%@page import="java.util.*" %> 
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="struts" uri="/struts-dojo-tags" %>
<%
      user user=(user)session.getAttribute("us");
      if(user==null) response.sendRedirect("../index.jsp"); 
      
      String averify=request.getParameter("averify").trim();  
      request.setAttribute("averify",averify);
      String averify1=(String)request.getAttribute("averify");	
      List<secondClass> sc=new ArrayList<secondClass>();
      sc=daoUtil.selectSecondClassId(user.getDepartment());
     
      List<user> u=new ArrayList<user>();
      u=daoUtil.selectDoubleUserId();	
      List<firstClass> fc=new ArrayList<firstClass>();
	  String department=user.getDepartment().trim();
	  String systemName="1";
      fc=daoUtil.selectFirstClassId(department,systemName);
	  List<department> sdp=new ArrayList<department>();
	  sdp=daoUtil.selectDepartmentId();	  

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
		document.myform.secondCName.options[0]=new Option('ѡ���������','0'); 
		for(i=0;i<onecount;i++){
		if (subcat[i][2] == locationid) 
		{ 
		document.myform.secondCName.options[document.myform.secondCName.length] = new Option(subcat[i][1], subcat[i][0]); 
		} 
		} 		   
		}
		</script>

<script language="javascript">
		var onecount3;
		onecount3=0;
		subcat3=new  Array();  
		<%
		int count3=0;
		for(user u1 : u){
		 %>
		 subcat3[<%=count3%>]=new Array("<%= u1.getUserName()%>","<%=u1.getName()%>","<%=u1.getDepartment()%>");
		 <%
		 count3 = count3 + 1 ; 	
		}
		%>
		onecount3=<%=count3%>;
		function changelocation3(locationid3){
		document.myform.saveArName.length=0;
		var locationid3=locationid3;
		var k;
		document.myform.saveArName.options[0]=new Option('ѡ��浵�û�','0'); 
		for(k=0;k<onecount3;k++){
		if (subcat3[k][2] == locationid3) 
		{ 
		document.myform.saveArName.options[document.myform.saveArName.length] = new Option(subcat3[k][1], subcat3[k][0]); 
		} 
		} 		   
		}
		</script>
</head>
<body bgcolor="#E4FAF9">
 <%
     PageSet pg=new PageSet(archivesDao.selectArchivesByVerifySize(user.getUserName(),Integer.valueOf(averify).intValue()),15);  
     int totalsize=pg.getTotalsize();
     int totalPage=pg.getTotalpage();
     int currentPage=Integer.valueOf(request.getParameter("currentPage")).intValue();
     List<archives> ar=new ArrayList<archives>();
     if(averify1!=null)averify=averify1;
     ar=archivesDao.selectArchivesByVerify(user.getUserName(),Integer.valueOf(averify).intValue(),currentPage,pg.getPagesize());
     
  %>   
    <s:form name="myform" action="applyArchivesByOption?currentPage=1" method="post" theme="simple" >
      <table  class="left-font01" align="center" border="0" cellspacing="0" cellpadding="0" >
        <tr><td><s:hidden name="averify" value="%{#request.averify}"/></td></tr>
          <tr>
              <td >ϵͳ���ࣺ</td> 
              <td>
                <select name="firstCName" style="width:120px;" onChange="changelocation(document.myform.firstCName.options[document.myform.firstCName.selectedIndex].value)" size="1"> 
              <option selected value="0"></option>
               <% 
		
		   for(firstClass f :fc){
		    %> 
		  <option value="<%= f.getId()%>"><%=f.getFirstCName()%></option> 
		
		 <% }
        %>      
            </select>
            <select name="secondCName" style="width:120px;"  size="1"> 
              <option selected value="0"></option> 
                 </select>              
          </td>      
      
        <td > &nbsp;&nbsp;�浵���ţ�</td>
             <td > 
             <select  name="saveArDepartment"  style="width:120px;" onChange="changelocation3(document.myform.saveArDepartment.options[document.myform.saveArDepartment.selectedIndex].value)" size="1"> 
              <option selected value="0"></option>      
        <% 
		
		   for(department d :sdp){
		    %> 
		  <option value="<%= d.getDepartmentId()%>"><%=d.getDepartment()%></option> 
		
		 <% }
        %> 
            </select>
        </td>
         <td>&nbsp;&nbsp;�浵��:</td>
         <td >
            <select name="saveArName" style="width:120px;" size="1"> 
              <option selected value="0"></option>   
            </select>   
          
         </td>
         </tr>
          <tr><td>&nbsp;</td></tr>
         <tr>
        <td>�浵����:</td>
           <td>
           	  <struts:datetimepicker  cssStyle="width:120px;" name="saveArDateBegin" displayFormat="yyyy-MM-dd"  />                       
                ��<struts:datetimepicker cssStyle="width:120px;" name="saveArDateEnd" displayFormat="yyyy-MM-dd"  />                         
           </td>          
           <td>&nbsp;&nbsp;�ļ�����:</td>
          <td> <s:textfield name="fileName" size="22"></s:textfield></td>
          
          <td>
          </td>
              <td> &nbsp;&nbsp;<s:submit style="font-size:14px" name="submit" value="��  ��"></s:submit>  </td>                     
         </tr>
       <tr><td>&nbsp;</td></tr>
        </table>
      </s:form>
  
   
      <table class="left-font01" align="center" border="0" cellspacing="0" cellpadding="0" >
          <tr class="tableth">
           <%
            if("0".equals(averify)){
             out.println(
               "<td><a target='main' class='left-font01' style='color : red' href='applyArchivesState.jsp?averify=0&currentPage=1'>δ���</a></td>"+
               "<td>&nbsp;&nbsp;&nbsp;&nbsp;</td> "
             );
            }else{
               out.println(
               "<td><a target='main' class='left-font01'  href='applyArchivesState.jsp?averify=0&currentPage=1'>δ���</a></td>"+
               "<td>&nbsp;&nbsp;&nbsp;&nbsp;</td> "
             );
            }
            
            if("1".equals(averify)){
             out.println(
               "<td><a target='main' class='left-font01' style='color : red' href='applyArchivesState.jsp?averify=1&currentPage=1'>���ͨ��</a></td>"+
               "<td>&nbsp;&nbsp;&nbsp;&nbsp;</td> "
             );
            }else{
               out.println(
               "<td><a target='main' class='left-font01'  href='applyArchivesState.jsp?averify=1&currentPage=1'>���ͨ��</a></td>"+
               "<td>&nbsp;&nbsp;&nbsp;&nbsp;</td> "
             );
            }
             if("2".equals(averify)){
             out.println(
               "<td><a target='main' class='left-font01' style='color : red' href='applyArchivesState.jsp?averify=2&currentPage=1'>���δͨ��</a></td>"+
               "<td>&nbsp;&nbsp;&nbsp;&nbsp;</td> "
             );
            }else{
               out.println(
               "<td><a target='main' class='left-font01'  href='applyArchivesState.jsp?averify=2&currentPage=1'>���δͨ��</a></td>"+
               "<td>&nbsp;&nbsp;&nbsp;&nbsp;</td> "
             );
            }
           %>                               
         </tr>
      
        </table>
    
     
       <table class="left-font01" width="100%"  align="center" border="1" cellspacing="0" cellpadding="0" >
          
          <%
		          if("0".equals(averify)){
		            out.println(
		             "<tr height='23' class='tableth'bgcolor='#8E8EFF'>"+
		             "<th>���</th><th>�ļ�����</th><th>�ļ����Ӱ�</th><th>�������</th><th>������</th><th>��������</th><th>״̬</th><th>����</th><th>ɾ��</th>"+
		             "</tr>"
		            );
		            int j=1;;
		            for(archives a : ar){
		           
		            out.println(
		              "<tr height='23'>"+
		              "<td align='center'>"+ j++ +"</td>"+
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
		              "<td align='center'>"+a.getGiveArName()+"</td>" + 
		              "<td align='center'>"+CurrentDate.parseDate1(a.getArDate().toString())+"</td>"+
		              "<td align='center'>δ���</td>" +   
		              "<td align='center'><a class='left-font01' href='detailArchives.jsp?aId="+a.getId()+"' >>></a></td>"+         
		              "<td align='center'><a class='left-font01' href='deleteArchivesAction1.action?aId="+a.getId()+"&averify=0' >>></a></td>"+           
		              "</tr>");
		              }   
		             }                     
		             else if("1".equals(averify)){
		            out.println(
		             "<tr height='23' class='tableth'bgcolor='#8E8EFF'>"+
		             " <th>���</th><th>�ļ�����</th><th>�ļ����Ӱ�</th><th>�������</th><th>������</th><th>��������</th><th>״̬</th><th>�浵��</th><th>�浵����</th><th>����</th>"+
		             "</tr>"
		            );
		            int i=1;
		            for(archives a : ar){
		             String sname=daoUtil.selectUser(a.getSaveArName());
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
		              "<td align='center'>"+a.getGiveArName()+"</td>" + 
		              "<td align='center'>"+CurrentDate.parseDate1(a.getArDate().toString())+"</td>"+
		              "<td align='center'>ͨ��</td>" +  
		              "<td align='center'>"+sname+"</td>" + 
		              "<td align='center'>"+CurrentDate.parseDate1(a.getSaveArDate().toString())+"</td>"+     
		              "<td align='center'><a class='left-font01' class='left-font01' href='detailArchives.jsp?aId="+a.getId()+"' >>></a></td>"+     
		              "</tr>");
		              }   
		             }                     
		            else if("2".equals(averify)){
		            out.println(
		             "<tr height='23' class='tableth'bgcolor='#8E8EFF' >"+
		             "<th>���</th><th>�ļ�����</th><th>�ļ����Ӱ�</th><th>�������</th><th>������</th><th>��������</th><th>״̬</th><th>����</th><th>ɾ��</th>"+
		             "</tr>"
		            );
		            int k=1;
		            for(archives a : ar){
		           
		            out.println(
		              "<tr height='23'>"+
		               "<td align='center'>"+ k++ +"</td>"+
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
		              "<td align='center'>"+a.getGiveArName()+"</td>" + 
		              "<td align='center'>"+CurrentDate.parseDate1(a.getArDate().toString())+"</td>"+
		              "<td align='center'>δͨ��</td>" +  
		               "<td align='center'><a class='left-font01' href='detailArchives.jsp?aId="+a.getId()+"' >>></a></td>"+     
		              "<td align='center'><a  class='left-font01' href='deleteArchivesAction1.action?aId="+a.getId()+"&averify=2' >>></a></td>"+
		              "</tr>");
		              }   
		             }  
		      
		           %>
         
       </table>
        <table class="tablelink">
           <tr align="right">
             <td>��<%= totalsize%>����¼&nbsp;|</td>
             <td>��<%= totalPage%>ҳ&nbsp;|</td>
             <td>��ǰ��<%= currentPage%>ҳ&nbsp;|</td>
             <td><a class="tablelink" href="applyArchivesState.jsp?averify=<%=averify %>&currentPage=1">��ҳ</a>&nbsp;&nbsp;</td>
             <td><a class="tablelink" href="applyArchivesState.jsp?averify=<%=averify %>&currentPage=<%=pg.searchCurrentPage(currentPage-1) %>">��һҳ</a>&nbsp;&nbsp;</td>
             <td><a class="tablelink" href="applyArchivesState.jsp?averify=<%=averify %>&currentPage=<%=pg.searchCurrentPage(currentPage+1)%>">��һҳ</a>&nbsp;&nbsp;</td>
             <td><a class="tablelink" href="applyArchivesState.jsp?averify=<%=averify %>&currentPage=<%=totalPage %>">βҳ</a>&nbsp;&nbsp;</td>
             <td>��ת����<select name="selectPage" onchange="document.location.href=this.value">         
             <%
                for(int j=1;j<=pg.getTotalpage();j++){
                 if(j==currentPage){
                   out.println(
                  "<option selected value='applyArchivesState.jsp?averify="+averify+"&currentPage="+j+"'>&nbsp;&nbsp;"+j+"&nbsp;&nbsp;</option>");
                 }else{
                 out.println(
                  "<option value='applyArchivesState.jsp?averify="+averify+"&currentPage="+j+"'>&nbsp;&nbsp;"+j+"&nbsp;&nbsp;</option>");
              }
              }   
              %>           
             </select>ҳ</td>
           </tr>
         
         </table>
   
   
     
</body>
</html>