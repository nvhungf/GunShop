package store.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import store.entity.Total;
import store.entity.TotalOrder;
import store.entity.TotalProduct;
import store.service.OrderDetailsService;
import store.service.OrderService;
import store.service.ProductService;

@CrossOrigin("*")
@RestController
@RequestMapping("/rest/totalproduct")
public class TotalProductRestController {
	@Autowired
	ProductService Service;
	
	@GetMapping
	public List<TotalProduct> getAll(){
		return Service.getTotalProduct();
	}
}
