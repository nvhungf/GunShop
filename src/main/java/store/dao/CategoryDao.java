package store.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import store.entity.Category;

public interface CategoryDao extends JpaRepository<Category, String> {

}
