<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="gb2312"%>
<%@page import="java.util.*"%>
<%@page import="com.yz.manager.dao.daoUtil"%>
<%@page import="com.yz.manager.bean.*"%>
<%@page import="com.yz.manager.custom.bean.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
	user user = (user) session.getAttribute("us");
	if (user == null)
		response.sendRedirect("index.jsp");

	List<customArea> ca = new ArrayList<customArea>();
	ca = daoUtil.selectUserAreaByUser(user.getDepartment(),user.getUserName());
	
	List<customType> ct = new ArrayList<customType>();
	ct = daoUtil.selectCustomType();
	
	List<customState> cs = new ArrayList<customState>();
	cs = daoUtil.selectCustomState();
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>add custom</title>
		<link href="../css/css.css" rel="stylesheet" type="text/css" />
	</head>
	<body bgcolor="#E4FAF9">

		<table align="center" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td class="actionmessage">
					<s:actionmessage />
				</td>
			</tr>
			 <tr>
                 <td class="actionmessage">
						<s:fielderror>
							<s:param>companynull</s:param>
						</s:fielderror>
				</td>
				<td class="actionmessage">
						<s:fielderror>
							<s:param>namenull</s:param>
						</s:fielderror>
				</td>
			</tr>	
				 <tr>
                 <td class="actionmessage">
						<s:fielderror>
							<s:param>addressnull</s:param>
						</s:fielderror>
				</td>
				<td class="actionmessage">
						<s:fielderror>
							<s:param>zipnull</s:param>
						</s:fielderror>
				</td>
			</tr>	
		</table>
	
		<s:form name="myform" action="addCustomAction"
			 method="post" theme="simple">
			<s:token></s:token>
			<s:hidden name="userName" value="%{#session.us.userName}"></s:hidden>
			<s:hidden name="department" value="%{#session.us.department}"></s:hidden>
			<table class="left-font01" align="center" border="0" cellspacing="0" cellpadding="0">
               <tr><td>&nbsp;</td></tr>
                  
				<tr>
					<td align="center">
						�ͻ�����
					</td>
					<td>
						<select style="width:218px;" name="areaName">	
							<%
								for (customArea f2 : ca) {
							%>
							<option value="<%=f2.getId()%>"><%=f2.getAreaName()%></option>

							<%
								}
							%>
						</select>
						</td>				
					
				</tr>
				 <tr><td>&nbsp;</td></tr>
				<tr>
					<td align="center">
						�ͻ����ͣ�
					</td>
					<td>
						<select style="width:218px;" name="customType">	
							<%
								for (customType f : ct) {
							%>
							<option value="<%=f.getId()%>"><%=f.getTypeName()%></option>

							<%
								}
							%>
						</select>
						</td>
					<td align="center">
						&nbsp;&nbsp;�ͻ�״̬��
					</td>
					<td>	
						<select style="width:218px;" name="customState" size="1">
						  	<%
								for (customState s1 : cs) {
							%>
							<option value="<%=s1.getId()%>"><%=s1.getStateName()%></option>

							<%
								}
							%>
						  
						</select>

					</td>
					
				</tr>
                  <tr><td>&nbsp;</td></tr>
				<tr>
				 	<td align="center">
						��λ���ƣ�
					</td>
					<td align="center">
						<s:textfield name="companyName" size="30"></s:textfield>
					</td>
					<td align="center">
						&nbsp;&nbsp;��ϵ�ˣ�
					</td>
					<td align="center">
						<s:textfield name="contactName" size="30"></s:textfield>
					</td>
				</tr>
                  <tr><td>&nbsp;</td></tr>
				<tr>
					<td align="center">
						��  ����
					</td>
					<td align="center">
						<s:textfield name="mobilePhone" size="30"></s:textfield>
					</td>
			
					<td align="center">
						&nbsp;&nbsp;�̶��绰��
					</td>
					<td align="center">
						<s:textfield name="workPhone" size="30"></s:textfield>
					</td>		
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td align="center">
						��  �棺
					</td>
					<td align="center">
						<s:textfield name="fax" size="30"></s:textfield>
					</td>		
					<td align="center">
						&nbsp;&nbsp;ְ  ��
					</td>
					<td align="center">
						<s:textfield name="post" size="30"></s:textfield>
					</td>	
				</tr>
				<tr><td>&nbsp;</td></tr>
				 <tr>
					<td align="center">
						��λ��ַ��
					</td>
					<td align="center">
						<s:textfield name="companyAddress" size="30"></s:textfield>
					</td>	

					<td align="center">
						&nbsp;&nbsp;�������룺
					</td>
					<td align="center">
						<s:textfield name="zipCode" size="30"></s:textfield>
					</td>		
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td align="center">
						�����ʼ���
					</td>
					<td align="center">
						<s:textfield name="mail" size="30"></s:textfield>
					</td>			

					<td align="center">
						&nbsp;&nbsp;QQ���룺
					</td>
					<td align="center">
						<s:textfield name="qq" size="30"></s:textfield>			
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td align="center">
						�� ע��
					</td>
					<td colspan="3" >
						<s:textarea name="remarks" cols="50" rows="4"></s:textarea>
					</td>
				</tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td colspan="4" align="center">
						<s:submit name="submit" value="�ύ����"></s:submit>&nbsp;&nbsp;
						<s:reset name="reset" value="��������"></s:reset>
						<br>
					</td>
				</tr>
			</table>
		</s:form>
	</body>
</html>