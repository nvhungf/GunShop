package store.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import store.entity.Role;




public interface RoleDAO extends JpaRepository<Role, String>{

}
