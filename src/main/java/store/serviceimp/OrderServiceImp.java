package store.serviceimp;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import store.dao.OrderDao;
import store.dao.OrderDetailsDao;
import store.entity.Order;
import store.entity.OrderDetail;
import store.entity.TotalOrder;
import store.service.OrderService;

@Service
public class OrderServiceImp implements OrderService {
@Autowired
OrderDao dao;
@Autowired
OrderDetailsDao ddao;

@Override
public Order create(JsonNode orderData) {
	ObjectMapper mapper = new ObjectMapper();
	Order order = mapper.convertValue(orderData, Order.class);
	dao.save(order);
	TypeReference<List<OrderDetail>> type = new TypeReference<List<OrderDetail>>() {};
	List<OrderDetail> details = mapper.convertValue(orderData.get("orderDetails"), type)
			.stream().peek(d -> d.setOrder(order)).collect(Collectors.toList());
	ddao.saveAll(details);
	return order;
}

@Override
public Order findById(Long id) {
	
	return dao.findById(id).get();
}

@Override
public List<Order> findByUsername(String username) {
	return dao.findByUsername(username);
}



@Override
public void changesDH( String trangthai,Long id) {
	// TODO Auto-generated method stub
	dao.changesDH( trangthai,id);
}

@Override
public void successDH(String trangthai, Long id) {
	dao.changesDH( trangthai,id);
	
}

@Override
public List<Order> findAll() {
	// TODO Auto-generated method stub
	return dao.findAll();
}

@Override
public List<TotalOrder> getTotalOrder() {
	// TODO Auto-generated method stub
	return dao.getTotal();
}
}
