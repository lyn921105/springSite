<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-compatible" content="IE=edge, chrome=1">
<title>Join Member</title>
<script type="text/javascript"
	src="/resources.include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/join.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript">
function errCodeCheck(){
	//에러 코드는 memberController-회원가입처리에서 정함
	var errCode='<c:out value="${errCode}"/>';
	
	if(errCode!=''){
		switch(parseInt(errCode)){
		case 1: //중복된 아이디 
			alert("이미 가입된 회원입니다.");
		break;
		
		case 2: //회원가입 실패
			alert("회원가입 처리가 실패했습니다. 잠시 후 다시 시도해 주십시오.");
		break;
		}
	}
}
</script>
</head>
<body>
	<div class="contentContainer">
		<div class="well">
			<form id="memberForm" class="form-horizontal">
				<input type="hidden" name="email" id="email" /> <input
					type="hidden" name="pinno" id="pinno" />
				<div class="form-group form group-sm">
					<label for="userId" class="col-sm-2 control-label">사용자 ID</label>
					<div class="col-sm-3">
						<input type="text" id="userId" name="userId" maxlength="12"
							class="form-control" placeholder="User ID" />
					</div>
					<div class="col-sm-2">
						<input type="button" id="idConfirmBtn" value="아이디 중복체크"
							class="form-control btn-primary" />
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="userPw" class="col-sm-2 control-label">비밀번호</label>
					<div class="col-sm-3">
						<input type="password" id="userPw" name="userPw" maxlength="15"
							class="form-control" placeholder="PassWord">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="userPwCheck" class="col-sm-2 control-label">비밀번호
						확인</label>
					<div class="col-sm-3">
						<input type="password" id="userPwCheck" name="userPwCheck"
							maxlength="15" class="form-control"
							placeholder="PassWord Confirm">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="phone" class="col-sm-2 control-label">핸드폰 번호</label>
					<div class="col-sm-3">
						<input type="text" id="phone" name="phone" maxlength="15"
							class="form-control" placeholder="Phone Number">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="birth" class="col-sm-2 control-label">생년월일</label>
					<div class="col-sm-3">
						<input type="text" id="birth" name="birth" maxlength="6"
							class="form-control" placeholder="주민등록번호 앞 6자리">
					</div>
					<div class="col-sm-2">
						<input type="text" id="gender" name="gender" maxlength="1"
							class="form-control" placeholder="주민등록번호 뒷 1자리">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="userName" class="col-sm-2 control-label">이름</label>
					<div class="col-sm-3">
						<input type="text" id="userName" name="userName" maxlength="10"
							class="form-control" placeholder="Name">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="emailName" class="col-sm-2 control-label">이메일</label>
					<div class="col-sm-3">
						<input type="text" id="emailName" name="emailName" maxlength="60"
							class="form-control" placeholder="Email">
					</div>
					<div class="col-sm-2">
						<select id="emailDomain" class="form-control">
							<option value="gmail.com">구글</option>
							<option value="naver.com">네이버</option>
							<option value="nate.com">네이트</option>
							<option value="daum.net">다음</option>
						</select>
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-6">
						<input type="button" value="확인" id="joinInsert"
							class="btn btn-default"> <input type="button" value="재작성"
							id="joinReset" class="btn btn-default"> <input
							type="button" value="취소" id="joinCancel" class="btn btn-default">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>