package spring.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;


/**
 * The persistent class for the customers database table.
 * 
 */
@Entity
@Table(name="customers")
public class Customer {

	private static int customersCount;
	
	@Id
	@GeneratedValue
	private int customerNumber;

	private String addressLine1;

	private String addressLine2;

	private String city;

	private String contactFirstName;

	private String contactLastName;

	private String country;

	private BigDecimal creditLimit;
	
	private String customerName;

	private String phone;

	private String postalCode;

	private String state;
	
	private int salesRepEmployeeNumber;
	
	//bi-directional many-to-one association to Employee
	@ManyToOne
	@JoinColumn(name="salesRepEmployeeNumber", insertable=false, updatable=false)
	private Employee employee;

	//bi-directional many-to-one association to Order
	@OneToMany(mappedBy="customer", cascade = CascadeType.ALL)
	private List<Order> orders;

	//bi-directional many-to-one association to Payment
	@OneToMany(mappedBy="customer", cascade = CascadeType.ALL)
	private List<Payment> payments;

	public Customer() {
		
	}

//	public Customer(String addressLine1, String addressLine2, String city, String contactFirstName,
//			String contactLastName, String country, BigDecimal creditLimit, String customerName, String phone,
//			String postalCode, String state) {
//		super();
//		this.customerNumber = ++customersCount;
//		this.addressLine1 = addressLine1;
//		this.addressLine2 = addressLine2;
//		this.city = city;
//		this.contactFirstName = contactFirstName;
//		this.contactLastName = contactLastName;
//		this.country = country;
//		this.creditLimit = creditLimit;
//		this.customerName = customerName;
//		this.phone = phone;
//		this.postalCode = postalCode;
//		this.state = state;
//	}
	
	

	public int getCustomerNumber() {
		return this.customerNumber;
	}

	public Customer(String addressLine1, String addressLine2, String city, String contactFirstName, String contactLastName,
		String country, BigDecimal creditLimit, String customerName, String phone, String postalCode,
		int salesRepEmployeeNumber) {
		super();
		this.customerNumber = ++customersCount;
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.city = city;
		this.contactFirstName = contactFirstName;
		this.contactLastName = contactLastName;
		this.country = country;
		this.creditLimit = creditLimit;
		this.customerName = customerName;
		this.phone = phone;
		this.postalCode = postalCode;
		this.salesRepEmployeeNumber = salesRepEmployeeNumber;
	}

	public void setCustomerNumber(int customerNumber) {
		this.customerNumber = customerNumber;
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

	public String getContactFirstName() {
		return this.contactFirstName;
	}

	public void setContactFirstName(String contactFirstName) {
		this.contactFirstName = contactFirstName;
	}

	public String getContactLastName() {
		return this.contactLastName;
	}

	public void setContactLastName(String contactLastName) {
		this.contactLastName = contactLastName;
	}

	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public BigDecimal getCreditLimit() {
		return this.creditLimit;
	}

	public void setCreditLimit(BigDecimal creditLimit) {
		this.creditLimit = creditLimit;
	}

	public String getCustomerName() {
		return this.customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
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
	
	public int getSalesRepEmployeeNumber() {
		return salesRepEmployeeNumber;
	}

	public void setSalesRepEmployeeNumber(int salesRepEmployeeNumber) {
		this.salesRepEmployeeNumber = salesRepEmployeeNumber;
	}

	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public List<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public Order addOrder(Order order) {
		getOrders().add(order);
		order.setCustomer(this);

		return order;
	}

	public Order removeOrder(Order order) {
		getOrders().remove(order);
		order.setCustomer(null);

		return order;
	}

	public List<Payment> getPayments() {
		return this.payments;
	}

	public void setPayments(List<Payment> payments) {
		this.payments = payments;
	}

	public Payment addPayment(Payment payment) {
		getPayments().add(payment);
		payment.setCustomer(this);

		return payment;
	}

	public Payment removePayment(Payment payment) {
		getPayments().remove(payment);
		payment.setCustomer(null);

		return payment;
	}

}