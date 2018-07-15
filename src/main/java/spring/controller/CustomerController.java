package spring.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.exception.SpringException;
import spring.entity.Customer;
import spring.service.CustomerService;
import spring.service.EmployeeService;

@Controller
@RequestMapping("/customers")
public class CustomerController {
		
	 @Autowired
	 private CustomerService customerService;
	 
	 @Autowired
	 private EmployeeService employeeService;

	 @ModelAttribute("customer")
	 public Customer constructCustomer() {
		 return new Customer();
	 }
	 
	 @RequestMapping
	 public String showAllCustomers(Model model) {
		model.addAttribute("customers", customerService.findAll());
		return "customers";
	 }
	 
	 @RequestMapping(value="/register", method = RequestMethod.GET)
	 public String redirectToCustomerRegistrationForm() {
	 	return "redirect:registrationForm.html";
	 }
	 
	 @RequestMapping(value = "/registrationForm", method = RequestMethod.GET)
	 public String showCustomerRegistrationForm(Model model) {
		model.addAttribute("employees", employeeService.findAll());
	    return "customer-create";
	 }

	 @RequestMapping(value="/customer/create", method = RequestMethod.POST)
	 @ExceptionHandler({SpringException.class})
	 public String doRegister(@Valid Customer customer, Model model, BindingResult result) {
		if (result.hasErrors()) {
			return "customer-create?success=false";
		}
		
		model.addAttribute("customer", customer);
		
		if(employeeService.findOne(customer.getSalesRepEmployeeNumber()) == null) {
			throw new SpringException("Enter the related employee firstable");
		}
		
		customerService.save(customer);
		return "redirect:/customers.html?success=true";
	 }
	 
	 // ------------------------------------------------------------------------- //
	 
	 @RequestMapping("/customer/show/{id}")
	 public String showCustomerDetails(Model model, @PathVariable int id) {
		model.addAttribute("customer", customerService.findOne(id));
		return "customer-show";
	 }
	 	 
	 @RequestMapping("/customer/remove/{id}")
	 public String removeCustomer(@PathVariable int id) {
		customerService.delete(id);
		return "redirect:/customers.html";
	 }

	 @RequestMapping(value="/customer/update/{id}",  method = RequestMethod.GET)
	 public String showCustomerEditorialForm(Model model, @PathVariable int id) {
		model.addAttribute("employees", employeeService.findAll()); 
		model.addAttribute("customer", customerService.findOne(id));
		return "customer-edit";
	 }

	 @RequestMapping(value="/customer/edit/{id}", method = RequestMethod.POST)
	 public String doEdit(@Valid @ModelAttribute("customer") Customer customer, BindingResult result) {
		if (result.hasErrors()) {
			return "customer-edit";
		}		
		customerService.update(customer);
		return "redirect:/customers.html?success=true";
	 }
	 
}
