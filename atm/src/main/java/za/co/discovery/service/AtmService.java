package za.co.discovery.service;

import java.util.Optional;

import za.co.discovery.entity.Atm;


public interface AtmService {

	Optional<Atm> findAtm(Integer atmId);
	
}
