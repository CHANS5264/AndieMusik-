package adm.controller;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SMTP {

	public static void main(String[] args) {
		String host = "smtp.gmail.com";
		final String user ="lcw1523@gmail.com";
		final String password ="!speed1523";

		String to = "ljn1523@naver.com";

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		props.put("mail.smtp.starttls.enable", "true");

		char pwCollection[] = new char[] {
				'1','2','3','4','5','6','7','8','9','0',
				'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
				'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
				'!','@','#','$','%','^','&','*','(',')'
		};//배열에 선언

		String ranPw = "";

		for (int i = 0; i < 10; i++) {
			int selectRandomPw = (int)(Math.random()*(pwCollection.length));//Math.rondom()은 0.0이상 1.0미만의 난수를 생성해 준다.
			ranPw += pwCollection[selectRandomPw];
		}

		String AuthenticationKey = pwCollection.toString();
		System.out.println(AuthenticationKey);


		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			message.setSubject("제목 입력");

			message.setText("인증번호는 : " + ranPw);

			Transport.send(message);
			System.out.println("message sent successfully...");
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

}
