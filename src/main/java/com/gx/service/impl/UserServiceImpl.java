package com.gx.service.impl;

import com.gx.dao.UserDao;
import com.gx.domain.User;
import com.gx.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public Map checkLogin(String username, String password) {
        List<User> list = userDao.getUser(username);//包含了重名情况，因此返回值为list，
        Map map = new HashMap();
        if(list == null||list.size() == 0){//若返回值为空则说明，没有找到该用户名,则需要重新输入
            map.put("result","login");
            return map;
        }
        User user = list.get(0);
        if (user.getPassword().equals(password)){
            if(user.getGrade() == 0){
                map.put("result","admin");
                map.put("user",user);
                return map;
            }else if(user.getGrade() == 1){
                map.put("result","user");
                map.put("user",user);
                return map;
            }
        }
        map.put("result","login");
        return map;
    }

    @Override
    public void addUser(User user) {
        userDao.addUser(user);
    }

    //是否可插入，true为是，false为不可
    @Override
    public boolean isInserUser(User user){
        List<User> list = userDao.getUser(user.getUsername());
        if(list.size() == 0){
            System.out.println("可插入");
        }else{
            for(User user1 : list){
                System.out.println(user1);
                System.out.println(userDao.getUser(user.getUsername()).size()==0);
                System.out.println("有重复");
            }
        }
        return (userDao.getUser(user.getUsername()).size()==0);
    }

    @Override
    public List<User> getCommonUser() {
        return userDao.getCommonUser();
    }

    @Override
    public void deleteUser(int id) {
        userDao.deleteUser(id);
    }

    @Override
    public void modifyUser(User user) {
        userDao.modifyUser(user);
    }

    @Override
    public List<User> getUserById(int id) {
        return userDao.getUserById(id);
    }

    //根据UserName获取User
    @Override
    public List<User> getUserByUserName(String username){
        return userDao.getUser(username);
    }

}
