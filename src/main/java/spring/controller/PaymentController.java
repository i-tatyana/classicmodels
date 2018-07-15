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

import spring.entity.Payment;
import spring.service.CustomerService;
import spring.service.PaymentService;

@Controller
@RequestMapping("/payments")
public class PaymentController {

	 @Autowired
	 private PaymentService paymentService;
	
	 @Autowired
	 CustomerService customerService;

	 @ModelAttribute("payment")
	 public Payment constructPayment() {
		 return new Payment();
	 }

	 @RequestMapping
	 public String showAllPayments(Model model) {
		model.addAttribute("payments", paymentService.findAll());
		return "payments";
	 }
	 
	 @RequestMapping(value="/register", method = RequestMethod.GET)
	 public String redirectToPaymentRegistrationForm() {
	 	return "redirect:registrationForm.html";
	 }
	 
	 @RequestMapping(value = "/registrationForm", method = RequestMethod.GET)
	 public String showPaymentRegistrationForm(Model model) {
		model.addAttribute("customers", customerService.findAll());
	    return "payment-create";
	 }

	 @RequestMapping(value="/payment/create", method = RequestMethod.POST)
	 public String doRegister(@Valid Model model, Payment payment, BindingResult result) {
		if (result.hasErrors()) {
			return "payment-create";
		}
		
		model.addAttribute("payment", payment);
		
//		if(customerService.findOne(payment.getPaymentPK().get) == null) {
//			throw new SpringException("Enter the related office firstable");
//		}
		
		paymentService.save(payment);
		
		return "redirect:/payments.html?success=true";
	 }
	 
	 @RequestMapping("/payment/show/{customerNumber}/{checkNumber}")
	 public String showPaymentDetails(Model model, @PathVariable Integer customerNumber, @PathVariable String checkNumber) {
		 List<Payment> payments = paymentService.findAllByCustomerNumber(customerNumber);
		 Payment payment_found = new Payment();
		 for(Payment payment : payments) {
			 if(payment.getCheckNumber().equals(checkNumber)) {
				 payment_found = payment;
			 }
		 }
		 model.addAttribute("payment", payment_found);
		 System.out.println(payment_found);
		return "payment-show";
	 }
	 	 
	 @RequestMapping("/payment/remove/{customerNumber}/{checkNumber}")
	 public String removePayment(@PathVariable int customerNumber, @PathVariable String checkNumber) {
	 List<Payment> payments = paymentService.findAllByCustomerNumber(customerNumber);
	 Payment payment_found = new Payment();
		 for(Payment payment : payments) {
			 if(payment.getCheckNumber().equals(checkNumber)) {
				 payment_found = payment;
			 }
		 }
		 paymentService.delete(payment_found);
		 return "redirect:/payments.html";
	 }
	 
	 @RequestMapping(value="/payment/update/{customerNumber}/{checkNumber}",  method = RequestMethod.GET)
	 public String showPaymentEditorialForm(Model model, @PathVariable int customerNumber, @PathVariable String checkNumber) {
		model.addAttribute("customers", customerService.findAll()); 
		List<Payment> payments = paymentService.findAllByCustomerNumber(customerNumber);
		Payment payment_found = new Payment();
		for(Payment payment : payments) {
			if(payment.getCheckNumber().equals(checkNumber)) {
				payment_found = payment;
			}
		}
		 model.addAttribute("payment", payment_found);
		return "payment-edit";
	 }

	 @RequestMapping(value="/payment/edit/{customerNumber}/{checkNumber}", method = RequestMethod.POST)
	 public String doEdit(@Valid @ModelAttribute("payment") Payment payment, BindingResult result) {
		if (result.hasErrors()) {
			return "payment-edit";
		}		
		paymentService.update(payment);
		return "redirect:/payments.html?success=true";
	 }
	
}
