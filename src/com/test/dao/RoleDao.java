package com.test.dao;

import com.test.entity.Role;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;


@Repository
public interface RoleDao {
	
	void addRole(Role r);
	List<Role> findAllRole(int start);
	void updateRole(Role r);
	void removeRole(ArrayList<Integer> data);
}
