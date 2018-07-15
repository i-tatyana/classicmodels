package spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import spring.entity.MailMessage;

public interface MessageRepository extends JpaRepository<MailMessage,String> {

	MailMessage findByEmail(String email);

}
