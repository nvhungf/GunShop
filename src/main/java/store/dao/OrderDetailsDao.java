package store.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import store.entity.OrderDetail;
import store.entity.Total;

public interface OrderDetailsDao extends JpaRepository<OrderDetail, Long> {

	@Query( value = "select SUM(Price) as sum from  OrderDetails ", nativeQuery = true)
	List<Total> getTotal();
}
