package store.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import store.entity.Account;
import store.service.AccountService;
import store.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	OrderService orderService;
	
	@Autowired
	AccountService AccSerVice;
	
	@RequestMapping("/order/checkout")
	public String checkout(Model model,
			HttpServletRequest req) {
		String username =  req.getRemoteUser();
		if (username != null) {
			Account list = AccSerVice.finfById(username);
			model.addAttribute("account",list);
		} else {
			Account accounts = new Account();
			model.addAttribute("accounts", accounts);
		}
		
		return "order/checkout";
	}
	
	
	@RequestMapping("/order/list")
	public String list(Model model,
			HttpServletRequest req) {
		String username =  req.getRemoteUser();
		Account list = AccSerVice.finfById(username);
		model.addAttribute("account",list);
		model.addAttribute("orders",orderService.findByUsername(username));
		return "order/list";
	}
	
	@RequestMapping("/order/detail/{id}")
	public String detail(@PathVariable("id")Long id,
			Model model) {
		model.addAttribute("order",orderService.findById(id));
		return "order/detail";
	}
	
	
	@RequestMapping("order/changes/{id}")
	public String changes(@PathVariable("id") Long id, Model model ) {
		String trangthai = "Đã Huỷ";
		orderService.changesDH(trangthai,id);
		model.addAttribute("message", "Đơn hàng đã hủy thành công");
		return "forward:/order/detail/" + id ;
	}
	
	
	@RequestMapping("order/success/{id}")
	public String success(@PathVariable("id") Long id, Model model ) {
		String trangthai = "Đã Giao";
		orderService.successDH(trangthai,id);
		model.addAttribute("message", "Đơn hàng đã giao thành công");
		return "forward:/order/detail/" + id ;
	}
}
