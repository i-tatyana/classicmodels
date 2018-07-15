package spring.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import spring.entity.Role;
import spring.entity.User;
import spring.repository.RoleRepository;
import spring.repository.UserRepository;

@Transactional
@Service
public class InitDbService {

	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private UserRepository userRepository;
		
	@PostConstruct
	public void init() {
		if (roleRepository.findByName("ROLE_ADMIN") == null) {
			Role roleUser = new Role();
			roleUser.setName("ROLE_USER");
			roleRepository.save(roleUser);

			Role roleAdmin = new Role();
			roleAdmin.setName("ROLE_ADMIN");
			roleRepository.save(roleAdmin);

			User userAdmin = new User();
			userAdmin.setEnabled(true);
			userAdmin.setName("admin");
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			userAdmin.setPassword(encoder.encode("admin"));
			List<Role> roles = new ArrayList<Role>();
			roles.add(roleAdmin);
			roles.add(roleUser);
			userAdmin.setRoles(roles);
			userRepository.save(userAdmin);

//			Category category = new Category();
//			
//			category.setId("JavaVids");
//			category.setUser(userAdmin);
//			categoryRepository.save(category);
//
//			Product item1 = new Product();
//			item1.setProductCode("FGHt_458");
//			item1.setProductName("productName");
//			item1.setProductLine("JavaVids");
//			item1.setProductScale("productScale");
//			item1.setProductVendor("productVendor");
//			item1.setProductDescription("productDescription");
//			item1.setQuantityInStock(257);
//			item1.setBuyPrice(new BigDecimal(27400.86));
//			item1.setMsrp(new BigDecimal(16000.00));
//			productRepository.save(item1);
//			
//			Product item2 = new Product();
//			item2.setProductCode("Hgsy_6452");
//			item2.setProductName("productName_2");
//			item2.setProductLine("JavaVids");
//			item2.setProductScale("productScale_2");
//			item2.setProductVendor("productVendor_2");
//			item2.setProductDescription("productDescription_2");
//			item2.setQuantityInStock(746);
//			item2.setBuyPrice(new BigDecimal(47700.80));
//			item2.setMsrp(new BigDecimal(45200.00));
//			productRepository.save(item2);
			
		}
	}	
}