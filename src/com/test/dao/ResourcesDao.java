package com.test.dao;

import com.test.entity.Resources;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface ResourcesDao {
	
	List<Resources> allResource();
	
	List<Resources> findResByUser(int id);
	
	void powerGive(Map<String, Object> args);
	
	void deleteOldPower(int id);
	

}
