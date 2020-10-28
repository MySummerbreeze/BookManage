package com.gx.dao;

import com.gx.domain.Book;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface BookOrderDao {
    /**
     * 图书订单Dao
     * 新建图书订单，UserId，BookId，订单状态为1,（订单状态为0时表示已还）
     * 还书操作：将订单状态置为0
     */

    //添加订单，当进行借书操作时需要
    @Insert("insert into bookorder(userid,bid,orderstatus) values(${id},${bid},1)")
    public void addOrder(@Param("id") int id, @Param("bid") int bid);

    //将订单状态置为0，表示已还，当进行还书操作时需要
    @Update("update bookorder set orderstatus = 0 where bid = #{bid}")
    public void updataOrderStatus(int bid);

    //根据userid查询对应的用户所有的订单
    @Select("SELECT * FROM book where bid = ANY(SELECT bid from bookorder WHERE userid = #{id} and orderstatus = 1)")
    public List<Book> selectOrder(int id);//用户的id
}
