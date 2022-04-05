package store.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.JsonNode;

import store.dao.OrderDetailsDao;
import store.entity.Order;
import store.entity.Total;
import store.service.OrderDetailsService;
import store.service.OrderService;



@CrossOrigin("*")
@RestController
@RequestMapping("/rest/orderdetails")
public class OrderDetailsRestController {
	@Autowired
	OrderDetailsService Service;
	
	@GetMapping
	public List<Total> getAll(){
		return Service.getTotal();
	}
	
	
}
