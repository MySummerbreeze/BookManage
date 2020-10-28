package com.gx.controller;

import com.gx.domain.Book;
import com.gx.service.BookService;
import com.gx.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * 这是管理员的控制类，当管理员首页跳转时使用
 */

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private BookService bookService;

    @Autowired
    private UserService userService;

    //跳转到图书管理页面
    @RequestMapping("/bookManage.action")
    public String skipBookManage(Model model){
        List<Book> list = bookService.selectAllBook();
        model.addAttribute("list",list);
        return "bookManage";
    }

    //跳转到读者管理页面
    @RequestMapping("/commonUserManage.action")
    public String skipCommonUserManage(){
        return "commonUserManage";
    }

    /**
     * 读者操作
     *  可以让读者跳转到图书馆，User.jsp
     */

    //读者跳转到图书馆
    @RequestMapping("/user.action")
    public String skipUser(Model model,@Param("id") String username) throws UnsupportedEncodingException {
        //中文编码：
        /**
         * 在前端使用URL传递时，使用encodeURI(encodeURI(username))
         * 后端解析使用java.net.URLDecoder.decode(username,"UTF-8");
         */
        username = java.net.URLDecoder.decode(username,"UTF-8");
        System.out.println(username);
        model.addAttribute("user", userService.getUserByUserName(username).get(0));
        model.addAttribute("list",bookService.selectBookByStatus());
        return "user";
    }

    //跳转到Admin.jsp
    @RequestMapping("/admin.action")
    public String skipAdmin(){
        return "admin";
    }

}
