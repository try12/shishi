package com.test.controller;

import com.test.dao.UserDao;
import com.test.entity.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/12 0012.
 */

@Controller
public class UserController {

    @Resource
    private UserDao ud;
    @RequestMapping("doLogin.do")
    public String login(User u , HttpSession session){

        try {
            Subject user = SecurityUtils.getSubject();

            UsernamePasswordToken token = new UsernamePasswordToken(u.getUsers(),u.getPwd());
            user.login(token);
            User user1 = ud.login(u);
            session.setAttribute("Users", user1);
            return "success";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping("findalluser.do")
    @ResponseBody
    public List<User> findAllUser(int page){
        int start =(page-1)*2;
        return ud.findAllUser(start);


    }
    @RequestMapping("addUser.do")
    @ResponseBody
    public String addUser(User u){

        System.out.println(u.getUsers()+"--"+ u.getPwd());
        ud.addUser(u);
        return "1";

    }

	/*
	 *
	@RequestMapping("removeUser.do")
	@ResponseBody
	public String removeUser(int id){
		 ud.removeUser(id);
		 return "true";

	}
	*/

    @RequestMapping("removeUser.do")
    @ResponseBody
    public String removeUser(@RequestBody ArrayList<Integer> data){
        //System.out.println(data);
        ud.removeUser(data);
        return "true";

    }


    @RequestMapping("updateUser.do")
    @ResponseBody
    public String updateUser(User u){
        ud.updateUser(u);
        return "1";

    }

    @RequestMapping("search.do")
    @ResponseBody
    public List<User> search(String type,String key){
        Map<String,String> map= new HashMap<String,String>();

        map.put("type", type);
        map.put("key", "%"+key+"%");
        return ud.search(map);


    }

}
