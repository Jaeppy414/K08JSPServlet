<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
//�������� ����Ǹ� loginId��� ��Ű�� �о�´�.
String loginId = CookieManager.readCookie(request, "loginId");

//'���̵�����'üũ�ڽ��� üũ�� �ϱ����� ���� ����
String cookieCheck = "";
//�տ��� ���� ��Ű���� �ִٸ� üũ�ڽ��� checked�Ӽ��� �ο��ϱ� ���� ���� �����Ѵ�.
if(!loginId.equals("")){
	cookieCheck = "checked";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>�α��� ������</h2>
	<!-- ������ ��Ŀ�� �̵��� ���� TAB��ư�� ������ ��� �ۼ��� �±׼����� ��Ŀ���� �̵��ϰ� �ȴ�.
	�̸� ������ �� tabindex�Ӽ��� ����Ѵ�. -->
	<form action="IdSaveProcess.jsp" method="post">
	<!-- ��Ű�� ���� �о�� ���� �ִ� ��� text���ڿ��� value�Ӽ��� ���� ����� ���̵� �߰��ϰ�,
	checkbox���� checked�Ӽ��� �ο��Ѵ�. -->
	���̵� : <input type="text" name="user_id" value="<%= loginId %>" tabindex="1"/>
		<input type="checkbox" name="save_check" value="Y" <%= cookieCheck %> tabindex="3"/>
		���̵� �����ϱ�
	<br>
	�н����� : <input type="text" name="user_pw" tabindex="2"/>
	<br>
	<input type="submit" value="�α����ϱ�">
	</form>
</body>
</html>