package com.engineers.moyeo.main.common;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailSender {
	
	public static boolean sendEmail(String toEmail, String title, String content) {
		// 메일 관련 정보
        String host = "smtp.naver.com";
        final String username = MailInterface.id;
        final String password = MailInterface.passwd;
        int port=465;
         
        // 메일 내용
        String recipient = toEmail;
        boolean result = false;
         
        Properties props = System.getProperties();
         
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.trust", host);
          
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            String un=username;
            String pw=password;
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(un, pw);
            }
        });
        session.setDebug(true); //for debug
          
        Message mimeMessage = new MimeMessage(session);
        
        try {
        	mimeMessage.setFrom(new InternetAddress(MailInterface.id));
            mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
            mimeMessage.setSubject(title);
            mimeMessage.setText(content);
            Transport.send(mimeMessage);
            result = true;
        } catch(MessagingException e) {
        	e.printStackTrace();
        	result = false;
        }
        
        return result;
	}
}
