package com.gx.service;

import com.gx.domain.Book;

import java.util.List;

public interface BookOrderService {
    /**
     * 添加图书订单
     * 更改订单状态
     */
    public void addOrder(int userId, int bid);

    public void updateOrderStatus(int bid);


    //查询我的借还
    public List<Book> myBorrow(int id);
}
