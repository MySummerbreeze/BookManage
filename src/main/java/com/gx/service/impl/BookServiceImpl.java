package com.gx.service.impl;

import com.gx.dao.BookDao;
import com.gx.domain.Book;
import com.gx.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("bookService")
public class BookServiceImpl implements BookService {

    @Autowired
    private BookDao bookDao;

    @Override
    public List<Book> selectAllBook() {
        return bookDao.selectAllBook();
    }

    @Override
    public int addBook(Book book) {
        bookDao.addBook(book);
        return book.getBid();
    }

    @Override
    public void modifyBook(Book book) {
        bookDao.modifyBook(book);
    }

    @Override
    public void deleteBook(int bid) {
        bookDao.deleteBookById(bid);
    }


    @Override
    public int selectBookNumByBookName(String bookname) {
        return bookDao.selectAllNum(bookname);
    }

    @Override
    public List<Book> selectBookByAuthor(String author) {
        return bookDao.selectBookByAuthor(author);
    }

    @Override
    public int selectLastNum() {
        List<Integer> list = bookDao.selectLastNum();
        return list.get(0);
    }

    //查询未借书籍
    @Override
    public List<Book> selectBookByStatus() {
        return bookDao.selectBookByStatus();
    }

    //借书
    @Override
    public void updateBookStatusToZero(int bid){
        bookDao.updateBookStatusToZero(bid);
    }

    //还书
    @Override
    public void updateBookStatusToOne(int bid){
        bookDao.updateBookStatusToOne(bid);
    }

}
