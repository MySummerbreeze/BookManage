package com.gx.service;

import com.gx.domain.Book;

import java.util.List;

public interface BookService {
    //查询所有书籍
    public List<Book> selectAllBook();

    //添加书籍
    public int addBook(Book book);

    //删除图书
    public void deleteBook(int bid);

    //修改图书
    public void modifyBook(Book book);

    //查询库存
    public int selectBookNumByBookName(String bookname);

    //根据作者名查询图书
    public List<Book> selectBookByAuthor(String author);

    //查询最后一个主键
    public int selectLastNum();

    //查询图书状态为1的图书list，即可借状态
    public List<Book> selectBookByStatus();

    //借书
    public void updateBookStatusToZero(int bid);


    //还书
    public void updateBookStatusToOne(int bid);

}
