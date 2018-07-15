package spring.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.entity.Payment;
import spring.repository.PaymentRepository;

@Service
@Transactional
public class PaymentService {

	@Autowired
	private PaymentRepository paymentRepository;
	
	public List<Payment> findAll(){
		return paymentRepository.findAll();
	}
	
	public Payment findOneByCheckNumber(String checkNumber) {
		return paymentRepository.findOneByCheckNumber(checkNumber);
	}
	
	public List<Payment> findAllByCustomerNumber(Integer customerNumber) {
		return paymentRepository.findAllByCustomerNumber(customerNumber);
	}

	public void save(Payment payment) {
		paymentRepository.save(payment);
		paymentRepository.flush();
	}

	public void update(Payment payment) {
		List<Payment> payments = paymentRepository.findAllByCustomerNumber(payment.getCustomerNumber());
		Payment payment_found = new Payment();
		for(Payment pay : payments) {
			if(pay.getCheckNumber().equals(payment.getCheckNumber())) {
				payment_found = pay;
			}
		}
		
		//payment_found.setCustomerNumber(payment.getCustomerNumber());
		//payment_found.setCheckNumber(payment.getCheckNumber());
		payment_found.setPaymentDate(payment.getPaymentDate());
		payment_found.setAmount(payment.getAmount());
		paymentRepository.save(payment_found);
	}

	public void delete(Payment payment) {
		paymentRepository.delete(payment);
	}
	
}
