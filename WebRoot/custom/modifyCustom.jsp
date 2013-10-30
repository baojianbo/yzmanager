<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.*" %>  
<%@page import="com.yz.manager.dao.*" %> 
<%@page import="com.yz.manager.date.*" %> 
<%@page import="com.yz.manager.custom.bean.*" %> 
<%@page import="java.util.*"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>�ͻ���Ϣ�޸�</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#E4FAF9">
 <%
  user user=(user)session.getAttribute("us");
  if(user==null) response.sendRedirect("../index.jsp"); 
  custom ps=new custom();
    String aId=(String)request.getParameter("aId");
    
    if(aId!=null){
    ps=customDao.selectCustom(aId); 
    }
    else {
    String said=(String)request.getAttribute("said");
    if(said!=null) ps=customDao.selectCustom(said);
    }
    List<customState> cs = new ArrayList<customState>();
	cs = daoUtil.selectCustomState();
    request.setAttribute("ps",ps); 
              String dp=daoUtil.selectDepartment3(Integer.valueOf(ps.getDepartment()).intValue());
              String sname=daoUtil.selectUser(ps.getUserName().trim());
              String ct=daoUtil.selectCustomTypeName(Integer.valueOf(ps.getCustomType()).intValue());         
              String an=daoUtil.selectCustomAreaName(Integer.valueOf(ps.getAreaName()).intValue());
  %>
     <s:form action="modifyCustomAction" method="post" theme="simple">
       <table class="actionmessage" align="center" >
         <tr><td>&nbsp;</td></tr>
       <tr><td>&nbsp;</td></tr>
       <tr><td>&nbsp;</td></tr>
      <tr><td class="actionmessage"> <s:actionmessage/></td></tr>
      
            <tr><td>&nbsp;</td></tr>
       </table>
       <table class="left-font01" width="100%"  align="center" border="1" cellspacing="0" cellpadding="0" >
               <s:hidden name="id" value="%{#request.ps.id}" ></s:hidden>
          <tr height="25">   
              <td align="center" width="15%">�ͻ�����</td><td width="35%">&nbsp;<%= an %></td><td align="center" width="15%">�ͻ�����</td><td width="35%">&nbsp;<%= ct%></td>
          </tr>
           <tr height="25">
              <td align="center" width="15%">�ͻ�״̬</td>
              <td>	
						<select style="width:218px;" name="customState" size="1">
						  	<%
								for (customState s1 : cs) {
								  if(s1.getId()==ps.getCustomState()){
							%>
							<option value="<%=s1.getId()%>" selected><%=s1.getStateName()%></option>

							<%
							      }else{
							      %>
							<option value="<%=s1.getId()%>" ><%=s1.getStateName()%></option>

							<%
							      }
								}
							%>
						  
						</select>

					</td>
              <td align="center">��λ����</td><td><%= ps.getCompanyName() %></td> 
          </tr>
           
            <tr height="25">
              <td align="center">��λ��ַ</td><td><s:textfield size="40" name="companyAddress" value="%{#request.ps.companyAddress}" ></s:textfield><span class="xiugai">*���޸�</span></td><td align="center" width="15%">��ϵ��</td><td><s:textfield name="contactName" value="%{#request.ps.contactName}" ></s:textfield><span class="xiugai">*���޸�</span></td>
          </tr>
            <tr height="25">
              <td align="center">�ʱ��ַ</td><td><s:textfield name="zipCode" value="%{#request.ps.zipCode}" ></s:textfield><span class="xiugai">*���޸�</span></td><td align="center">ְλ</td><td><s:textfield name="post" value="%{#request.ps.post}" ></s:textfield><span class="xiugai">*���޸�</span></td>
          </tr>
            <tr height="25">
              <td align="center">�ֻ�����</td><td><s:textfield name="mobilePhone" value="%{#request.ps.mobilePhone}" ></s:textfield><span class="xiugai">*���޸�</span></td><td align="center">��������</td><td><s:textfield name="workPhone" value="%{#request.ps.workPhone}" ></s:textfield><span class="xiugai">*���޸�</span></td>
          </tr>
          <tr height="25">
              <td align="center">����</td><td><s:textfield name="fax" value="%{#request.ps.fax}" ></s:textfield><span class="xiugai">*���޸�</span></td>
              <td align="center">��������</td><td><s:textfield name="mail" value="%{#request.ps.mail}" ></s:textfield><span class="xiugai">*���޸�</span></td>
          </tr>
           <tr height="25">
              <td align="center">QQ����</td><td><s:textfield name="qq" value="%{#request.ps.qq}" ></s:textfield><span class="xiugai">*���޸�</span></td>
              <td align="center">��Ӳ���</td><td><%= dp %></td>
          </tr> 
           <tr height="25">
              <td align="center">�����</td><td><%= sname %></td>
              <td align="center">�������</td><td><%= CurrentDate.parseDate4(ps.getAddDate().toString()) %></td>
         
          </tr>
          <tr height="25">
            <td align="center">
						&nbsp;&nbsp;�ͻ���Ϣ������
					</td>
					<td  colspan="3">
						<input type="radio" name="rectify" value="0" checked="checked" />
						����Ҫ����&nbsp;&nbsp;
						<input type="radio" name="rectify" value="1" />
						��Ҫ��������������Ϣ����ˣ�
					</td>
          </tr>
              <tr height="25">
              <td  align="center">��ע</td><td colspan="3"><s:textarea name="remarks" value="%{#request.ps.remarks}" cols="40" rows="4" ></s:textarea><span class="xiugai">*���޸�</span></td>
          </tr>
           <tr height="25">
            <td align="center" colspan="4">
              <s:submit name="submit" style="font-size:14px"value="��  ��"></s:submit>&nbsp;&nbsp;
              <s:reset name="reset" style="font-size:14px"value="��  ��"></s:reset>             
            <br></td>
          </tr>
       </table>
   </s:form>
</body>
</html>