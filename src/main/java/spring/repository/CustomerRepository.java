package spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import spring.entity.Customer;

public interface CustomerRepository extends JpaRepository<Customer,Integer> {

	//Customer findByName(String customerName);
	
}
