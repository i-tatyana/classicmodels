package spring.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import spring.entity.Product;
import spring.entity.ProductLine;
import spring.entity.Role;
import spring.entity.User;
import spring.repository.ProductLineRepository;
import spring.repository.ProductRepository;
import spring.repository.RoleRepository;
import spring.repository.UserRepository;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private ProductLineRepository productLineRepository;
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	public List<User> findAll(){
		return userRepository.findAll();
	}
	
	public User findOne(int id) {
		return userRepository.findOne(id);
	}
	
	public void save(User user) {
		user.setEnabled(true);
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		user.setPassword(encoder.encode(user.getPassword()));
				
		List<Role> roles = new ArrayList<Role>();
		roles.add(roleRepository.findByName("ROLE_USER"));
		user.setRoles(roles);		
		
		userRepository.save(user);
	}
	
	@Transactional
	public User findOneWithCategories(int id) {
		User user = findOne(id);
		List<ProductLine> categories = productLineRepository.findByUser(user);
		for(ProductLine category : categories) {
			List<Product> products = productRepository.findByCategory(category.getProductLine()/*, new PageRequest(0, 10, Direction.DESC, "buyPrice")*/);
			category.setProducts(products);
		}
		user.setCategories(categories);
		return user;
	}
	
	public User findOneWithCategories(String name){
		User user = userRepository.findByName(name);
		return findOneWithCategories(user.getId());
	}

	public void delete(int id) {
		userRepository.delete(id);		
	}

	public User findOne(String username) {
		return userRepository.findByName(username);
	}
	
}
