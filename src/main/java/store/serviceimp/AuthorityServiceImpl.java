package store.serviceimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import store.dao.AccountDao;
import store.dao.AuthorityDAO;
import store.entity.Account;
import store.entity.Authority;
import store.service.AuthorityService;


@Service
public class AuthorityServiceImpl implements AuthorityService {
	@Autowired
	AuthorityDAO ardao;
	@Autowired
	AccountDao adao;
	
	@Override
	public List<Authority> findAuthoritiesOfAdministrators() {
		List<Account> accounts = adao.getAdministrators();
		return ardao.authoritiesOf(accounts);
	}

	@Override
	public List<Authority> findAll() {
		return ardao.findAll();
	}

	@Override
	public Authority create(Authority auth) {
		return ardao.save(auth);
	}

	@Override
	public void delete(Integer id) {	
		ardao.deleteById(id);
	}
	
}
