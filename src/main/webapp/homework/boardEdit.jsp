<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="./IsLoggedIn.jsp"%>
<%
String num = request.getParameter("num");
BoardDAO dao = new BoardDAO(application);
BoardDTO dto = dao.selectView(num);
String sessionId = session.getAttribute("UserId").toString();
if (!sessionId.equals(dto.getId())){
	JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
	return;
}
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

<script type="text/javascript">
	function validateForm(form) { // 폼 내용 검증
		if (form.title.value == "") {
			alert("제목을 입력하세요.");
			return false;
		}
		if (form.pass.value == "") {
			alert("내용을 입력하세요.");
			form.pass.focus();
			return false;
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
					게시판 작성 - <small>자유게시판</small>
				</h3>
				<form name="writeFrm" method="post" action="EditProcess.jsp"
					onsubmit="return validateForm(this);">
					<input type="hid den" name="num" value="<%= dto.getNum() %>" />
					<table class="table table-bordered">
						<colgroup>
							<col width="20%" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<td>제목</td>
								<td><input type="text" name="title" style="width: 90%;"
									value="<%=dto.getTitle()%>" /></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><textarea name="content"
										style="width: 90%; height: 100px;"><%=dto.getContent()%></textarea>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<button type="submit">작성 완료</button>
									<button type="reset">다시 입력</button>
									<button type="button" onclick="location.href='boardList.jsp';">
										목록 보기</button>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="row">
						<div class="col text-right mb-4">
							<!-- 각종 버튼 부분 -->
							<button type="button" class="btn btn-warning"
								onclick="location.href='boardList.jsp';">리스트보기</button>
							<button type="submit" class="btn btn-danger">전송하기</button>
							<button type="button" class="btn btn-dark">Reset</button>
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