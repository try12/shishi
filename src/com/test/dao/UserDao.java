package com.test.dao;


import com.test.entity.User;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/12 0012.
 */

@Repository
public interface UserDao {

    User login(User u);
    List<User> findAllUser(int start);

    void addUser(User u);

    void removeUser(ArrayList<Integer> data);

    void updateUser(User u);

    List<User> search(Map<String,String> map);





}
