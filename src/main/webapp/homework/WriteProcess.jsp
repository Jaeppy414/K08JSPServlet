<%@page import="utils.JSFunction"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- 글쓰기 페이지에 오랫동안 머물러 세션이 삭제되는 경우가 있으므로
	    글쓰기 처리 페이지에서도 반드시 로그인을 확인해야 한다. -->
	<%@include file="./IsLoggedIn.jsp"%>
<%
//클라이언트가 작성한 폼값을 받는다. 작성자 비번 제목 내용 첨부파일
String title = request.getParameter("title");
String content = request.getParameter("content");

BoardDTO dto = new BoardDTO();
dto.setTitle(title);
dto.setContent(content);
/* 특히 아이디의 경우 로그인 후 작성페이지에 진입할 수 있으므로
세션영역에 저장된 회원아이디를 가져와서 DTO에 저장한다.*/
dto.setId(session.getAttribute("UserId").toString());

//DB연결을 위해 DAO객체를 생성한다.
BoardDAO dao = new BoardDAO(application);
//입력값이 저장된 DTO객체를 인수로 전달하여 insert쿼리문을 실행한다.
int iResult = dao.insertWrite(dto);
//자원해제
dao.close();

if (iResult == 1) {
	response.sendRedirect("boardList.jsp");
} else {
	JSFunction.alertBack("글쓰기에 실패했습니다.", out);
}
%>
