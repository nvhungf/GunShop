package store.serviceimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import store.dao.AccountDao;
import store.entity.Account;
import store.entity.Product;
import store.service.AccountService;

@Service
public class AccountServiceImp implements AccountService {
	@Autowired
	AccountDao dao;

	@Override
	public Account finfById(String username) {
		// TODO Auto-generated method stub
		return dao.findById(username).get();
	}

	@Override
	public List<Account> findAll() {
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	@Override
	public void save(Account entity) {
		dao.save(entity);
		
	}
	@Override
	public List<Account> getAdministrators() {
		return dao.getAdministrators();
	}

	@Override
	public Account create(Account account) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(String username) {
		dao.deleteById(username);
		
	}

	@Override
	public Account update(Account account) {
		// TODO Auto-generated method stub
		return dao.save(account);
	}

	
	
}
