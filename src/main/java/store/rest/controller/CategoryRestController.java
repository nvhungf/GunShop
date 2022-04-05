package store.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import store.entity.Category;
import store.entity.Product;
import store.service.CategoryService;



@CrossOrigin("*")
@RestController
@RequestMapping("/rest/categories")
public class CategoryRestController {

	@Autowired
	CategoryService cateService;
	
	
	@GetMapping()
	public List<Category> getAll(){
		return cateService.findAll();
	}
	
	@GetMapping("{id}")
	public Category getOne(@PathVariable("id") String id) {
		return cateService.findById(id);
	}
	
	@PostMapping
	public Category create(@RequestBody Category category) {
		return cateService.create(category);
	}
	
	@PutMapping("{id}")
	public Category update(@PathVariable("id") String id,@RequestBody Category category) {
		return cateService.update(category);
	}
	
	@DeleteMapping("{id}")
	public void delete(@PathVariable("id") String id) {
		cateService.delete(id);
	}
	
}
