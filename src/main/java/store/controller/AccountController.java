package store.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



import store.entity.Account;
import store.model.AccountDto;
import store.service.AccountService;
import store.service.ForgotService;

@Controller
@RequestMapping("home/account")
public class AccountController {
	@Autowired
	HttpServletRequest request;
	@Autowired
	AccountService service;
	
	@Autowired
	ForgotService Fservice;
	
	@Autowired
	JavaMailSender mailer;

	@PostMapping("update")
	public ModelAndView update(ModelMap model,
			@Valid @ModelAttribute("account") AccountDto dto, BindingResult result) {
		
		if(result.hasErrors()) {
			return new ModelAndView("order/list");
		}
		
		Account entity = new Account();
		
		BeanUtils.copyProperties(dto, entity);
		
		model.addAttribute("message", "Cập Nhật Thông Tin Thành Công");
		
		service.save(entity);
		
		return new ModelAndView("forward:/order/list", model) ;
	}
	
	@PostMapping("save")
	public ModelAndView save(ModelMap model,
			@Valid @ModelAttribute("accounts") AccountDto dto, BindingResult result) {
		
		if(result.hasErrors()) {
			return new ModelAndView("/order/checkout");
		}
		
		Account entity = new Account();
		
		BeanUtils.copyProperties(dto, entity);
		
		model.addAttribute("message", "Đăng Ký Thành Công");
		
		service.save(entity);
		
		return new ModelAndView("forward:/security/login/form", model) ;
	}
	
	
	@PostMapping("send")
	public String send2(ModelMap model, 
			@RequestParam("to") String email)  {
			String items = Fservice.findPass(email);
			String subject = "[Honor] Recover your password !!!";
			String body = "Your Password is : " +items;
		try{
			// Tạo mail
			MimeMessage mail = mailer.createMimeMessage();
			// Sử dụng lớp trợ giúp
			//MimeMessageHelper helper = new MimeMessageHelper(mail);
                        MimeMessageHelper helper = new MimeMessageHelper(mail, true, "utf-8");
			
			helper.setTo(email);
			helper.setSubject(subject);
			helper.setText(body, true);

			// Gửi mail
			mailer.send(mail);			
			model.addAttribute("message", "Email sent successfully!! Please check your email");
		}
		catch(Exception ex){
			model.addAttribute("message", "Send email fail!");
		}
		return "forward:/security/forgot/form";
	}
	
}
