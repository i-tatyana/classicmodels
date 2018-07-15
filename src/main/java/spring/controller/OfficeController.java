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
import spring.entity.Office;
import spring.service.OfficeService;

@Controller
@RequestMapping("/offices")
public class OfficeController {
	
	@Autowired
	private OfficeService officeService;
	
	@ModelAttribute("office")
	public Office constructOffice() {
		return new Office();
	}
	 
	@RequestMapping
	public String showAllOffices(Model model) {
		model.addAttribute("offices", officeService.findAll());
		return "offices";
	}
	
	@RequestMapping(value="/register", method = RequestMethod.GET)
	 public String redirectToCustomerRegistrationForm() {
	 	return "redirect:registrationForm.html";
	 }
	 
	 @RequestMapping(value = "/registrationForm", method = RequestMethod.GET)
	 public String showCustomerRegistrationForm(Model model) {
		//model.addAttribute("offices", officeService.findAll());
	    return "office-create";
	 }

	 @RequestMapping(value="/office/create", method = RequestMethod.POST)
	 @ExceptionHandler({SpringException.class})
	 public String doRegister(@Valid Office office, Model model, BindingResult result) {
		if (result.hasErrors()) {
			return "office-create?success=false";
		}
		
		model.addAttribute("office", office);
				
		officeService.save(office);
		return "redirect:/offices.html?success=true";
	 }
	 
	// ----------------------------------------------------------------------------------------- //
	 
	 @RequestMapping("/office/show/{id}")
	 public String showOfficeDetails(Model model, @PathVariable String id) {
		model.addAttribute("office", officeService.findOne(id));
		return "office-show";
	 }
	 	 
	 @RequestMapping("/office/remove/{id}")
	 public String removeOffice(@PathVariable String id) {
		officeService.delete(id);
		return "redirect:/offices.html";
	 }

	 @RequestMapping(value="/office/update/{id}",  method = RequestMethod.GET)
	 public String showOfficeEditorialForm(Model model, @PathVariable String id) {
		model.addAttribute("office", officeService.findOne(id));
		return "office-edit";
	 }

	 @RequestMapping(value="/office/edit/{id}", method = RequestMethod.POST)
	 public String doEdit(@Valid @ModelAttribute("office") Office office, BindingResult result) {
		if (result.hasErrors()) {
			return "office-edit";
		}		
		officeService.update(office);
		return "redirect:/offices.html?success=true";
	 }
	
}
