package com.engineers.moyeo.main.Sample;

import com.engineers.moyeo.main.common.EmailSender;
import com.engineers.moyeo.main.common.TextMessage;

public class EmailSendSample {
	
	public static void main(String[] args) {
		
		// 이메일을 받을 회원의 아이디
		String toEmail = "";
		// 이메일의 제목 (회원아이디를 넣어주면 됨)
		String title = TextMessage.pwSearchEmailMsg("hyunhoo");
		// 이메일의 내용 (Html로 만들어주면 좋을 듯)
		String content = "";
		
		EmailSender.sendEmail(toEmail, title, content);
		
	}
	
}
