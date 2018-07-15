package spring.controller;

import java.io.IOException;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
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

import spring.entity.MailMessage;
import spring.exception.SpringException;
import spring.service.MessageService;
import spring.service.UserService;

@Controller
@RequestMapping("/messages")
public class MessageController {

	@Autowired
	private MessageService messageService;
	
	@Autowired
	private UserService userService;
	
	@ModelAttribute("message")
	public MailMessage constructMessage() {
		return new MailMessage();
	}
	 
	@RequestMapping
	public String showAllMessages(Model model) {
		model.addAttribute("messages", messageService.findAll());
		return "messages";
	}
	
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public String redirectToCustomerRegistrationForm() {
	 	return "redirect:registrationForm.html";
	}
	 
	@RequestMapping(value = "/registrationForm", method = RequestMethod.GET)
	public String showMessageRegistrationForm(Model model) {
		model.addAttribute("users", userService.findAll());
	    return "message-create";
	}

	@SuppressWarnings("static-access")
	@RequestMapping(value="/message/create", method = RequestMethod.POST)
	@ExceptionHandler({SpringException.class})
	public String doRegister(@Valid MailMessage message, Model model, BindingResult result) throws AddressException, IOException, MessagingException {
		if (result.hasErrors()) {
			return "message-create?success=false";
		}
		
		model.addAttribute("message", message);
		
//		String recipient = message.getEmail();
		
//		new Email().main(recipient);
		
		messageService.save(message);
		
		return "redirect:/messages/registrationForm.html?success=true";
	}
	
	// ----------------------------------------------------------------------------------------- //
	
	@RequestMapping("/message/show/{id}")
	public String showMessageDetails(Model model, @PathVariable String id) {
		model.addAttribute("message", messageService.findOne(id));
		return "message-show";
	}
	 	 
	@RequestMapping("/message/remove/{id}")
	public String removeMessage(@PathVariable String id) {
		messageService.delete(id);
		return "redirect:/messages.html";
	}

	@RequestMapping(value="/message/update/{id}",  method = RequestMethod.GET)
	public String showMessageEditorialForm(Model model, @PathVariable String id) {
		model.addAttribute("users", userService.findAll());
		model.addAttribute("message", messageService.findOne(id));
		return "message-edit";
	}

	@RequestMapping(value="/message/edit/{id}", method = RequestMethod.POST)
	public String doEdit(@Valid @ModelAttribute("message") MailMessage message, BindingResult result) {
		if (result.hasErrors()) {
			return "message-edit";
		}		
		messageService.update(message);
		return "redirect:/messages.html?success=true";
	}
	
}
