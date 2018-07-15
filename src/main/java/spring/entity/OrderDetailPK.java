package spring.entity;

import java.io.Serializable;
import javax.persistence.*;

@Embeddable
public class OrderDetailPK implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Column(insertable=false, updatable=false)
	private int orderNumber;

	@Column(insertable=false, updatable=false)
	private String productCode;

	public OrderDetailPK() {
	}
	
	public int getOrderNumber() {
		return this.orderNumber;
	}
	
	public void setOrderNumber(int orderNumber) {
		this.orderNumber = orderNumber;
	}

	public String getProductCode() {
		return this.productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof OrderDetailPK)) {
			return false;
		}
		OrderDetailPK castOther = (OrderDetailPK)other;
		return 
			(this.orderNumber == castOther.orderNumber)
			&& this.productCode.equals(castOther.productCode);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.orderNumber;
		hash = hash * prime + this.productCode.hashCode();
		
		return hash;
	}
}