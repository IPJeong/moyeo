/**
 * validation check
 */

var msg_passwd = "비밀번호를 입력하세요!";
var msg_subject = "제목을 입력하세요!";
var msg_writer= "작성자를 입력하세요!";
var msg_content = "글 내용을 입력하세요!";

var insertError = "글 작성에 실패하였습니다. \n잠시후 다시 시도하세요!"
var passwdError = "비밀번호가 일치하지 않습니다. \n잠시후 다시 확인하세요!"
var updateError = "글 수정에 실패하였습니다. \n잠시후 다시 시도하세요!"
var deleteError = "글 삭제에 실패하였습니다. \n잠시후 다시 시도하세요!"
var replyError = "답글이 존재하여 삭제할 수 없습니다!"
	
function errorAlert(msg) {
	alert(msg);
	history.back();
}	

function writeFocus() {
	document.writeform.writer.focus();
}

function writeCheck() {
	if(!document.notice_writePro.manager_id.value) {
		alert(msg_writer);
		document.notice_writePro.manager_id.focus();
		return false;
	} else if(!document.notice_writePro.noti_title.value) {
		alert(msg_subject)
		document.notice_writePro.noti_title.focus();
		return false;
	} else if(!document.notice_writePro.noti_content.value) {
		alert(msg_content)
		document.notice_writePro.noti_content.focus();
		return false;
	}
}

//게시글 수정, 삭제	
function passwdFocus() {
	document.passwdform.passwd.focus();
}

function passwdCheck() {
	if(!document.passwdform.passwd.value) {
		alert(msg_passwd);
		document.passwdform.passwd.focus();
		return false;
	}
}

function modifyFocus() {
	document.modifyform.subject.focus();
}

function modifyCheck(){
	//글제목
	if(!document.notice_modify.noti_title.value) {
		alert(msg_subject);
		document.notice_modify.noti_title.focus();
		return false;
	} else if(!document.notice_modify.noti_content.value) {
		alert(msg_content);
		document.notice_modify.noti_content.focus();
		return false;
	}
	//비밀번호체크
}