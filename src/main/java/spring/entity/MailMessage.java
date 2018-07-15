package spring.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="messages")
public class MailMessage {
	
	@Id
	private String email;
	
	private String phone;
	
	private String subject;
	
	private String body;
	
	private String messagesRepUserNumber;
	
	private String status;
	
	@ManyToOne
	@JoinColumn(name="messagesRepUserNumber", insertable=false, updatable=false)
	private User user;

	public MailMessage() {
		super();
	}

	public MailMessage(String email, String phone, String subject, String body, String messagesRepUserNumber, String status) {
		super();
		this.email = email;
		this.phone = phone;
		this.subject = subject;
		this.body = body;
		this.messagesRepUserNumber = messagesRepUserNumber;
		this.status = status;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getMessagesRepUserNumber() {
		return messagesRepUserNumber;
	}

	public void setMessagesRepUserNumber(String messagesRepUserNumber) {
		this.messagesRepUserNumber = messagesRepUserNumber;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "email=" + email + ", "
				+ "phone=" + phone + ", "
						+ "subject=" + subject + ", "
								+ "body=" + body
									+ ", messagesRepUserNumber=" + messagesRepUserNumber + ", "
									+ ", status=" + status;
	}	

}
