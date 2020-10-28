package com.gx.service;

import com.gx.domain.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    //检查登录
    public Map checkLogin(String username, String password);

    //添加用户
    public void addUser(User user);

    //查询根据用户名是否有重名
    public boolean isInserUser(User user);

    //查询所有的普通用户
    public List<User> getCommonUser();

    //删除用户
    public void deleteUser(int id);

    //修改用户
    public void modifyUser(User user);

    //根据id查询用户
    public List<User> getUserById(int id);

    public List<User> getUserByUserName(String username);
}
