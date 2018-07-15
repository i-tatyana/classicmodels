package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.entity.Customer;
import spring.repository.CustomerRepository;

@Service
public class CustomerService {

	@Autowired
	private CustomerRepository customerRepository;
	
	public List<Customer> findAll(){
		return customerRepository.findAll();
	}

	public void save(Customer customer) {								
		customerRepository.save(customer);
	}
	
	public void delete(int id) {
		customerRepository.delete(id);		
	}

	public void update(Customer customer) {
		Customer customer_found = customerRepository.findOne(customer.getCustomerNumber());	
		//customer_found.setCustomerNumber(customer.getCustomerNumber());
		customer_found.setCustomerName(customer.getCustomerName());
		customer_found.setContactFirstName(customer.getContactFirstName());
		customer_found.setContactLastName(customer.getContactLastName());
		customer_found.setPhone(customer.getPhone());
		customer_found.setAddressLine1(customer.getAddressLine1());
		customer_found.setAddressLine2(customer.getAddressLine2());
		customer_found.setCountry(customer.getCountry());
		customer_found.setCity(customer.getCity());
		customer_found.setState(customer.getState());
		customer_found.setPostalCode(customer.getPostalCode());
		customer_found.setCreditLimit(customer.getCreditLimit());
		//customer_found.setSalesRepEmployeeNumber(customer.getSalesRepEmployeeNumber());
		customerRepository.save(customer_found);
	}

	public Customer findOne(int id) {
		return customerRepository.findOne(id);
	}
	
}
