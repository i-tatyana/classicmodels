package spring.entity;

import javax.persistence.*;

import org.hibernate.annotations.Type;

import java.util.Date;
import java.util.List;


/**
 * The persistent class for the orders database table.
 * 
 */
@Entity
@Table(name="orders")
public class Order {
	
	private static int ordersCount;

	@Id
	@GeneratedValue
	private int orderNumber;

	@Lob
	@Type(type = "org.hibernate.type.StringClobType")
	@Column(length = Integer.MAX_VALUE)
	private String comments;

	@Temporal(TemporalType.DATE)
	private Date orderDate;

	@Temporal(TemporalType.DATE)
	private Date requiredDate;

	@Temporal(TemporalType.DATE)
	private Date shippedDate;

	private String status;
	
	private int customerNumber;

	//bi-directional many-to-one association to Orderdetail
	@OneToMany(mappedBy="order")
	private List<OrderDetail> orderdetails;

	//bi-directional many-to-one association to Customer
	@ManyToOne
	@JoinColumn(name="customerNumber", insertable=false, updatable=false)
	private Customer customer;

	public Order() {
	}
	
	public Order(String comments, Date orderDate, Date requiredDate, Date shippedDate, String status,
			int customerNumber) {
		super();
		this.orderNumber = ++ordersCount;
		this.comments = comments;
		this.orderDate = orderDate;
		this.requiredDate = requiredDate;
		this.shippedDate = shippedDate;
		this.status = status;
		this.customerNumber = customerNumber;
	}

	public int getCustomerNumber() {
		return customerNumber;
	}

	public void setCustomerNumber(int customerNumber) {
		this.customerNumber = customerNumber;
	}

	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}

	public int getOrderNumber() {
		return this.orderNumber;
	}

	public String getComments() {
		return this.comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Date getOrderDate() {
		return this.orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Date getRequiredDate() {
		return this.requiredDate;
	}

	public void setRequiredDate(Date requiredDate) {
		this.requiredDate = requiredDate;
	}

	public Date getShippedDate() {
		return this.shippedDate;
	}

	public void setShippedDate(Date shippedDate) {
		this.shippedDate = shippedDate;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<OrderDetail> getOrderdetails() {
		return this.orderdetails;
	}

	public void setOrderdetails(List<OrderDetail> orderdetails) {
		this.orderdetails = orderdetails;
	}

	public OrderDetail addOrderdetail(OrderDetail orderdetail) {
		getOrderdetails().add(orderdetail);
		orderdetail.setOrder(this);

		return orderdetail;
	}

	public OrderDetail removeOrderdetail(OrderDetail orderdetail) {
		getOrderdetails().remove(orderdetail);
		orderdetail.setOrder(null);

		return orderdetail;
	}

	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

}