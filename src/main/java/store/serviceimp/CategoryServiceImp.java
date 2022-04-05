package store.serviceimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import store.dao.CategoryDao;
import store.entity.Category;
import store.entity.Product;
import store.service.CategoryService;

@Service
public class CategoryServiceImp implements CategoryService{
	@Autowired
	CategoryDao dao;

	@Override
	public List<Category> findAll() {
		return dao.findAll();
	}

	@Override
	public Category findById(String id) {
		
		return dao.findById(id).get();
	}

	@Override
	public Category create(Category category) {
		return dao.save(category);
	}

	@Override
	public Category update(Category category) {
		// TODO Auto-generated method stub
		return dao.save(category);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		dao.deleteById(id);
	}
}
