package com.engineers.moyeo.main.common;

import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class EmailSender {
	
	public static boolean sendEmail(String toEmail, String title, String content, String path) {
		
		// 이메일 전송결과
		boolean result = false;
		
		// 메일 관련 정보
        String host = "smtp.naver.com";
        final String username = MailInterface.id;
        final String password = MailInterface.passwd;
        int port=465;
         
        // 메일 내용
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
          
        Message msg = new MimeMessage(session);
        try {
        	msg.setFrom(new InternetAddress(MailInterface.id));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            msg.setSubject(title);
            msg.setSentDate(new Date());
        } catch(MessagingException e) {
        	e.printStackTrace();
        }
         
        // 파일 첨부시에는 BodyPart를 사용
        // msg.setText(body);
         
        // 파일첨부를 위한 Multipart
        Multipart multipart = new MimeMultipart();
         
        // BodyPart를 생성
        BodyPart bodyPart = new MimeBodyPart();
        try {
        	bodyPart.setText(content);
            
            // 1. Multipart에 BodyPart를 붙인다.
            multipart.addBodyPart(bodyPart);
             
            // 2. 이미지를 첨부한다.
            bodyPart = new MimeBodyPart();
            String filename = path + "\\nature-7.jpg";
            DataSource source = new FileDataSource(filename);
            bodyPart.setDataHandler(new DataHandler(source));
            bodyPart.setFileName(filename);
            //Trick is to add the content-id header here
            bodyPart.setHeader("Content-ID", "image_id");
            multipart.addBodyPart(bodyPart);
             
            //third part for displaying image in the email body
            bodyPart = new MimeBodyPart();
            bodyPart.setContent("<!doctype html><h1>Attached Image</h1>" + "<img src='cid:image_id' style='width:700px; height:500px;'><html>", "text/html;charset=" + "EUC-KR");
//            bodyPart.setContent("", "text/html");
            multipart.addBodyPart(bodyPart);
             
            // 이메일 메시지의 내용에 Multipart를 붙인다.
            msg.setContent(multipart);
            Transport.send(msg);
            result = true;
        } catch(MessagingException e) {
        	e.printStackTrace();
        	result = false;
        }
        return result;
    }
}
