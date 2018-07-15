package spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import spring.entity.Office;

public interface OfficeRepository extends JpaRepository<Office,String> {
	
	Office findByOfficeCode(String officeCode);
	
	void delete(Office office);
	
}
