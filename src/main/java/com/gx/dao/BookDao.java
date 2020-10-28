package com.gx.dao;

import com.gx.domain.Book;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface BookDao {


    /**
     * 书的操作：
     *  查询所有图书
     *  添加图书
     *  删除图书
     *  查询某一本图书的库存（根据书名）
     *  根据作者名查询图书
     *
     */
    @Select("select * from book")
    public List<Book> selectAllBook();

    @Insert("insert into book(bookname,author,detail,status,price,category) value(#{bookname},#{author},#{detail},${status},${price},#{category})")
    public void addBook(Book book);

    //查找最后一条记录的主键
    @Select("select max(bid) from book")
    public List<Integer> selectLastNum();


    @Delete("delete from book where bid = #{bid}")
    public void deleteBookById(int bid);

    @Select("select count(*) from book where bookname like #{bookname}")
    public int selectAllNum(String bookName);

    @Select("select * from book where author like #{author}")
    public List<Book> selectBookByAuthor(String author);

    //根据状态查询书籍，查询书籍状态为1的书籍，可借状态
    @Select("select * from book where status = 1")
    public List<Book> selectBookByStatus();

    //借书，即将书籍状态改为0
    @Select("update book set status = 0 where bid = #{bid}")
    public void updateBookStatusToZero(int bid);

    //还书，即将书籍状态改为1
    @Select("update book set status = 1 where bid = #{bid}")
    public void updateBookStatusToOne(int bid);

    //修改图书
    @Update("update book set bookname=#{bookname},author=#{author},detail=#{detail},price=#{price},category=#{category} where bid = #{bid}")
    public void modifyBook(Book book);
}
