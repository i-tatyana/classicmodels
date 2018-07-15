package spring.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.method.P;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import spring.entity.ProductLine;
import spring.entity.User;
import spring.repository.ProductLineRepository;
import spring.repository.UserRepository;

@Service
@Transactional
public class ProductLineService {

	@Autowired
	private ProductLineRepository productLineRepository;
	
	@Autowired
	private UserRepository userRepository;

	public List<ProductLine> findAll(){
		return productLineRepository.findAll();
	}
			
	public void save(ProductLine category, String name) {
		User user = userRepository.findByName(name);
		category.setUser(user);
		productLineRepository.save(category);
	}

	@PreAuthorize("#category.user.name == authentication.name or hasRole('ROLE_ADMIN')")
	public void deleteCategory(@P("category") ProductLine category) {
		productLineRepository.delete(category);
	}

	public ProductLine findOne(String productLine) {
		return productLineRepository.findByProductLine(productLine);
	}

	public void delete(ProductLine category) {
		productLineRepository.delete(category.getProductLine());
	}
	
	public void save(ProductLine category) {		
		productLineRepository.save(category);
		productLineRepository.flush();
	}
	
	public void update(ProductLine category) {
		ProductLine category_found = findOne(category.getProductLine());	
		//category_found.setProductLine(category.getProductLine());
		category_found.setTextDescription(category.getTextDescription());
		category_found.setHtmlDescription(category.getHtmlDescription());
		category_found.setFile(category.getFile());
		productLineRepository.save(category_found);
	}
	
}
