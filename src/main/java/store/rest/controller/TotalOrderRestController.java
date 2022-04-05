package store.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import store.entity.Total;
import store.entity.TotalOrder;
import store.service.OrderDetailsService;
import store.service.OrderService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/totalorder")
public class TotalOrderRestController {
	@Autowired
	OrderService Service;
	
	@GetMapping
	public List<TotalOrder> getAll(){
		return Service.getTotalOrder();
	}
}
