package za.co.discovery.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import za.co.discovery.entity.Atm;
import za.co.discovery.exception.ResourceNotFoundException;
import za.co.discovery.service.AtmService;

/**
 *
 * @author keneyfofeyin
 */
@RestController
@RequestMapping("/api/discovery")
public class AtmController {

	@Autowired
	private AtmService atm;

	@PostMapping("/fetchAtm")
	public Atm withdraw(@RequestParam(name = "atmId") Integer atmId) {
		return atm.findAtm(atmId).orElseThrow(() -> new ResourceNotFoundException("Atm", "atmId", atmId));
	}

}
