<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>web.xml에서 매핑 후 Servlet에서 직접 출력하기</h2>
	<!--
	컨텍스트루트를 제외한 상대경로로 링크를 생성한다.
	그리고 전송방식은 post로 지정한다. 
	 -->
	<form action="../13Servlet/DirectServletPrint.do" method="post">
		<input type="submit" value="바로가기"/>
	</form>
</body>
</html>