package store.service;

import java.util.List;

import store.entity.Category;
import store.entity.Product;
import store.entity.Report;

public interface CategoryService {

	List<Category> findAll();

	Category findById(String id);

	Category create(Category category);

	Category update(Category category);

	void delete(String id);


}
