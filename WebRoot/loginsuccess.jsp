<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="gb2312"%>
<%@page import="com.yz.manager.bean.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>�Ϻ��Ϻ����ذ칫�ۺϹ���ϵͳ</title>
	</head>
	<%
		user user = (user) session.getAttribute("us");
		if (user == null)
			response.sendRedirect("index.jsp");
	%>
	<frameset rows="60,*">
		<frame name="top" scrolling="no" noresize src="top.jsp" target="main">
		<frameset cols="200,*">
			<frame name="left" scrolling="auto" noresize src="left.jsp"
				target="main">
			<frame name="main" scrolling="auto" src="./personal/selectMyPersonal.jsp?currentPage=1">
		</frameset>
		<noframes>
			<body>

				<p>
					����ҳʹ���˿�ܣ��������������֧�ֿ�ܡ�
				</p>

			</body>
		</noframes>
	</frameset>

</html>