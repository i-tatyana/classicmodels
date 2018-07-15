package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.service.ProductService;

@Controller
public class IndexController {
	
	@Autowired
	private ProductService productService;

	@RequestMapping("/index")
	public String index(Model model) {
		model.addAttribute("products", productService.getProducts());
		return "index";
	}

}
