package com.engineers.moyeo.main.common;

public class TextMessage {

	// 현호
	// 이벤트에 당첨된 회원의 알림을 생성하는 메서드 (당첨된 회원아이디, 이벤트 명) - type(1)
	public static String memWinningMsg(String mem_id, String event_title) {
		return "[이벤트알림] " + mem_id+"님, 참여하신 '" + event_title + "' 이벤트의 결과가 발표되었습니다. 자세한 사항은 이벤트 당첨알림 게시판을 확인해 주세요.";
	}
	
	// 상준
	// 모임에 작성한 가입인사 게시판에 댓글이 달린 경우 알림을 생성하는 메서드(게시글을 작성한 회원아이디, 모임의 이름, 댓글을 작성한 회원의 아이디) - type(2)
	public static String memGreetingReplyMsg(String mem_id, String group_name, String id) {
		return "[댓글알림] " + mem_id+"님, '" + group_name + "' 모임에 작성하신 가입인사에 "+ id +"님이 댓글을 작성했습니다.";
	}
	// 모임에 작성한 가입인사 게시판의 좋아요 버튼을 누른 경우 알림을 생성하는 메서드(게시글을 작성한 회원아이디, 모임의 이름, 좋아한 회원의 아이디) - type(3)
	public static String memGreetingLikeMsg(String mem_id, String group_name, String id) {
		return "[좋아요알림] " + mem_id+"님, '" + group_name + "' 모임에 작성하신 가입인사를 "+ id +" 님이 좋아했습니다.";
	}
	
	// 우진
	// 회원알림테이블에 Q&A 질문에 대한 답변이 달린경우 알림을 생성하는 메서드(해당 질문의 제목, 질문한 회원의 아이디) - type(4)
	public static String memQnaReplyMsg(String mem_id, String qna_title) {
		return "[답변알림] " + mem_id+"님, Q&A게시판에 질문하신 '" + qna_title + "' 질문에 관리자 답변이 등록되었습니다.";
	}
	// 모임이 신고되면 모임장에게 모임이 신고됨을 알림 - type(5)
	public static String groupReportNotiMsg() {
		return "[신고알림] 모임이 사용자에 의해 신고되었습니다.";
	}
	// 모임신고에 관리자가 처리내역을 업데이트 하면 모임을 신고한 회원에게 알림 - type(6)
	public static String groupReportSolNotiMsg(String mem_id, String group_name) {
		return "[신고알림] " + mem_id +"님, 접수된 '" + group_name + "' 모임의 신고가 정상적으로 처리되었습니다.";
	}
	
	// 일품
	// 모임후기의 좋아요 알림을 생성하는 메서드(모임후기의 제목, 좋아한 회원의 아이디, 모임번호) - type(7)
	public static String postLikeMsg(String post_title, String from_id) {
		return "[좋아요알림] '" + post_title + "' 후기를 " + from_id + " 님께서 좋아하셨습니다.";
	}
	// 모임후기에 달린 댓글 알림을 생성하는 메서드(모임후기의 제목, 댓글을 작성한 회원의 아이디, , 모임번호) - type(8)
	public static String postReplyMsg(String post_title, String from_id) {
		return "[댓글알림] '" + post_title + "' 후기에 " + from_id + " 님께서 댓글을 작성하셨습니다.";
	}
	
	// 대성
	// 모임이 폐지될 경우, 모임장과 모임원들에게 알림 - type(9)
	public static String shutDownGroupMsg(String mem_id, String group_name) {
		return "[모임폐쇄알림] " + mem_id + "님, 가입하신 '" + group_name + "' 모임이 폐쇄되었습니다."; 
	}
	
	// 승우
	// 회원의 등급이 변화될 경우 알림(회원) - type(10)
	public static String changeGroupPerMsg(String mem_id, String group_name) {
		return "[모임등급알림] " + mem_id + "님, '" + group_name + "' 모임에서 모임원 등급이 변경되었습니다. ";
	}
	// 모임에서 강제 탈퇴 당한 경우 알림(회원) - type(11)
	public static String kickedNotiMsg(String mem_id, String group_name) {
		return "[모임강퇴알림] " + mem_id + "님, '" + group_name + "' 모임에서 강제 탈퇴 당하셨습니다.";
	}
	// 모임에서 가입이 승인된 경우 알림(회원) - type(12)
	public static String acceptedGroupMsg(String mem_id, String group_name) {
		return "[모임가입승인알림] " + mem_id + "님, '" + group_name + "'의 모임가입신청이 승인되었습니다.";
	}
	// 모임에서 가입이 거절된 경우 알림(회원) - type(13)
	public static String refusedGroupMsg(String mem_id, String group_name) {
		return "[모임가입거절알림] " + mem_id + "님, '" + group_name + "'의 모임가입신청이 거절되었습니다.";
	}
	// 비모임원이 모임에 가입을 신청한 경우 알림(모임장) - type(14)
	public static String applyJoinGroupMsg(String mem_id, String group_name) {
		return "[모임가입신청] " + mem_id + "님께서  모임가입을 신청하셨습니다. 가입신청 화면을 확인해 주세요.";
	}
	
	// 회원가입한 회원의 축하 이메일 제목 메시지
	public static String congJoinMsgTitle(String id) {
		return "[Moyeo] " + id + "님 회원가입을 진심으로 축하합니다.";
	}
	
	// 회원가입한 회원의 축하 이메일 내용 메시지
	public static String congJoinMsgContent(String id) {
		return "안녕하세요. Moyeo팀 입니다. \n" + 
				id + "님의 회원가입을 진심으로 축하드립니다. \n" +
				"앞으로 활발한 활동을 부탁드리며 Moyeo에서 좋은 인연 찾아서 좋은 모임활동 하시길 바라겠습니다.";
	}
	
	// 비밀번호 분실 이메일 발송문의 제목 메시지
	public final static String pwSearchEmailMsg(String id) {
		return "[Moyeo] " + id + "님께서 문의하신 비밀번호 분실관련 이메일 입니다.";
	}
	
	// 비밀번호 분실 이메일 발송문의 내용
	public final static String pwSearchEmailMsgContent(String id, String pw) {
		return "안녕하세요. Moyeo팀 입니다. \n" +
			   id + " 님의 임시 비밀번호는 " + pw + " 입니다." +
			   "\n로그인 후 비밀번호를 변경해 주시기 바랍니다.";
	}

}
