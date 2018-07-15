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

import spring.entity.Order;
import spring.exception.SpringException;
import spring.service.CustomerService;
import spring.service.OrderService;

@Controller
@RequestMapping("/orders")
public class OrderController {

	 @Autowired
	 private OrderService orderService;
	
	 @Autowired
	 private CustomerService customerService;

	 @ModelAttribute("order")
	 public Order constructOrder() {
		 return new Order();
	 }

	 @RequestMapping
	 public String showAllOrders(Model model) {
		model.addAttribute("orders", orderService.findAll());
		return "orders";
	 }
	 
	 @RequestMapping(value="/register", method = RequestMethod.GET)
	 public String redirectToOrderRegistrationForm() {
	 	return "redirect:registrationForm.html";
	 }
	 
	 @RequestMapping(value = "/registrationForm", method = RequestMethod.GET)
	 public String showOrderRegistrationForm(Model model) {
		model.addAttribute("customers", customerService.findAll());
	    return "order-create";
	 }

	 @RequestMapping(value="/order/create", method = RequestMethod.POST)
	 public String doRegister(@Valid Model model, Order order, BindingResult result) {
		if (result.hasErrors()) {
			return "order-create";
		}
		
		model.addAttribute("order", order);
		
		if(customerService.findOne(order.getCustomerNumber()) == null) {
			throw new SpringException("Enter the related customer firstable");
		}
		
		orderService.save(order);
		
		return "redirect:/orders.html?success=true";
	 }
	 
	 // ------------------------------------------------------------------------- //
	
	 @RequestMapping("/order/show/{id}")
	 public String showOrderDetails(Model model, @PathVariable int id) {
		model.addAttribute("order", orderService.findOne(id));
		return "order-show";
	 }
	 	 
	 @RequestMapping("/order/remove/{id}")
	 public String removeOrder(@PathVariable int id) {
		orderService.delete(id);
		return "redirect:/orders.html";
	 }
	 
	 @RequestMapping(value="/order/update/{id}",  method = RequestMethod.GET)
	 public String showOrderEditorialForm(Model model, @PathVariable int id) {
		model.addAttribute("customers", customerService.findAll()); 
		model.addAttribute("order", orderService.findOne(id));
		return "order-edit";
	 }

	 @RequestMapping(value="/order/edit/{id}", method = RequestMethod.POST)
	 public String doEdit(@Valid @ModelAttribute("order") Order order, BindingResult result) {
		if (result.hasErrors()) {
			return "order-edit";
		}		
		orderService.update(order);
		return "redirect:/orders.html?success=true";
	 }
	 
}
