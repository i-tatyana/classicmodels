package spring.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.entity.OrderDetail;
import spring.service.OrderDetailService;
import spring.service.OrderService;
import spring.service.ProductService;

@Controller
@RequestMapping("/orderdetails")
public class OrderDetailController {
	
	@Autowired
	OrderDetailService orderDetailService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrderService orderSevice;
	
	@ModelAttribute("orderdetail")
	public OrderDetail constructOrderDetail() {
		return new OrderDetail();
	}

	@RequestMapping
	public String showAllOrderDetails(Model model) {
		model.addAttribute("orderdetails", orderDetailService.findAll());
		return "orderdetails";
	}
	
	@RequestMapping(value="/register", method = RequestMethod.GET)
	 public String redirectToOrderDetailRegistrationForm() {
	 	return "redirect:registrationForm.html";
	 }
	 
	 @RequestMapping(value = "/registrationForm", method = RequestMethod.GET)
	 public String showOrderDetailRegistrationForm(Model model) {
		model.addAttribute("products", productService.findAll());
		model.addAttribute("orders", orderSevice.findAll());
	    return "orderdetail-create";
	 }

	 @RequestMapping(value="/orderdetail/create", method = RequestMethod.POST)
	 public String doRegister(@Valid Model model, OrderDetail orderdetail, BindingResult result) {
		if (result.hasErrors()) {
			return "orderdetail-create";
		}
		
		model.addAttribute("orderdetail", orderdetail);
		
//		if(customerService.findOne(payment.getPaymentPK().get) == null) {
//			throw new SpringException("Enter the related office firstable");
//		}
		
		orderDetailService.save(orderdetail);
		
		return "redirect:/orderdetails.html?success=true";
	 }
	 
	 @RequestMapping("/orderdetail/show/{orderNumber}/{productCode}")
	 public String showPaymentDetails(Model model, @PathVariable Integer orderNumber, @PathVariable String productCode) {
		 List<OrderDetail> orderDetails = orderDetailService.findAllByOrderNumber(orderNumber);
		 OrderDetail orderDetail_found = new OrderDetail();
		 for(OrderDetail order : orderDetails) {
			 if(order.getProductCode().equals(productCode)) {
				 orderDetail_found = order;
			 }
		 }
		 model.addAttribute("orderdetail", orderDetail_found);
		return "orderdetail-show";
	 }
	 	 
	 @RequestMapping("/orderdetail/remove/{orderNumber}/{productCode}")
	 public String removeOrderDetail(@PathVariable int orderNumber, @PathVariable String productCode) {
	 List<OrderDetail> orderDetails = orderDetailService.findAllByOrderNumber(orderNumber);
	 OrderDetail orderDetail_found = new OrderDetail();
		 for(OrderDetail order : orderDetails) {
			 if(order.getProductCode().equals(productCode)) {
				 orderDetail_found = order;
			 }
		 }
		 orderDetailService.delete(orderDetail_found);
		 return "redirect:/orderdetails.html";
	 }
	 
	 @RequestMapping(value="/orderdetail/update/{orderNumber}/{productCode}",  method = RequestMethod.GET)
	 public String showPaymentEditorialForm(Model model, @PathVariable int orderNumber, @PathVariable String productCode) {
		model.addAttribute("products", productService.findAll()); 
		model.addAttribute("orders", orderSevice.findAll());
		List<OrderDetail> orderDetails = orderDetailService.findAllByOrderNumber(orderNumber);
		OrderDetail orderDetail_found = new OrderDetail();
		for(OrderDetail order : orderDetails) {
			if(order.getProductCode().equals(productCode)) {
				orderDetail_found = order;
			}
		}
		 model.addAttribute("orderdetail", orderDetail_found);
		return "orderdetail-edit";
	 }

	 @RequestMapping(value="/orderdetail/edit/{orderNumber}/{productCode}", method = RequestMethod.POST)
	 public String doEdit(@Valid @ModelAttribute("orderdetail") OrderDetail orderDetail, BindingResult result) {
		if (result.hasErrors()) {
			return "orderdetail-edit";
		}		
		orderDetailService.update(orderDetail);
		return "redirect:/orderdetails.html?success=true";
	 }

}
