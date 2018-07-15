package spring.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.entity.MailMessage;
import spring.repository.MessageRepository;

@Service
@Transactional
public class MessageService {

	@Autowired
	private MessageRepository messageRepository;
	
	public List<MailMessage> findAll(){
		return messageRepository.findAll();
	}

	public void save(MailMessage message) {		
		message.setStatus("wait");
		messageRepository.save(message);
	}
	
	public void delete(String email) {
		//Office office = findOne(officeCode);
		messageRepository.delete(email);		
	}

	public void update(MailMessage message) {
		MailMessage message_found = findOne(message.getEmail());	
		//message_found.setEmail(message.getEmail());
		message_found.setPhone(message.getPhone());
		message_found.setSubject(message.getSubject());
		message_found.setBody(message.getBody());		
		message_found.setMessagesRepUserNumber(message.getMessagesRepUserNumber());
		message_found.setStatus(message.getStatus());
		messageRepository.save(message_found);
	}

	public MailMessage findOne(String email) {
		return messageRepository.findByEmail(email);
	}
	
}
