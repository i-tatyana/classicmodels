package spring.entity;

import javax.persistence.*;

import spring.entity.User;

import java.util.List;


/**
 * The persistent class for the role database table.
 * 
 */
@Entity
public class Role {
	
	@Id
	@GeneratedValue
	private Integer id;

	private String name;
	
	@ManyToMany(mappedBy="roles")
	private List<User> users;	

	public Role() {
		
	}

	public Role(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}
	
	@Override
	public String toString() {
		return "id=" + id + ", "
				+ "name=" + name;
	}
	
}
