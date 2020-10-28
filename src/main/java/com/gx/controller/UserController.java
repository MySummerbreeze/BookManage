package com.gx.controller;

import com.gx.domain.Book;
import com.gx.domain.User;
import com.gx.service.BookOrderService;
import com.gx.service.BookService;
import com.gx.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/login")
public class UserController {

    @Autowired
    private BookService bookService;

    @Autowired
    private BookOrderService bookOrderService;

    @Autowired
    private UserService userService;

    @RequestMapping("/checkLogin.action")
    public String checkLogin(@RequestParam("username")String username, @RequestParam("password")String password, Model model){
        Map map = userService.checkLogin(username,password);
        if(map.get("result").equals("login")){
            model.addAttribute("msg","账号或密码错误");
        }else if(map.get("result").equals("admin")) {
            model.addAttribute("user",map.get("user"));
        }else{//user
            List<Book> list = bookService.selectBookByStatus();
            model.addAttribute("list",list);
            model.addAttribute("user",map.get("user"));
        }
        return (String)map.get("result");
    }


    @RequestMapping(value = "/addUser.action")
    @ResponseBody()
    public Map<String, Boolean> addUser(User user, HttpServletRequest request, HttpServletResponse res) throws UnsupportedEncodingException {
        Map<String , Boolean> map = new HashMap<>();
        if(!userService.isInserUser(user)){//不可插入
            map.put("isUse",false);
            return map;
        }
        userService.addUser(user);
        map.put("msg",true);
        return map;
    }

    @RequestMapping("/register.action")
    public String register(){
        return "register";
    }

    //前端跳转到的页面，暂未启用
    @RequestMapping("/admin.action")
    public String admin(int id){//传递的参数仅为跳转那个页面
        /*String result;
        if(id == 1){
            result = "bookManage";
        }else if(id == 2){
            result = "";
        }

        return result;*/
        return "";
    }

    //获取所有的普通User
    @RequestMapping("/getCommonUser.action")
    public String getCommonUser(Model model){
        model.addAttribute("list",userService.getCommonUser());
        return "commonUserManage";
    }

    //删除某一个用户
    @RequestMapping("/deleteUser.action")
    @ResponseBody
    public Map<String ,String> deleteUser(@Param("id") int id){
        userService.deleteUser(id);
        Map<String,String> map = new HashMap<>();
        map.put("msg","删除成功！");
        return map;
    }

    //修改一个用户
    @RequestMapping("/modifyUser.action")
    @ResponseBody
    public int modifyUser(User user){
        System.out.println(user);
        userService.modifyUser(user);
        return user.getId();
    }

    @RequestMapping("/login.action")
    public String login(){
        return "login";
    }

    //我的借还跳转
    @RequestMapping("/myBorrow.action")
    public String myBorrow(Model model,int id){//一个参数为user 的id
        List<Book> list = bookOrderService.myBorrow(id);
        model.addAttribute("list",list);//传递的是我的借还的这个书籍id
        model.addAttribute("user",userService.getUserById(id).get(0));
        return "myBorrow";
    }

    //我的借还跳转到User.jsp
    @RequestMapping("/user.action")
    public String jumpUser(Model model,@Param("id") int id){
        //该方法需要传递一个书籍状态为1的书籍列表，key为list
        //还有一个是user的实例
        //user实例的获取：
        model.addAttribute("user",userService.getUserById(id).get(0));
        List<Book> list = bookService.selectBookByStatus();
        model.addAttribute("list",list);
        return "user";
    }
}
