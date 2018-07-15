package spring.entity;

import javax.persistence.*;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

import spring.annotation.UniqueUsername;
import java.util.List;


/**
 * The persistent class for the app_user database table.
 * 
 */
@Entity
@Table(name="app_user")
public class User {
	
	private static int usersCount;

	@Id
	@GeneratedValue
	@Column(name="id")
	private Integer userNumber;

	@Size(min = 3, message = "Name must be at least 3 characters!")
	@Column(unique = true)
	@UniqueUsername(message = "Such username already exists!")
	private String name;

	@Size(min = 1, message = "Invalid email address!")
	@Email(message = "Invalid email address!")
	private String email;

	@Size(min = 5, message = "Password must be at least 5 characters!")
	private String password;

	private boolean enabled;	
	
	@OneToMany(mappedBy="user", cascade = CascadeType.ALL, fetch=FetchType.EAGER)
	private List<MailMessage> messages;

	@ManyToMany
	@JoinTable
	private List<Role> roles;

	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch=FetchType.EAGER)
	private List<ProductLine> categories;

	public User() {
		this.userNumber = ++usersCount;
	}

	public int getId() {
		return this.userNumber;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean getEnabled() {
		return this.enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public List<Role> getRoles() {
		return this.roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public Integer getUserNumber() {
		return userNumber;
	}

	public void setUserNumber(Integer userNumber) {
		this.userNumber = userNumber;
	}

	public List<MailMessage> getMessages() {
		return messages;
	}

	public void setMessages(List<MailMessage> messages) {
		this.messages = messages;
	}

	public List<ProductLine> getCategories() {
		return categories;
	}

	public void setCategories(List<ProductLine> categories) {
		this.categories = categories;
	}

	@Override
	public String toString() {
		return "User [id=" + userNumber + ", email=" + email + ", enabled=" + enabled + ", name=" + name + ", password="
				+ password + ", roles=" + roles;
	}
	

}