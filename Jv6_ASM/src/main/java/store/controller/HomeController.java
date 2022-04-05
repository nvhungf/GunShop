package store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping("/home/index")
	public String index() {
		return "layout/index";
	}
	
	@RequestMapping("/test")
	public String test() {
		return "layout/test";
	}
}
