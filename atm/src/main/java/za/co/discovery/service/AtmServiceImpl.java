package za.co.discovery.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import za.co.discovery.entity.Atm;
import za.co.discovery.repository.AtmRepository;

@Service
public class AtmServiceImpl implements AtmService {

	@Autowired
	private AtmRepository atmRepo;

	@Override
	public Optional<Atm> findAtm(Integer atmId) {
		return atmRepo.findByAtmId(atmId);
	}

	
}
