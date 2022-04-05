package store.serviceimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import store.dao.ProductDao;
import store.entity.Product;
import store.entity.Report;
import store.entity.TotalProduct;
import store.service.ProductService;

@Service
public class ProductServiceImp implements ProductService {
	@Autowired
	ProductDao Pdao;
	
	@Override
	public List<Product> findAll() {
		return Pdao.findAll();
	}

	@Override
	public Product findById(Integer id) {
		return Pdao.findById(id).get();
	}

	@Override
	public List<Product> findByCateId(String cid) {
		return Pdao.findByCateId(cid);
	}

	@Override
	public Product create(Product product) {
		// TODO Auto-generated method stub
		return Pdao.save(product);
	}

	@Override
	public Product update(Product product) {
		// TODO Auto-generated method stub
		return Pdao.save(product);
	}

	@Override
	public void  delete(Integer id) {
		// TODO Auto-generated method stub
		 Pdao.deleteById(id);
	}

	@Override
	public List<Product> findByPrice(double min, double max) {
		// TODO Auto-generated method stub
		return Pdao.findByPrice(min, max);
	}

	@Override
	public List<Report> getInventoryByCategory() {
		// TODO Auto-generated method stub
		return Pdao.getInventoryByCategory();
	}

	@Override
	public List<TotalProduct> getTotalProduct() {
		// TODO Auto-generated method stub
		return Pdao.getTotal();
	}
}
