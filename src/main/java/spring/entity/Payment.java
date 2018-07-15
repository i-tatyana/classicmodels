package spring.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;


/**
 * The persistent class for the payments database table.
 * 
 */
@Entity
@Table(name="payments")
public class Payment implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@EmbeddedId
	private PaymentPK paymentPK;	
	
	@Column(name="customerNumber", nullable = false, insertable=false, updatable=false)
	private int customerNumber;	
	
	@Column(name="checkNumber", nullable = false, insertable=false, updatable=false)
	private String checkNumber;

	private BigDecimal amount;

	@Temporal(TemporalType.DATE)
	private Date paymentDate;	

	//bi-directional many-to-one association to Customer
	@ManyToOne
	@JoinColumn(name="customerNumber", insertable=false, updatable=false)
	private Customer customer;
	
	public Payment() {
	}
	
	public Payment(PaymentPK paymentPK, BigDecimal amount, Date paymentDate) {
		super();
		this.paymentPK = paymentPK;
		this.amount = amount;
		this.paymentDate = paymentDate;
	}
	
	public Payment(Integer customerNumber, String checkNumber, BigDecimal amount, Date paymentDate) {
		super();
		this.customerNumber = customerNumber;
		this.checkNumber = checkNumber;
		this.amount = amount;
		this.paymentDate = paymentDate;
	}
	
	@PrePersist
	private void prePersiste() {
	    if (getPaymentPK() == null) {
	        PaymentPK pk = new PaymentPK();
	        pk.setCustomerNumber(customerNumber);
	        pk.setCheckNumber(checkNumber);
	        setPaymentPK(pk);
	    }
	}
	
	public int getCustomerNumber() {
		return customerNumber;
	}

	public void setCustomerNumber(int customerNumber) {
		this.customerNumber = customerNumber;
	}

	public String getCheckNumber() {
		return checkNumber;
	}

	public void setCheckNumber(String checkNumber) {
		this.checkNumber = checkNumber;
	}

	public PaymentPK getPaymentPK() {
		return paymentPK;
	}

	public void setPaymentPK(PaymentPK paymentPK) {
		this.paymentPK = paymentPK;
	}

	public BigDecimal getAmount() {
		return this.amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public Date getPaymentDate() {
		return this.paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

}