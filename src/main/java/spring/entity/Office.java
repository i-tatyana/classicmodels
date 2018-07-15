package spring.entity;

import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the offices database table.
 * 
 */
@Entity
@Table(name="offices")
public class Office{

	@Id
	private String officeCode;

	private String addressLine1;

	private String addressLine2;

	private String city;

	private String country;

	private String phone;

	private String postalCode;

	private String state;

	private String territory;

	//bi-directional many-to-one association to Employee
	@OneToMany(mappedBy="office", cascade = CascadeType.ALL)
	private List<Employee> employees;

	public Office() {
	}

	public Office(String officeCode, String addressLine1, String addressLine2, String city, String country,
			String phone, String postalCode, String state, String territory) {
		super();
		this.officeCode = officeCode;
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.city = city;
		this.country = country;
		this.phone = phone;
		this.postalCode = postalCode;
		this.state = state;
		this.territory = territory;
	}

	public String getOfficeCode() {
		return this.officeCode;
	}

	public void setOfficeCode(String officeCode) {
		this.officeCode = officeCode;
	}

	public String getAddressLine1() {
		return this.addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return this.addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPostalCode() {
		return this.postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getTerritory() {
		return this.territory;
	}

	public void setTerritory(String territory) {
		this.territory = territory;
	}

	public List<Employee> getEmployees() {
		return this.employees;
	}

	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}

	public Employee addEmployee(Employee employee) {
		getEmployees().add(employee);
		employee.setOffice(this);

		return employee;
	}

	public Employee removeEmployee(Employee employee) {
		getEmployees().remove(employee);
		employee.setOffice(null);

		return employee;
	}

}