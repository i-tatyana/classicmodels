package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.entity.Order;
import spring.repository.OrderRepository;

@Service
public class OrderService {

	@Autowired
	private OrderRepository orderRepository;
	
	public List<Order> findAll(){
		return orderRepository.findAll();
	}

	public void save(Order order) {								
		orderRepository.save(order);
	}
	
	public void delete(int id) {
		orderRepository.delete(id);		
	}

	public void update(Order order) {
		Order order_found = orderRepository.findOne(order.getOrderNumber());	
		//order_found.setOrderNumber(order.getOrderNumber());
		order_found.setOrderDate(order.getOrderDate());
		order_found.setRequiredDate(order.getRequiredDate());
		order_found.setShippedDate(order.getShippedDate());
		order_found.setStatus(order.getStatus());
		order_found.setComments(order.getComments());
		//order_found.setCustomerNumber(order.getCustomerNumber());
		orderRepository.save(order_found);
	}

	public Order findOne(int id) {
		return orderRepository.findOne(id);
	}
	
}
