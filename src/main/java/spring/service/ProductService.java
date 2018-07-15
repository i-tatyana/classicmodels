package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import spring.entity.Product;
import spring.repository.ProductRepository;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepository productRepository;

	public List<Product> getProducts() {
		return productRepository.findAll(new PageRequest(0, 20, Direction.DESC, "buyPrice")).getContent();
	}
	
	public List<Product> findAll(){
		return productRepository.findAll();
	}
	
	public void save(Product product) {
		productRepository.save(product);
		productRepository.flush();
	}
	
	public void delete(String productCode) {
		//Pro office = findOne(productCode);
		productRepository.delete(productCode);		
	}

	public void update(Product product) {
		Product product_found = findOne(product.getProductCode());	
		//product_found.setProductCode(product.getProductCode());
		product_found.setProductName(product.getProductName());
		product_found.setProductLine(product.getProductLine());
		product_found.setProductScale(product.getProductScale());
		product_found.setProductVendor(product.getProductVendor());
		product_found.setProductDescription(product.getProductDescription());
		product_found.setQuantityInStock(product.getQuantityInStock());
		product_found.setBuyPrice(product.getBuyPrice());
		product_found.setMsrp(product.getMsrp());
		productRepository.save(product_found);
	}

	public Product findOne(String productCode) {
		return productRepository.findByProductCode(productCode);
	}
	
	//public List<Item> getItems() {
	//	return itemRepository.findAll(new PageRequest(0, 20, Direction.DESC, "publishedDate")).getContent();
	//}
	
	public List<Product> findByCategory(String productLine) {
		 List<Product> items = productRepository.findByCategory(productLine/*, new PageRequest(0, 10, Direction.DESC, "productName")*/);
		 return items;
	}
		
}

