package spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import spring.entity.Payment;
import spring.entity.PaymentPK;

public interface PaymentRepository extends JpaRepository<Payment,PaymentPK> {
	
	List<Payment> findAll();
	
	List<Payment> findByPaymentPK(PaymentPK paymentPK);

	Payment findOneByCheckNumber(String checkNumber);
	
	List<Payment> findAllByCustomerNumber(Integer customerNumber);	
	
}
