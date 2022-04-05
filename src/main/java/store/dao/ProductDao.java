package store.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import store.entity.Report;
import store.entity.TotalProduct;
import store.entity.Product;

public interface ProductDao extends JpaRepository<Product, Integer> {
	@Query("SELECT p FROM Product p WHERE p.category.id = ?1")
	List<Product> findByCateId(String cid);

	@Query(value = "SELECT * FROM Products WHERE price BETWEEN ?1 AND ?2", nativeQuery = true)
	List<Product> findByPrice(double minPrice, double maxPrice);

	@Query("SELECT new Report(o.category, sum(o.price), count(o)) FROM Product o " + " GROUP BY o.category"
			+ " ORDER BY sum(o.price) DESC")
	List<Report> getInventoryByCategory();

	@Query(value = "select COUNT(Id ) as count from  Products ", nativeQuery = true)
	List<TotalProduct> getTotal();

}
