package com.gx.vo;

import com.gx.domain.Book;
import com.gx.domain.User;

import java.util.List;

public class UserOrder {
    /**
     * 某个用户的订单
     */
    private List<Book> books;
    private User user;
    private int orderStatus;
}
