package store.service;

import java.util.List;
import java.util.Optional;

import store.entity.Product;
import store.entity.Report;
import store.entity.TotalProduct;

public interface ProductService {

	List<Product> findAll();

	Product findById(Integer id);

	List<Product> findByCateId(String cid);

	Product create(Product product);

	Product update(Product product);

	void delete(Integer id);

	List<Product> findByPrice(double min, double max);

	List<Report> getInventoryByCategory();

	List<TotalProduct> getTotalProduct();

}
