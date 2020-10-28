package com.gx.test;

import com.gx.dao.BookDao;
import com.gx.dao.UserDao;
import com.gx.domain.Book;
import com.gx.domain.User;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class TestUser {

    @Test
    public void run2() throws Exception {
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        SqlSessionFactory as = (SqlSessionFactory) ac.getBean("sqlSessonFactory");
        SqlSession sqlSession = as.openSession();

        UserDao dao = sqlSession.getMapper(UserDao.class);
//        User user = dao.getUser("zhangsan");
//        System.out.println(user);
    }

    @Test
    public void run3() throws Exception {
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        SqlSessionFactory as = (SqlSessionFactory) ac.getBean("sqlSessonFactory");
        SqlSession sqlSession = as.openSession();

        User user = new User();

        user.setUsername("lisi");
        user.setPassword("123456");
        user.setGrade(0);

        UserDao dao = sqlSession.getMapper(UserDao.class);
        dao.addUser(user);
    }

    @Test
    public void run4() throws Exception {
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        SqlSessionFactory as = (SqlSessionFactory) ac.getBean("sqlSessonFactory");
        SqlSession sqlSession = as.openSession();

        Book book = new Book();

        book.setBookname("数据结构");
        book.setAuthor("严蔚敏");
        book.setCategory("计算机");
        book.setDetail("这是我们的数据结构");
        book.setPrice(33);
        book.setStatus(1);

        BookDao dao = sqlSession.getMapper(BookDao.class);
        dao.addBook(book);
    }

    @Test
    public void run5() throws Exception {
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        SqlSessionFactory as = (SqlSessionFactory) ac.getBean("sqlSessonFactory");
        SqlSession sqlSession = as.openSession();

        BookDao dao = sqlSession.getMapper(BookDao.class);
        List<Book> list = dao.selectAllBook();

        for (Book book : list) {
            System.out.println(book);
        }
    }

    ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
    SqlSessionFactory as = (SqlSessionFactory) ac.getBean("sqlSessonFactory");
    SqlSession sqlSession = as.openSession();

    @Test
    public void delete() throws Exception {


        BookDao dao = sqlSession.getMapper(BookDao.class);
        dao.deleteBookById(3);
    }

    @Test
    public void selectAllNum(){
        BookDao dao = sqlSession.getMapper(BookDao.class);
        System.out.println(dao.selectAllNum("数据结构"));
    }
    @Test
    public void selectBookByAuthor(){
        BookDao dao = sqlSession.getMapper(BookDao.class);
        List<Book> list = dao.selectBookByAuthor("严蔚敏");
        for(Book book : list){
            System.out.println(book);
        }
    }


}
