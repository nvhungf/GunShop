package store.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import store.entity.Order;
import store.entity.TotalOrder;

@Transactional
public interface OrderDao extends JpaRepository<Order, Long> {
	
	@Query ("SELECT o FROM Order o WHERE o.account.username =?1")
	List<Order> findByUsername(String username);
	
	@Modifying
	@Query( value = "update Orders set trangthai = ?1 where id = ?2 ", nativeQuery = true)
	void changesDH( String trangthai,Long id);

	@Query( value = "select COUNT(Id ) as count from  Orders  ", nativeQuery = true)
	List<TotalOrder> getTotal();

	

}
