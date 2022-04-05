package store.serviceimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import store.dao.AccountDao;
import store.entity.Account;
import store.entity.Product;
import store.service.AccountService;
import store.service.ForgotService;

@Service
public class ForgotServiceImp implements ForgotService {
	@Autowired
	AccountDao dao;

	@Override
	public String findPass(String email) {
		// TODO Auto-generated method stub
		return dao.findPass(email);
	}
	
}
