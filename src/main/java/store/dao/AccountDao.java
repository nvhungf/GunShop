package store.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import store.entity.Account;

public interface AccountDao extends JpaRepository<Account, String>{

	@Query("SELECT DISTINCT ar.account FROM Authority ar WHERE ar.role.id IN ('DIRE','STAF')")
	List<Account> getAdministrators();

	@Query(value = "SELECT password FROM Accounts WHERE email LIKE ?1", nativeQuery =true)
	String findPass(String keywords);

}
