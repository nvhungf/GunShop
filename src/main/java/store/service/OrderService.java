package store.service;

import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;

import store.entity.Order;
import store.entity.TotalOrder;

public interface OrderService {

	Order create(JsonNode orderData);

	Order findById(Long id);

	List<Order> findByUsername(String username);

	void changesDH( String trangthai, Long id);

	void successDH(String trangthai, Long id);

	List<Order> findAll();

	List<TotalOrder> getTotalOrder();


}
