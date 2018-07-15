package spring.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import spring.entity.OrderDetail;
import spring.entity.OrderDetailPK;

public interface OrderDetailRepository extends JpaRepository<OrderDetail,OrderDetailPK> {
	
	List<OrderDetail> findAll();
	
	List<OrderDetail> findByOrderDetailPK(OrderDetailPK orderDetailPK);

	OrderDetail findOneByProductCode(String productCode);
	
	List<OrderDetail> findAllByOrderNumber(Integer orderNumber);

}
