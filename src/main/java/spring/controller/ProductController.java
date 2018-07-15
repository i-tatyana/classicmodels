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

import spring.entity.Product;
import spring.exception.SpringException;
import spring.service.ProductLineService;
import spring.service.ProductService;

@Controller
@RequestMapping("/products")
public class ProductController {
	
	@Autowired 
	private ProductService productService;
	 
	@Autowired
	private ProductLineService productLineService;
	

	 @ModelAttribute("product")
	 public Product constructProduct() {
		 return new Product();
	 }
	 
	 @RequestMapping
	 public String showAllProducts(Model model) {
		model.addAttribute("categories", productLineService.findAll());
		model.addAttribute("products", productService.findAll());
		return "products";
	 }
	 
	 @RequestMapping(value="/register", method = RequestMethod.GET)
	 public String redirectToProductRegistrationForm() {
	 	return "redirect:registrationForm.html";
	 }
	 
	 @RequestMapping(value = "/registrationForm", method = RequestMethod.GET)
	 public String showProductRegistrationForm(Model model) {
		 model.addAttribute("categories", productLineService.findAll());
	    return "product-create";
	 }

	 @RequestMapping(value="/product/create", method = RequestMethod.POST)
	 @ExceptionHandler({SpringException.class})
	 public String doRegister(@Valid Product product, Model model, BindingResult result) {
		if (result.hasErrors()) {
			return "product-create?success=false";
		}
		
		model.addAttribute("product", product);
		
//		if(productService.findOne(productLine.getSalesRepEmployeeNumber()) == null) {
//			throw new SpringException("Enter the related employee firstable");
//		}
		
		productService.save(product);
		return "redirect:/products.html?success=true";
	 }
	 
	 // ------------------------------------------------------------------------- //
	 
	 @RequestMapping("/product/show/{id}")
	 public String showProductDetails(Model model, @PathVariable String id) {
		model.addAttribute("product", productService.findOne(id));
		return "product-show";
	 }
	 	 
	 @RequestMapping("/product/remove/{id}")
	 public String removeProduct(@PathVariable String id) {
		productService.delete(id);
		return "redirect:/products.html";
	 }

	 @RequestMapping(value="/product/update/{id}",  method = RequestMethod.GET)
	 public String showProductEditorialForm(Model model, @PathVariable String id) {
		model.addAttribute("categories", productService.findAll()); 
		model.addAttribute("product", productService.findOne(id));
		return "product-edit";
	 }

	 @RequestMapping(value="/product/edit/{id}", method = RequestMethod.POST)
	 public String doEdit(@Valid @ModelAttribute("product") Product product, BindingResult result) {
		if (result.hasErrors()) {
			return "product-edit";
		}		
		productService.update(product);
		return "redirect:/products.html?success=true";
	 }
	 
	 
}
