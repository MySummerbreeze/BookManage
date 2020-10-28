package com.gx.service.impl;

import com.gx.dao.BookOrderDao;
import com.gx.domain.Book;
import com.gx.service.BookOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("bookOrderService")
public class BookOrderServiceImpl implements BookOrderService {

    @Autowired
    private BookOrderDao bookOrderDao;

    //添加一个订单
    @Override
    public void addOrder(int id,int bid) {
        bookOrderDao.addOrder(id,bid);
    }

    //更新订单状态，即当还书时订单状态更新为0
    @Override
    public void updateOrderStatus(int bid) {
        bookOrderDao.updataOrderStatus(bid);
    }

    @Override
    public List<Book> myBorrow(int id) {
        return bookOrderDao.selectOrder(id);
    }
}
