package spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import spring.entity.Product;

public interface ProductRepository extends JpaRepository<Product,String> {

	List<Product> findByCategory(String productCode/*, Pageable p*/);
	
	List<Product> findAll();
	
	Product findByProductCode(String productCode);
	
	void delete(Product product);	
	
}
