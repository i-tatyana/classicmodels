package spring.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.entity.OrderDetail;
import spring.repository.OrderDetailRepository;

@Service
@Transactional
public class OrderDetailService {
	
	@Autowired
	private OrderDetailRepository orderDetailRepository;
	
	public List<OrderDetail> findAll(){
		return orderDetailRepository.findAll();
	}
	
	public OrderDetail findOneByProductCode(String productCode) {
		return orderDetailRepository.findOneByProductCode(productCode);
	}
	
	public List<OrderDetail> findAllByOrderNumber(Integer orderNumber) {
		return orderDetailRepository.findAllByOrderNumber(orderNumber);
	}

	public void save(OrderDetail orderDetail) {
		orderDetailRepository.save(orderDetail);
		orderDetailRepository.flush();
	}

	public void update(OrderDetail orderDetail) {
		List<OrderDetail> orderDetails = orderDetailRepository.findAllByOrderNumber(orderDetail.getOrderNumber());
		OrderDetail orderDetail_found = new OrderDetail();
		for(OrderDetail order : orderDetails) {
			if(order.getProductCode().equals(orderDetail.getProductCode())) {
				orderDetail_found = order;
			}
		}
		
		orderDetail_found.setQuantityOrdered(orderDetail.getQuantityOrdered());
		orderDetail_found.setPriceEach(orderDetail.getPriceEach());
		orderDetail_found.setOrderLineNumber(orderDetail.getOrderLineNumber());
		orderDetailRepository.save(orderDetail_found);
	}

	public void delete(OrderDetail orderDetail) {
		orderDetailRepository.delete(orderDetail);
	}

}
