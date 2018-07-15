package spring.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name="orderdetails")
public class OrderDetail implements Serializable {

	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private OrderDetailPK orderDetailPK;
	
	@Column(name="orderNumber", nullable = false, insertable=false, updatable=false)
	private int orderNumber;
	
	@Column(name="productCode", nullable = false, insertable=false, updatable=false)
	private String productCode;

	private int quantityOrdered;
	
	private BigDecimal priceEach;
	
	private short orderLineNumber;

	//bi-directional many-to-one association to Order
	@ManyToOne
	@JoinColumn(name="orderNumber",insertable=false, updatable=false)
	private Order order;

	//bi-directional many-to-one association to Product
	@ManyToOne
	@JoinColumn(name="productCode",insertable=false, updatable=false)
	private Product product;

	public OrderDetail() {
	}
	
	public OrderDetail(OrderDetailPK orderDetailPK, short orderLineNumber, BigDecimal priceEach, int quantityOrdered) {
		super();
		this.orderDetailPK = orderDetailPK;
		this.orderLineNumber = orderLineNumber;
		this.priceEach = priceEach;
		this.quantityOrdered = quantityOrdered;
	}

	public OrderDetail(int orderNumber, String productCode, short orderLineNumber, BigDecimal priceEach,
			int quantityOrdered) {
		super();
		this.orderNumber = orderNumber;
		this.productCode = productCode;
		this.orderLineNumber = orderLineNumber;
		this.priceEach = priceEach;
		this.quantityOrdered = quantityOrdered;
	}
	
	@PrePersist
	private void prePersiste() {
	    if (getOrderDetailPK() == null) {
	    	OrderDetailPK pk = new OrderDetailPK();
	        pk.setOrderNumber(orderNumber);
	        pk.setProductCode(productCode);
	        setOrderDetailPK(pk);
	    }
	}

	public int getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public OrderDetailPK getOrderDetailPK() {
		return this.orderDetailPK;
	}

	public void setOrderDetailPK(OrderDetailPK orderDetailPK) {
		this.orderDetailPK = orderDetailPK;
	}

	public short getOrderLineNumber() {
		return this.orderLineNumber;
	}

	public void setOrderLineNumber(short orderLineNumber) {
		this.orderLineNumber = orderLineNumber;
	}

	public BigDecimal getPriceEach() {
		return this.priceEach;
	}

	public void setPriceEach(BigDecimal priceEach) {
		this.priceEach = priceEach;
	}

	public int getQuantityOrdered() {
		return this.quantityOrdered;
	}

	public void setQuantityOrdered(int quantityOrdered) {
		this.quantityOrdered = quantityOrdered;
	}

	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

}