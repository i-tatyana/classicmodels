package spring.entity;

import java.io.Serializable;
import javax.persistence.*;

import org.hibernate.annotations.Type;

import java.util.Arrays;
import java.util.List;

@Entity
@Table(name="productlines")
public class ProductLine implements Serializable {
	private static final long serialVersionUID = 1L;
		
	@Id
	private String productLine;

	@Lob
	@Type(type = "org.hibernate.type.StringClobType")
	@Column(length = Integer.MAX_VALUE)
	private String htmlDescription;

	@Lob
	@Column(name="image", length = Integer.MAX_VALUE)
	private byte[] file;
	
	@Lob
	@Type(type = "org.hibernate.type.StringClobType")
	@Column(length = Integer.MAX_VALUE)
	private String textDescription;
	
	private Integer userNumber;

	//bi-directional many-to-one association to Product
	@OneToMany(mappedBy="category", cascade = CascadeType.ALL, fetch=FetchType.EAGER)
	private List<Product> products;
	
	@ManyToOne
	@JoinColumn(name = "userNumber", insertable=false, updatable=false)
	private User user;

	public ProductLine() {
	}

	public ProductLine(String productLine, String htmlDescription, byte[] file, String textDescription) {
		super();
		this.productLine = productLine;
		this.htmlDescription = htmlDescription;
		this.file = file;
		this.textDescription = textDescription;
	}

	public String getProductLine() {
		return this.productLine;
	}

	public void setProductLine(String productLine) {
		this.productLine = productLine;
	}

	public String getHtmlDescription() {
		return this.htmlDescription;
	}

	public void setHtmlDescription(String htmlDescription) {
		this.htmlDescription = htmlDescription;
	}

	public byte[] getFile() {
		return file;
	}

	public void setFile(byte[] file) {
		this.file = file;
	}

	public String getTextDescription() {
		return this.textDescription;
	}

	public void setTextDescription(String textDescription) {
		this.textDescription = textDescription;
	}

	public List<Product> getProducts() {
		return this.products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public Product addProduct(Product product) {
		getProducts().add(product);
		product.setCategory(this);

		return product;
	}

	public Product removeProduct(Product product) {
		getProducts().remove(product);
		product.setCategory(null);

		return product;
	}

	public Integer getUserNumber() {
		return userNumber;
	}

	public void setUserNumber(Integer userNumber) {
		this.userNumber = userNumber;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "productLine=" + productLine + ", "
				+ "htmlDescription=" + htmlDescription + ", "
						+ "file=" + Arrays.toString(file) + ", "
								+ "textDescription=" + textDescription + ", "
										+ "userNumber=" + userNumber;
	}

}