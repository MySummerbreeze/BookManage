package com.gx.controller;

import com.gx.domain.Book;
import com.gx.service.BookOrderService;
import com.gx.service.BookService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/book")
public class BookController {

    //http://localhost:8080/Twossm/book/deleteById

    @Autowired
    private BookService bookService;

    @Autowired
    private BookOrderService bookOrderService;

    //删除图书
    @RequestMapping("/deleteById.action")
    @ResponseBody
    public Map<String,String> deleyeById(@RequestParam("bid") int bid){
        bookService.deleteBook(bid);
        Map map = new HashMap<String,String>();
        map.put("msg","删除成功");
        return map;
    }


    //添加图书
    @RequestMapping("/addBook.action")
    @ResponseBody
    public int addBook(Book book){
        bookService.addBook(book);
        int i = bookService.selectLastNum();
        return i;
    }

    //修改图书
    @RequestMapping("/modify.action")
    @ResponseBody
    public int modifyBook(Book book){
        System.out.println(book);
        bookService.modifyBook(book);
        return book.getBid();
    }

    //借书

    /**
     * 借书所要进行的操作：
     *  将书籍状态改为0
     *  在记录单上添加该用户的信息以及对应的书ID，并设置该订单状态为未完成（未还书，还书即算本次订单完成，未完成状态为1，完成状态为0）
     * @param bid
     */
    @RequestMapping("/updateBookStatusToZero.action")
    @ResponseBody
    public int updateBookStatusToZero(@Param("id") int id ,@Param("bid") int bid){
        bookService.updateBookStatusToZero(bid);
        //借书订单添加用户以及对应的书籍ID
        bookOrderService.addOrder(id,bid);
        return bid;
    }

    //还书
    @RequestMapping("/updateBookStatusToOne.action")
    @ResponseBody
    public int updateBookStatusToOne(@Param("bid") int bid){
        //根据书籍的id更改书籍的状态为1
        bookService.updateBookStatusToOne(bid);
        //将订单的状态更改为0（我的借还中书籍的状态需要是1）
        bookOrderService.updateOrderStatus(bid);
        return bid;
    }

}
