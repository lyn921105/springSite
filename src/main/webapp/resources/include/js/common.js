/**
 * 
 */
function chkSubmit(item, msg) {
	if (item.val().replace(/\s/g,"")=="") {
		alert(msg+ "입력해 주세요.");
		item.val("");
		item.focus();
		return false;
	}else{
		return true;
	}
	
}
function checkForm(item, msg) {
	if (item.val().replace(/\s/g,"")=="") {
		message = msg + "입력해 주세요.";
		item.attr("placeholder",message);
		return false;
	}else{
		return true;
	}
	
}
function formCheck(main, item, msg) {
	if (main.val().replace(/\s/g,"")=="") {
		item.css("color", "#000099").html(msg+ "입력해 주세요.");
		main.val("");
		item.focus();
		return false;
	}else{
		return true;
	}
	
}
function chkFile(item) {
	var ext = item.val().split('.').pop().toLowerCase();
	if (jQuery.inArray(ext, ['gif','png','jpg','jpeg'])==-1) {
		alert('gif,png,jpg,jpeg 파일만 업로드 할수 있습니다.');
		return false;
	}else{
		return true;
	}
	
}

var pattern = [
	"((?=.*[a-zA-Z])(?=.*[0-9]).{6,10})",
	"((?=.*[a-zA-Z])(?=.*[0-9@#$%]).{8,12})",
	"^||d{3}-||{3,4}-||d{4}"];
function inputVerify(index,data, printarea) {
	var data_regExp = new RegExp(pattern[index]);
	var match = data_regExp.exec($(data).val());
	if (match==null) {
		$(printarea).html("입력값이 형식에 맞지 않습니다 다시 입력해주세요")
		$(data).val("");
		return false;
	}else{
		return true;
	}
	
}

function getDateFormat(dateValue) {
	var year = dateValue.getFullYear();
	
	var month = dateValue.getMonth() + 1;
	month = (month < 10) ? "0" + month : month;
	
	var day = dateValue.getDate();
	day = (day < 10) ? "0" + day : day;
	
	var result = year + "-" + month + "-" + day;
	return result;
}
