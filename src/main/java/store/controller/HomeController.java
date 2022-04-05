package store.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import store.entity.Report;

import store.entity.Product;




@Controller
public class HomeController {
	
	@Autowired
	store.service.ProductService productService;
	
	
	@RequestMapping({"/","/home/index"})
	public String home() {
		return "redirect:/home";
	}
	
	@RequestMapping({"/admin","/admin/home/index"})
	public String admin() {
		return "redirect:/assets/admin/index.html";
	}
	
	@RequestMapping({"/admin/home/iventory"})
	public String iventory(Model model) {
		List<Product> list = productService.findAll();
		model.addAttribute("items", list);
		return "redirect:/assets/admin/product/iventory.html";
	}
}
