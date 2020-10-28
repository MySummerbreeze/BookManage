package com.gx.test;

import com.gx.domain.Book;
import com.gx.service.BookOrderService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class BookOrderTest {


    @Test
    public void test1(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        BookOrderService bookOrderService = (BookOrderService) ac.getBean("bookOrderService");
        List<Book> list = bookOrderService.myBorrow(43);
        for(Book book:list){
            System.out.println(book);
        }
    }

}
