package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.entity.Employee;
import spring.repository.EmployeeRepository;

@Service
public class EmployeeService {

	@Autowired
	private EmployeeRepository employeeRepository;
	
	public List<Employee> findAll(){
		return employeeRepository.findAll();
	}

	public void save(Employee employee) {								
		employeeRepository.save(employee);
	}
	
	public void delete(int id) {
		employeeRepository.delete(id);		
	}
	
	public void update(Employee employee) {
		Employee employee_found = employeeRepository.findOne(employee.getEmployeeNumber());	
		//employee_found.setEmployeeNumber(customer.getEmployeeNumber());
		employee_found.setLastName(employee.getLastName());
		employee_found.setFirstName(employee.getFirstName());
		employee_found.setExtension(employee.getExtension());
		employee_found.setEmail(employee.getEmail());
		//employee_found.setOfficeCode(employee.getOfficeCode());
		employee_found.setJobTitle(employee.getJobTitle());
		employeeRepository.save(employee_found);
	}
	
	public Employee findOne(int id) {
		return employeeRepository.findOne(id);
	}
	
}
