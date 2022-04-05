package store.serviceimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import store.dao.OrderDetailsDao;
import store.entity.Total;
import store.service.OrderDetailsService;

@Service
public class OrderDetailsServiceImp implements OrderDetailsService {
	@Autowired
	OrderDetailsDao dao;

	@Override
	public List<Total> getTotal() {
		// TODO Auto-generated method stub
		return dao.getTotal();
	}
}
