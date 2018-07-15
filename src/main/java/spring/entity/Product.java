package spring.entity;

import java.io.Serializable;
import javax.persistence.*;

import org.hibernate.annotations.Type;

import java.math.BigDecimal;
import java.util.List;


/**
 * The persistent class for the products database table.
 * 
 */
@Entity
@Table(name="products")
public class Product implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id	
	private String productCode;

	private BigDecimal buyPrice;

	private BigDecimal msrp;

	@Lob
	@Type(type = "org.hibernate.type.StringClobType")
	@Column(length = Integer.MAX_VALUE)
	private String productDescription;

	private String productName;
	
	private String productLine;

	private String productScale;

	private String productVendor;

	private short quantityInStock;

	//bi-directional many-to-one association to Orderdetail
	@OneToMany(mappedBy="product", cascade = CascadeType.ALL, fetch=FetchType.EAGER)
	private List<OrderDetail> orderdetails;

	//bi-directional many-to-one association to Productline
	@ManyToOne
	@JoinColumn(name="productLine", insertable=false, updatable=false)
	private ProductLine category;

	public Product() {
	}

	public String getProductCode() {
		return this.productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public BigDecimal getBuyPrice() {
		return this.buyPrice;
	}

	public void setBuyPrice(BigDecimal buyPrice) {
		this.buyPrice = buyPrice;
	}

	public BigDecimal getMsrp() {
		return this.msrp;
	}

	public void setMsrp(BigDecimal msrp) {
		this.msrp = msrp;
	}

	public String getProductDescription() {
		return this.productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getProductName() {
		return this.productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductScale() {
		return this.productScale;
	}

	public void setProductScale(String productScale) {
		this.productScale = productScale;
	}

	public String getProductVendor() {
		return this.productVendor;
	}

	public void setProductVendor(String productVendor) {
		this.productVendor = productVendor;
	}

	public short getQuantityInStock() {
		return this.quantityInStock;
	}

	public void setQuantityInStock(short quantityInStock) {
		this.quantityInStock = quantityInStock;
	}

	public List<OrderDetail> getOrderdetails() {
		return this.orderdetails;
	}

	public void setOrderdetails(List<OrderDetail> orderdetails) {
		this.orderdetails = orderdetails;
	}

	public OrderDetail addOrderdetail(OrderDetail orderdetail) {
		getOrderdetails().add(orderdetail);
		orderdetail.setProduct(this);

		return orderdetail;
	}

	public OrderDetail removeOrderdetail(OrderDetail orderdetail) {
		getOrderdetails().remove(orderdetail);
		orderdetail.setProduct(null);

		return orderdetail;
	}

	public String getProductLine() {
		return productLine;
	}

	public void setProductLine(String productLine) {
		this.productLine = productLine;
	}

	public ProductLine getCategory() {
		return category;
	}

	public void setCategory(ProductLine category) {
		this.category = category;
	}

}