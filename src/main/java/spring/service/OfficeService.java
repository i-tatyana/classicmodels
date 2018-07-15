package spring.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.entity.Office;
import spring.repository.OfficeRepository;

@Service
@Transactional
public class OfficeService {

	@Autowired
	private OfficeRepository officeRepository;
	
	public List<Office> findAll(){
		return officeRepository.findAll();
	}

	public void save(Office office) {								
		officeRepository.save(office);
	}
	
	public void delete(String officeCode) {
		Office office = findOne(officeCode);
		officeRepository.delete(office);		
	}

	public void update(Office office) {
		Office office_found = findOne(office.getOfficeCode());	
		//office_found.setOfficeCode(office.getOfficeCode());
		office_found.setCity(office.getCity());
		office_found.setPhone(office.getPhone());
		office_found.setAddressLine1(office.getAddressLine1());
		office_found.setAddressLine2(office.getAddressLine2());
		office_found.setState(office.getState());
		office_found.setCountry(office.getCountry());
		office_found.setPostalCode(office.getPostalCode());
		office_found.setTerritory(office.getTerritory());
		officeRepository.save(office_found);
	}

	public Office findOne(String officeCode) {
		return officeRepository.findByOfficeCode(officeCode);
	}
	
}
