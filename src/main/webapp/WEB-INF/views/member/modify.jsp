<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="email" value="${fn:split(member.email,'@' }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Member</title>
<script type="text/javascript"
	src="/resources.include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/include/js/common.js"></script>
<script type="text/javascript" src="/resources/include/js/modify.js"></script>
<script type="text/javascript">
	function errCodeCheck(){
		var errCode='<c:out value="${errCode}"/>';
		if(errCode!=""){
			switch(parseInt(errCode)){
			case 1: alert("비밀번호 검증에 실패했습니다. 다시 확인해주세요.");
			break;
			
			case 2: alert("회원정보 수정에 오류가 발생했습니다. 잠시 후 다시 시도해주세요.");
			break;
			}
		}
	}
	
	loginUserId="${member.userId}";
	function emailCheck(){
		var email ="${email[1]}";
		$("emailDomain").val(email).prop("seleced", "true");
	}
	</script>
</head>
<body>
	<div class="contentContainer">
		<div class="well">
			<form id="memberForm" class="form-horizontal">
				<input type="hidden" name="email" id="email" /> <input
					type="hidden" name="idx" id="id" value="${member.idx }" />

				<div class="form-group form group-sm">
					<label for="userId" class="col-sm-2 control-label">사용자 ID</label>
					<div class="col-sm-3">${member.userId }</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="oldUserPw" class="col-sm-2 control-label">비밀번호</label>
					<div class="col-sm-3">
						<input type="password" id="oldUserPw" name="oldUserPw"
							maxlength="15" class="form-control" placeholder="기존 비밀번호">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="userPw" class="col-sm-2 control-label">새로운 비밀번호
					</label>
					<div class="col-sm-3">
						<input type="password" id="userPw" name="userPw" maxlength="15"
							class="form-control" placeholder="변경할 비밀번호">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="userPwCheck" class="col-sm-2 control-label">새로운
						비밀번호 확인</label>
					<div class="col-sm-3">
						<input type="password" id="userPwCheck" name="userPwCheck"
							maxlength="15" class="form-control" placeholder="변경할 비밀번호 재입력">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="phone" class="col-sm-2 control-label">핸드폰 번호</label>
					<div class="col-sm-3">
						<input type="text" id="phone" name="phone" maxlength="15"
							class="form-control" value="${member.phone }">
					</div>
					<div class="col-sm-5">
						<p class="form-control-static error"></p>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="birth" class="col-sm-2 control-label">생년월일</label>
					<div class="col-sm-3">
						<div class="col-sm-3">${member.pinno }******</div>
					</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="userName" class="col-sm-2 control-label">이름</label>
					<div class="col-sm-3">${member.userName }</div>
				</div>
				<div class="form-group form-group-sm">
					<label for="emailName" class="col-sm-2 control-label">이메일</label>
					<div class="col-sm-3">
						<input type="text" id="emailName" name="emailName" maxlength="60"
							class="form-control" value="${email[0] }">
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
						<input type="button" value="확인" id="modify"
							class="btn btn-default"> <input type="button" value="재작성"
							id="modifyReset" class="btn btn-default"> <input
							type="button" value="취소" id="modifyCancel"
							class="btn btn-default">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>