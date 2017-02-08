package com.engineers.moyeo.main.common;

public class TextMessage {

	// 회원알림테이블에 질문에 대한 답변이 달린경우 알림을 생성하는 메서드(해당 질문의 제목, 질문한 회원의 아이디)
	public static String memQnaReplyMsg(String mem_id, String qna_title) {
		return mem_id+"님, Q&A게시판에 질문하신 " + qna_title + " 질문에 관리자 답변이 등록되었습니다.";
	}
	
	// 모임에 작성한 가입인사 게시판에 댓글이 달린 경우 알림을 생성하는 메서드(게시글을 작성한 회원아이디, 모임의 이름, 댓글을 작성한 회원의 아이디)
	public static String memGreetingReplyMsg(String mem_id, String group_name, String id) {
		return mem_id+"님, " + group_name + "모임에 작성하신 가입인사에 "+ id +"님이 댓글을 작성했습니다.";
	}
	
	// 이벤트에 당첨된 회원의 알림을 생성하는 메서드 (당첨된 회원아이디, 이벤트 명)
	public static String memWinningMsg(String mem_id, String event_title) {
		return mem_id+"님, 축하합니다." + event_title + " 에 당첨되셨습니다. 자세한 사항은 이벤트 당첨알림 게시판을 확인해 주세요.";
	}
	
	// 모임후기의 좋아요 알림을 생성하는 메서드(모임후기의 제목, 좋아한 회원의 아이디)
	public static String postLikeMsg(String post_title, String mem_id) {
		return post_title + " 후기를 " + mem_id + " 님께서 좋아하셨습니다.";
	}
	
	// 모임후기에 달린 댓글 알림을 생성하는 메서드(모임후기의 제목, 댓글을 작성한 회원의 아이디)
	public static String postReplyMsg(String post_title, String mem_id) {
		return post_title + " 후기에 " + mem_id + " 님께서 댓글을 작성하셨습니다.";
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
