package store.service;

import java.util.List;

import store.entity.Authority;

public interface AuthorityService {

	List<Authority> findAuthoritiesOfAdministrators();

	List<Authority> findAll();

	Authority create(Authority auth);
	
	void delete(Integer id);
	

}
