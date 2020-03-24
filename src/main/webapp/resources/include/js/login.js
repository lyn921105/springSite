/**
 * 
 */
$(function() {
	errCodeCheck()
	$('#userId, #userPw').bind("keyup",function(){
		$(this).parents("div").find(".error").html("");
	});
	$("#loginBtn").click(function() {
		if (!formCheck($('#userId'), $('.error:eq(0)'), "아이디를"))
			return;
		else if (!inputVerify(0,'#userId','.error:eq(0)')) return;
		else if (!formCheck($,('#userPw'),$('.error:eq(1)'),"비밀번호를")) return;
		else if (!inputVerify(1,'#userPw','.error:eq(1)')) return;
		else{
			$("#loginForm").attr({
				"method":"POST",
				"action":"/member/login.do"
			});
			$("#loginForm").submit();
		}
	});
	$("#joinBtn").click(function(){
		location.href="/member/join.do";
	});
});