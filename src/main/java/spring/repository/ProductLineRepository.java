package spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import spring.entity.ProductLine;
import spring.entity.User;

public interface ProductLineRepository extends JpaRepository<ProductLine,String>{

	List<ProductLine> findAll();
	
	void delete(String productLine);
	
	ProductLine findByProductLine(String productLine);

	List<ProductLine> findByUser(User user);
	
}
