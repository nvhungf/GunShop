package store.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import store.entity.Report;
import store.service.ProductService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/iventory")
public class IventoryRestController {
	@Autowired
	ProductService proService;
	
	@GetMapping()
	public List<Report> getAll(){
		return proService.getInventoryByCategory();
	}
}
