<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<!-- [if It IE 9 -->
<script type="text/javascript">
	src = "resources/includes/js/jquery-1.12.4.min.js" >
</script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="resources/include/js/login.js"></script>
<script type="text/javascript">
	function errCodeCheck() {
		var errCode = '<c:out value="${errCode}"/>';
		if (errCode != "") {
			switch (parseInt(errCode)) {
			case 1:
				alert("아이디 또는 비민번호 불일치 또는 미가입 \n회원. 다시 로그인 해주세요  ");
				break;

			case 3:
				alert("회원탈퇴에 오류 발생 \n 다시 시도해주세요")
				break;
			case 6:
				alert("5번이상 로그인 시도로 30초동안 로그인하실수 없습니다 \n잠시후 다시 시도해 주세요");
				break;
			}

		}

	}
</script>
</head>
<body>
	<div class="contentContainer">
		<div class="well">
			<c:if test="${login.userId == null or login.userId == ''}">
				<form id="loginForm" class="form-horizontal">
					<div class="form-group">
						<label for="userId" class="col-sm-2 control-label"> 아이디 </label>
						<div class="col-sm-4">
							<input type="text" id="userId" name="userId" class="form-control"
								placeholder="ID">
						</div>
						<p class="form-control-static error"></p>
					</div>
					<div class="form-group">
						<label for="userPw" class="col-sm-2 control-label"> 비밀번호</label>
						<div class="col-sm-4">
							<input type="password" id="userPw" name="userPw"
								class="form-control" placeholder="Password">
						</div>
						<p class="form-control-static error"></p>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-6">
							<input type="button" value="로그인 " id="loginBtn"
								class="btn btn-default" />
						</div>
					</div>
				</form>
			</c:if>
			<c:if test="${login.userId != null and login.userId != ''}">
				<legend>
					<strong>[ ${login.userName} ]님 반갑습니다</strong> <span id="membermenu"
						class="tac"> <a href="/member/logout.do">로그아웃</a>
						&nbsp;&nbsp;&nbsp; <a href="/member/modify.do">정보수정(비밀번호 변경)</a>&nbsp;&nbsp;&nbsp;;
						<a href="/member/delete.do">회원탈퇴</a>
					</span>
				</legend>
			</c:if>
		</div>
	</div>
</body>
</html>