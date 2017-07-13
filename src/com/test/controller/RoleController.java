package com.test.controller;

import com.test.dao.RoleDao;
import com.test.entity.Role;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;


@RestController
public class RoleController {

	@Resource
	private RoleDao roledao;
	@RequestMapping("addRole.do")
	public String addRole(Role r){
		roledao.addRole(r);
		return "1";
		
		
		
	}
	@RequestMapping("findallrole.do")
	public List<Role> findAllRole(int page){
		int start =(page-1)*2;
		return roledao.findAllRole(start);
		
		
	}
	
	@RequestMapping("updateRole.do")

	public String updateRole(Role r){
		roledao.updateRole(r);
		return "1";
				
	}
	
	@RequestMapping("removeRole.do")

	public String removeRole(@RequestBody ArrayList<Integer> data){
		//System.out.println(data); 
		roledao.removeRole(data);
		 return "true";
		
	}
	
	
	
}
