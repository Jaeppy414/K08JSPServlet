<%@page import="model1.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");
BoardDAO dao = new BoardDAO(application);
dao.updateVistiCount(num);
BoardDTO dto = dao.selectView(num);
dao.close();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	
<script>
//게시물 삭제를 위한 Javascript 함수
function deletePost() {
	//confirm() 함수는 대화창에서 "예"를 누를 때 true가 반환된다.
    var confirmed = confirm("정말로 삭제하겠습니까?"); 
    if (confirmed) {
    	//<form>의 name속성을 통해 DOM을 가져온다.
        var form = document.writeFrm;   
    	//전송방식과 폼값을 전송할 URL을 설정한다.
        form.method = "post"; 
        form.action = "DeleteProcess.jsp"; 
        //sublit()함수를 통해 폼값을 전송한다.
        form.submit();       
        //<form>태그 하위의 hidden박스에 설정된 일련번호가 전송된다.
    }
}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<!-- 상단 네비게이션 인클루드 -->
			<%@ include file="./inc/top.jsp"%>
		</div>
		<div class="row">
			<!-- 왼쪽 메뉴 인클루드 -->
			<%@ include file="./inc/left.jsp"%>
			<div class="col-9 pt-3">
				<h3>
					게시판 내용보기 - <small>자유게시판</small>
				</h3>

				<form name="writeFrm">
					<input type="hid-den" name="num" value="<%=num%>" />
					<table class="table table-bordered">
						<colgroup>
							<col width="20%" />
							<col width="30%" />
							<col width="20%" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<th class="text-center" style="vertical-align: middle;">작성자</th>
								<td><%=dto.getName()%></td>
								<th class="text-center" style="vertical-align: middle;">작성일</th>
								<td><%=dto.getPostdate()%></td>
							</tr>
							<tr>
								<th class="text-center" style="vertical-align: middle;">이메일</th>
								<td>nakjasabal@naver.com</td>
								<th class="text-center" style="vertical-align: middle;">조회수</th>
								<td><%=dto.getVisitcount()%></td>
							</tr>
							<tr>
								<th class="text-center" style="vertical-align: middle;">제목</th>
								<td colspan="3"><%=dto.getTitle()%></td>
							</tr>
							<tr>
								<th class="text-center" style="vertical-align: middle;">내용</th>
								<td colspan="3" height="100"><%=dto.getContent().replace("\r\n", "<br/>").replace(" ", "&nbsp")%>
								</td>
							</tr>
							<tr>
								<th class="text-center" style="vertical-align: middle;">첨부파일</th>
								<td colspan="3">파일명.jpg</td>
							</tr>
						</tbody>
					</table>

					<div class="row">
						<div class="col text-right mb-4">
							<!-- 각종 버튼 부분 -->
							
							<%
							if(session.getAttribute("UserId") != null && dto.getId().equals(session.getAttribute("UserId").toString())){
							%>							
							<button type="button" class="btn btn-secondary"
								onclick="location.href='boardEdit.jsp?num=<%= dto.getNum() %>';">수정하기</button>
							<button type="submit" class="btn btn-success" onclick="deletePost();">삭제하기</button>
							<%
							}
							%>
							<button type="button" class="btn btn-warning"
								onclick="location.href='boardList.jsp';">리스트보기</button>
							<button type="submit" class="btn btn-dark">Reset</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div
			class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
		<div class="row mb-5 mt-3">
			<!-- 카피라이트 부분 인클루드 -->
			<%@ include file="./inc/copyright.jsp"%>
		</div>
	</div>
</body>
</html>