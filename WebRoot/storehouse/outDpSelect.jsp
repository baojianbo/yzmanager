<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.*" %>  
<%@page import="com.yz.manager.dao.*" %> 
<%@page import="com.yz.manager.date.*" %> 
<%@page import="com.yz.manager.page.*" %> 
<%@page import="com.yz.manager.storehouse.bean.*" %> 
<%@page import="java.util.*" %> 
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="struts" uri="/struts-dojo-tags" %>
<% 
      user user=(user)session.getAttribute("us");
      if(user==null) response.sendRedirect("../index.jsp"); 
     
      List<department> dp=new ArrayList<department>();
	  dp=daoUtil.selectDepartmentId();	
       power pw=user.getPower();
      List<shouse> sh1=new ArrayList<shouse>();
      if(pw.isDepartmentManager()){
        sh1=daoUtil.selectShouse(user.getDepartment());	
      }else{
        sh1=daoUtil.selectShouseManager(user.getUserName());	
      }
	  List<firstClass> fc = new ArrayList<firstClass>();
	  fc = daoUtil.selectAllHouseFirstClass2();
	  
	  List<secondClass> sc = new ArrayList<secondClass>();
	  sc = daoUtil.selectAllHouseSecondClass();
	  
	  List <user> allUser=new ArrayList<user>();
	  allUser=daoUtil.selectUser();
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<struts:head/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
 <script language="javascript">
			function changelocation6(locationid){
			var onecount6;
			onecount6=0;
			subcat6=new  Array();  
			<%
			int count6=0;
			for(user u6: allUser){
			 %>
			 subcat6[<%=count6%>]=new Array("<%= u6.getUserName()%>","<%=u6.getName()%>","<%=u6.getDepartment()%>");
			 <%
			 count6 = count6 + 1 ; 	
			}
			%>
			onecount6=<%=count6%>;	
			document.myform.userName.length=0;
		    document.myform.userName.options[0]=new Option('选择领用人','0'); 	
			var i6; 
			for(i6=0;i6<onecount6;i6++){
			if (subcat6[i6][2] == locationid) 
			{ 
			document.myform.userName.options[document.myform.userName.length] = new Option(subcat6[i6][1], subcat6[i6][0]); 
			} 			   
			}
			}
			
     </script>        
		<script language="javascript">
		var onecount4;
		onecount4=0;
		subcat4=new  Array();  
		<%
		int count4=0;
		for(firstClass f : fc){
		 %>
		 subcat4[<%=count4%>]=new Array("<%=f.getId()%>","<%=f.getFirstCName()%>","<%=f.getHouseId()%>");
		 <%
		 count4 = count4 + 1 ; 	
		}
		%>
		onecount4=<%=count4%>;
		function changelocation4(locationid){
		document.myform.firstCName.length=0;
		var locationid=locationid;
		var i4;
		document.myform.firstCName.options[0]=new Option('选择物品分类','0'); 
		for(i4=0;i4<onecount4;i4++){
		if (subcat4[i4][2] == locationid) 
		{ 
		document.myform.firstCName.options[document.myform.firstCName.length] = new Option(subcat4[i4][1], subcat4[i4][0]); 
		} 
		} 	
			document.myform.secondCName.length=0;
			document.myform.secondCName.options[0]=new Option('选择物品','0'); 	   
		}
		</script>
        
        
		<script language="javascript">
		var onecount;
		onecount=0;
		subcat=new  Array();  
		<%
		int count=0;
		for(secondClass s : sc){
		 %>
		 subcat[<%=count%>]=new Array("<%=s.getId()%>","<%=s.getSecondCName()%>","<%=s.getFirstCName()%>");
		 <%
		 count = count + 1 ; 	
		}
		%>
		onecount=<%=count%>;
		function changelocation(locationid){
		document.myform.secondCName.length=0;
		var locationid=locationid;
		var i;
		document.myform.secondCName.options[0]=new Option('选择物品','0'); 
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
     String outVerify="3";
     request.setAttribute("outVerify","3");
     PageSet pg=new PageSet(storeHouseDao.selectOutStoreByVerifySize(user.getUserName(),Integer.valueOf(outVerify).intValue()),15);  
     int totalsize=pg.getTotalsize();
     int totalPage=pg.getTotalpage();
     int currentPage=Integer.valueOf(request.getParameter("currentPage")).intValue();
     List<outStoreHouse> sh=new ArrayList<outStoreHouse>();
    
     sh=storeHouseDao.selectOutHouseByUserName(user.getUserName(),Integer.valueOf(outVerify).intValue(),currentPage,pg.getPagesize());
     
  %>   
    <s:form name="myform" action="outDpSelectByOption?currentPage=1" method="post" theme="simple" >
      <table  class="left-font01" align="center" border="0" cellspacing="0" cellpadding="0" >
        <tr><td><s:hidden name="outVerify" value="%{#request.outVerify}"/></td></tr>
         <s:hidden name="department" value="%{#session.us.department}" ></s:hidden>     
       <tr>
		<td  align="center"> 领用部门：</td>
             <td > 
             <select  name="applyDepartment" style="width:200px;" onChange="changelocation6(document.myform.applyDepartment.options[document.myform.applyDepartment.selectedIndex].value)" size="1"> 
              <option selected value="0">选择部门</option> 
            <% 
		
		   for(department d1 :dp){
		    %> 
		  <option value="<%= d1.getDepartmentId()%>"><%=d1.getDepartment()%></option> 
		
		 <% }
        %> 
            </select>
        </td>
            <td > &nbsp;&nbsp;领用人:</td>
             <td  >
                  <select name="userName"  style="width:200px;" size="1"> 
           <option selected value="0">选择领用人</option> 
            </select>          
            
             </td>
      </tr>
        <tr>
					<td>
						&nbsp;
					</td>
				</tr>
          <tr>      
            <td align="center">物品库房：</td>
             <td > 
             <select  name="houseId" style="width:200px;" onChange="changelocation4(document.myform.houseId.options[document.myform.houseId.selectedIndex].value)" size="1" > 
                 <option selected value="0">选择库房</option>           
                 <%
								for (shouse s : sh1) {
							%>
							<option value="<%=s.getId()%>"><%=s.getHouseName()%></option>

							<%
								}
							%>
            </select>
            </td>
            <td align="center">
						&nbsp;&nbsp;分类：
					</td>
					<td>
						<select style="width: 200px;" name="firstCName"
							onChange="changelocation(document.myform.firstCName.options[document.myform.firstCName.selectedIndex].value)"
							size="1">
							<option selected value="0">
								选择分类
							</option>
						</select>
					</td>
            </tr>
            <tr>
					<td>
						&nbsp;
					</td>
				</tr>
				<tr>
					<td align="center">
						物品名称：
					</td>
					<td>
						<select style="width: 200px;" name="secondCName" size="1">
							<option selected value="0">
								选择物品
							</option>
						</select>

					</td>
					 <td align="center">&nbsp;&nbsp;日期:</td>
           <td>
           	  <struts:datetimepicker  cssStyle="width:100px;" name="addDateBegin" displayFormat="yyyy-MM-dd"  />                       
                到<struts:datetimepicker cssStyle="width:100px;" name="addDateEnd" displayFormat="yyyy-MM-dd"  />                         
           </td> 
           <td align="center"> &nbsp;&nbsp;<s:submit style="font-size:14px" name="submit" value="查  找"></s:submit> </td><td>
             &nbsp;<a class="left-font01" href="outSelectExportAction.action">出库导出</a></td>                               
      </tr>
   
          <tr>
					<td>
						&nbsp;
					</td>
				</tr>
        </table>
      </s:form>
 
       <table class="left-font01" width="100%"  align="center" border="1" cellspacing="0" cellpadding="0" >
          
          <%
		        out.println(
		             "<tr height='23' class='tableth'bgcolor='#8E8EFF'>"+
		              "<th>序号</th><th>出库日期</th><th>领用部门</th><th>领用人</th><th>领用库房</th><th>物品分类</th><th>物品名称</th><th>出库数量</th><th>单位</th><th>部门审核人</th><th>库房审核人</th><th>库管员</th><th>详情</th>"+
		             "</tr>"
		            );
		            int k=1;;
		            for(outStoreHouse e : sh){
                       String shn=daoUtil.selectShouseName(Integer.valueOf(e.getHouseId()).intValue());
                       String fn=daoUtil.selectFirstClass5(Integer.valueOf(e.getFirstCName()).intValue());
                       String sn=daoUtil.selectSecondClass8(e.getSecondCName());
                       String adp=daoUtil.selectDepartment3(Integer.valueOf(e.getApplyDepartment()).intValue());
		             out.println(
		              "<tr height='23'>"+
		              "<td align='center'>"+ k++ +"</td>"+
		               "<td align='center'>&nbsp;"+CurrentDate.parseDate1(e.getOutDate().toString())+"</td>"+
		                "<td align='center'>&nbsp;"+adp+"</td>" + 
		               "<td align='center'>&nbsp;"+daoUtil.selectUser(e.getUserName())+"</td>"+
		              "<td align='center'>&nbsp;"+shn+"</td>" + 
		               "<td align='center'>&nbsp;"+fn+"</td>" + 
		               "<td align='center'>&nbsp;"+sn+"</td>" + 
		                "<td align='center'>&nbsp;"+e.getApplyCount()+"</td>" + 
		              "<td align='center'>&nbsp;"+e.getUnit()+"</td>" + 
		              "<td align='center'>&nbsp;"+daoUtil.selectUser(e.getInVerifyName())+"</td>"+
		              "<td align='center'>&nbsp;"+daoUtil.selectUser(e.getHouseVerifyName())+"</td>"+
		              "<td align='center'>&nbsp;"+daoUtil.selectUser(e.getHouseManager())+"</td>");
		               out.println("<td align='center'><a class='left-font01' href='detailOutStore.jsp?aId="+e.getId()+"' >>></a></td>");
		               out.println( "</tr>");
		         } 
		         %>
         
       </table>
        <table class="tablelink">
           <tr align="right">
             <td>共<%= totalsize%>条记录&nbsp;|</td>
             <td>共<%= totalPage%>页&nbsp;|</td>
             <td>当前第<%= currentPage%>页&nbsp;|</td>
             <td><a class="tablelink" href="outDpSelect.jsp?currentPage=1">首页</a>&nbsp;&nbsp;</td>
             <td><a class="tablelink" href="outDpSelect.jsp?currentPage=<%=pg.searchCurrentPage(currentPage-1) %>">上一页</a>&nbsp;&nbsp;</td>
             <td><a class="tablelink" href="outDpSelect.jsp?currentPage=<%=pg.searchCurrentPage(currentPage+1)%>">下一页</a>&nbsp;&nbsp;</td>
             <td><a class="tablelink" href="outDpSelect.jsp?currentPage=<%=totalPage %>">尾页</a>&nbsp;&nbsp;</td>
             <td>跳转到第<select name="selectPage" onchange="document.location.href=this.value">         
             <%
                for(int j=1;j<=pg.getTotalpage();j++){
                 if(j==currentPage){
                   out.println(
                  "<option selected value='outDpSelect.jsp?currentPage="+j+"'>&nbsp;&nbsp;"+j+"&nbsp;&nbsp;</option>");
                 }else{
                 out.println(
                  "<option value='outDpSelect.jsp?currentPage="+j+"'>&nbsp;&nbsp;"+j+"&nbsp;&nbsp;</option>");
              }
              }   
              %>           
             </select>页</td>
           </tr>
         
         </table>
   
   
     
</body>
</html>