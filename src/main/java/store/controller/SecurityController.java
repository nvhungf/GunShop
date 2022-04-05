package store.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import store.service.AccountService;
import store.service.ForgotService;
import store.service.UserService;

@Controller
public class SecurityController {

	
	
	@RequestMapping("/security/login/form")
	public String LoginForm(Model model) {
		model.addAttribute("message", "Vui long dang nhap lai");
		return "security/login";
	}
	
	
	@RequestMapping("/security/login/success")
	public String succes(Model model) {
		model.addAttribute("message", "Login Thanh Cong");
		return "cart/view";
	}
	
	@RequestMapping("/security/login/error")
	public String loginError(Model model) {
		model.addAttribute("message", "Sai thong tin dang nhap");
		return "security/login";
	}
	
	@RequestMapping("/security/unauthoried")
	public String unauthoried(Model model) {
		model.addAttribute("message", "Khong co quyen truy xuat");
		return "security/login";
	}
	@RequestMapping("/security/logoff/success")
	public String logoffSuccess(Model model) {
		model.addAttribute("message", "Dang xuat thanh cong");
		return "security/login";
	}
	//quen pass
	@RequestMapping("/security/forgot/form")
	public String forgotForm(Model model) {
		return "security/forgotpass";
	}

	
	
	//auth 2
	@Autowired
	UserService Userservice;
	@RequestMapping("/oauth2/login/success")
	public String success(OAuth2AuthenticationToken oauth2) {
		Userservice.loginFormOAuth2(oauth2);
		return "cart/view";
	}
}
