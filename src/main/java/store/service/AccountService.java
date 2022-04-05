package store.service;

import java.util.List;

import store.entity.Account;
import store.entity.Product;

public interface AccountService {

	Account finfById(String username);

	List<Account> findAll();

	void save(Account entity);

	List<Account> getAdministrators();

	Account create(Account account);

	void delete(String username);

	Account update(Account account);

	

}
