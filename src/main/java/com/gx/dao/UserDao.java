package com.gx.dao;

import com.gx.domain.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface UserDao {

    /**
     * 用户表操作的接口
     *  方法有:
     *      给定用户名，查询密码
     *      添加用户
     */
    //获取用户
    @Select("select * from user where username = #{username}")
    public List<User> getUser(String username);

    @Insert("insert into user(username,password,grade) value(#{username},#{password},#{grade})")
    public void addUser(User user);

    //查询所有普通用户
    @Select("select * from user where grade = 1")
    public List<User> getCommonUser();

    //删除指定用户
    @Delete("delete from user where id = #{id}")
    public void deleteUser(int id);

    @Update("update user set username = #{username},password = #{password} where id = #{id}")
    public void modifyUser(User user);

    //根据用户id获取用户信息
    @Select("select * from user where id = #{id}")
    public List<User> getUserById(int id);
    
}
