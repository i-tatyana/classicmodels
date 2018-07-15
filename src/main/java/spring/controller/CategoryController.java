package spring.controller;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.entity.ProductLine;
import spring.service.ProductLineService;
import spring.service.UserService;

@Controller
public class CategoryController {

	@Autowired
	private UserService userService;

	@Autowired
	private ProductLineService productLineService;
	
	@ModelAttribute("category")
	public ProductLine constructCategory() {
		return new ProductLine();
	}

	@RequestMapping("/categories")
	public String account(Model model, Principal principal) {
		String name = principal.getName();
		model.addAttribute("user", userService.findOneWithCategories(name));
		model.addAttribute("categories", productLineService.findAll());
		return "categories";
	}

	@RequestMapping(value = "/categories", method = RequestMethod.POST)
	public String doAddCategory(Model model,
			@Valid @ModelAttribute("category") ProductLine category, BindingResult result,
			Principal principal) {
		if (result.hasErrors()) {
			return account(model, principal);
		}
		String name = principal.getName();
		productLineService.save(category, name);
		return "redirect:/categories.html";
	}

	// ----------------------------------------------------------------------------------------- //
	 
	 @RequestMapping("/categories/category/remove/{id}")
	 public String removeCategory(@PathVariable String id) {
		ProductLine category = productLineService.findOne(id);
		productLineService.delete(category);
		return "redirect:/categories.html";
	 }
	
	@RequestMapping("/categories/category/show/{id}")
	public String showCategoryDetails(Model model, @PathVariable String id) {
		model.addAttribute("category", productLineService.findOne(id));
		return "category-show";
	}
	
	 @RequestMapping(value="/categories/category/update/{id}",  method = RequestMethod.GET)
	 public String showCategoryEditorialForm(Model model, @PathVariable String id) {
		model.addAttribute("category", productLineService.findOne(id));
		return "category-edit";
	 }

	 @RequestMapping(value="/categories/category/edit/{id}", method = RequestMethod.POST)
	 public String doEdit(@Valid @ModelAttribute("category") ProductLine category, BindingResult result) {
		if (result.hasErrors()) {
			return "category-edit";
		}		
		productLineService.update(category);
		return "redirect:/categories.html?success=true";
	 }

}