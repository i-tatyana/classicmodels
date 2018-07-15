package spring.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.exception.SpringException;
import spring.entity.Employee;
import spring.service.EmployeeService;
import spring.service.OfficeService;

@Controller
@RequestMapping("/employees")
public class EmployeeController {
   
	 @Autowired
	 private EmployeeService employeeService;
	
	 @Autowired
	 OfficeService officeService;

	 @ModelAttribute("employee")
	 public Employee constructEmployee() {
		 return new Employee();
	 }

	 @RequestMapping
	 public String showAllEmployees(Model model) {
		model.addAttribute("employees", employeeService.findAll());
		return "employees";
	 }
	 
	 @RequestMapping(value="/register", method = RequestMethod.GET)
	 public String redirectToEmployeeRegistrationForm() {
	 	return "redirect:registrationForm.html";
	 }
	 
	 @RequestMapping(value = "/registrationForm", method = RequestMethod.GET)
	 public String showEmployeeRegistrationForm(Model model) {
		model.addAttribute("offices", officeService.findAll());
	    return "employee-create";
	 }

	 @RequestMapping(value="/employee/create", method = RequestMethod.POST)
	 public String doRegister(@Valid Model model, Employee employee, BindingResult result) {
		if (result.hasErrors()) {
			return "employee-create";
		}
		
		model.addAttribute("employee", employee);
		
		if(officeService.findOne(employee.getOfficeCode()) == null) {
			throw new SpringException("Enter the related office firstable");
		}
		
		employeeService.save(employee);
		
		return "redirect:/employees.html?success=true";
	 }
	 
	 @RequestMapping("/employee/show/{id}")
	 public String showEmployeeDetails(Model model, @PathVariable int id) {
		model.addAttribute("employee", employeeService.findOne(id));
		return "employee-show";
	 }
	 	 
	 @RequestMapping("/employee/remove/{id}")
	 public String removeEmployee(@PathVariable int id) {
		employeeService.delete(id);
		return "redirect:/employees.html";
	 }
	 
	 @RequestMapping(value="/employee/update/{id}",  method = RequestMethod.GET)
	 public String showCustomerEditorialForm(Model model, @PathVariable int id) {
		model.addAttribute("offices", officeService.findAll()); 
		model.addAttribute("employee", employeeService.findOne(id));
		return "employee-edit";
	 }

	 @RequestMapping(value="/employee/edit/{id}", method = RequestMethod.POST)
	 public String doEdit(@Valid @ModelAttribute("employee") Employee employee, BindingResult result) {
		if (result.hasErrors()) {
			return "employee-edit";
		}		
		employeeService.update(employee);
		return "redirect:/employees.html?success=true";
	 }
	
}
