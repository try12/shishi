package com.test.controller;

import com.test.dao.ResourcesDao;
import com.test.entity.Resources;
import com.test.entity.User;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController // controller+responsebody
public class ResourcesController {
	
	@Resource
	private ResourcesDao rd;
	
	@RequestMapping("allResource.do")
	public List<Resources> allResource(){
	
		return rd.allResource();
	}
	
	@RequestMapping("findResByUser.do")
	public List<Resources> findResByUser(HttpSession session){
		User user = (User) session.getAttribute("Users");
		System.out.println("woshi qiantai id"+user.getUzid());

		return rd.findResByUser(user.getUzid());

		
	}
	@RequestMapping("findResByUser2.do")
	public List<Resources> findResByUser2(@RequestParam(value="uzid") int uzid){
		
		return rd.findResByUser(uzid);
		
	}
	
	@RequestMapping("powerGive.do")
	public String powerGive(@RequestBody ArrayList<Integer> data){
		
		int userid= data.get(0);
		data.remove(0);
		Map<String,Object> args = new HashMap<String,Object>();
		args.put("userid", userid);
		args.put("powerid",data);
		rd.deleteOldPower(userid);
		rd.powerGive(args);
		return "1";
		
		
		
	}
	

}
