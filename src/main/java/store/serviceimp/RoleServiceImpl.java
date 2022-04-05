package store.serviceimp;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import store.dao.RoleDAO;
import store.entity.Role;
import store.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService{
	@Autowired
	RoleDAO rdao;
	
	@Override
	public List<Role> findAll() {
		return rdao.findAll(); 
	}

}
