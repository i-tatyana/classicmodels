package spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import spring.entity.Order;

public interface OrderRepository extends JpaRepository<Order,Integer> {

}
