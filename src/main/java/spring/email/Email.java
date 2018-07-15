package spring.email;
import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Email {
	
	//public static void sendGreetingEmail(String emailTo) throws IOException, AddressException, MessagingException {
	public static void main(String emailTo) throws IOException, AddressException, MessagingException {
		final Properties properties = new Properties();
		properties.load(Email.class.getClassLoader().getSystemResourceAsStream("mail.properties"));
		
		Session mailSession = Session.getDefaultInstance(properties);
		MimeMessage message = new MimeMessage(mailSession);
		message.setFrom(new InternetAddress("tat.kasyanchuk@gmail.com"));
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(emailTo));
		message.setSubject("This is Resend email from Best Cars");
		message.setText("You received this mail because you have applied to our site. Wait for our manager contact you");
		
		Transport transport = mailSession.getTransport();
		transport.connect(null,"consequences");
		transport.sendMessage(message, message.getAllRecipients());
		transport.close();	
		
	}	
	
}
