package store.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import store.entity.Product;




@Controller
public class ProductController {
	@Autowired
	store.service.ProductService proService;
	
	@RequestMapping("/home")
	public String list(Model model, @RequestParam("cid") Optional<String> cid) {
		if (cid.isPresent()) {
			List<Product> list = proService.findByCateId(cid.get());
			model.addAttribute("items",list);
		} else {
			List<Product> list = proService.findAll();
			model.addAttribute("items", list);
		}
		return "/main/home";
	}
	
	@RequestMapping("/product/detail/{id}")
	public String detail(Model model, @PathVariable("id") Integer id) {
		Product item = proService.findById(id);
		model.addAttribute("item", item);
		
		String cateId = item.getCategory().getId();
		List<Product> list = proService.findByCateId(cateId);
		
		List<Product> list1 = proService.findByCateId(cateId);
		list1.clear();
		
		for (int i=0; i<4 ; i++) {
			list1.add(list.get(i));
		}
		
		model.addAttribute("items",list1);
		
		return "product/product_detail";
		
		
	}
	
	
	@RequestMapping("/product/search-price")
	public String price(Model model,
			@RequestParam("min")double min,
			@RequestParam("max")double max) {	
			List<Product> items = proService.findByPrice(min, max);
			model.addAttribute("items", items);	
			return "/main/home";	
	}


	
	
}
