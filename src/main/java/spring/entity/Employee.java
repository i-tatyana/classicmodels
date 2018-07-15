package spring.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="employees")
public class Employee {
	
	private static int employeesCount;
	
	@Id
	@GeneratedValue
	private int employeeNumber;
	
	private String firstName;
	
	private String lastName;
	
	private String extension;

	private String email;
	
	private String officeCode;
	
	private int reportsTo;
	
	private String jobTitle;

	//bi-directional many-to-one association to Customer
	@OneToMany(mappedBy="employee", cascade = CascadeType.ALL)
	private List<Customer> customers;

	//bi-directional many-to-one association to Office
	@ManyToOne
	@JoinColumn(name="officeCode", insertable=false, updatable=false)
	private Office office;	

	public Employee() {
	}
	
	public Employee(String firstName, String lastName, String extension, String email, String officeCode, int reportsTo,
			String jobTitle) {
		super();
		this.employeeNumber = ++employeesCount;
		this.firstName = firstName;
		this.lastName = lastName;
		this.extension = extension;
		this.email = email;
		this.officeCode = officeCode;
		this.jobTitle = jobTitle;
	}

	public String getOfficeCode() {
		return officeCode;
	}

	public void setOfficeCode(String officeCode) {
		this.officeCode = officeCode;
	}

	public void setEmployeeNumber(int employeeNumber) {
		this.employeeNumber = employeeNumber;
	}

	public int getEmployeeNumber() {
		return this.employeeNumber;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getExtension() {
		return this.extension;
	}

	public void setExtension(String extension) {
		this.extension = extension;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getJobTitle() {
		return this.jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public List<Customer> getCustomers() {
		return this.customers;
	}

	public void setCustomers(List<Customer> customers) {
		this.customers = customers;
	}

	public Customer addCustomer(Customer customer) {
		getCustomers().add(customer);
		customer.setEmployee(this);

		return customer;
	}

	public Customer removeCustomer(Customer customer) {
		getCustomers().remove(customer);
		customer.setEmployee(null);

		return customer;
	}

	public Office getOffice() {
		return this.office;
	}

	public void setOffice(Office office) {
		this.office = office;
	}

	@Override
	public String toString() {
		return "Employee [employeeNumber=" + employeeNumber + ", firstName=" + firstName + ", lastName=" + lastName
				+ ", extension=" + extension + ", email=" + email + ", officeCode=" + officeCode + ", jobTitle=" + jobTitle + ", customers=" + customers + ", employee=" + ", office=" + office + "]";
	}

}