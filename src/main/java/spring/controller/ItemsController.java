package spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.entity.Product;
import spring.entity.ProductLine;
import spring.service.ProductLineService;

@Controller
@RequestMapping("/items")
public class ItemsController {

	@Autowired
	private ProductLineService productLineService;
	

	@ModelAttribute("product")
	public Product constructProduct() {
		return new Product();
	}	 

    @RequestMapping
	public String showProductsByCategory(Model model/*, @PathVariable String id*/) {
		List<ProductLine> categories = productLineService.findAll();
		for(ProductLine category : categories) {
			ProductLine productLine = new ProductLine();
			productLine = category;
			productLine.setProductLine(category.getProductLine().replaceAll(" ", "_"));
		}
		model.addAttribute("categories", categories);
		return "items";
	}
	
}
