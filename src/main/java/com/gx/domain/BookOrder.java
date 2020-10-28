package com.gx.domain;

import lombok.Data;

@Data
public class BookOrder {
    /**
     * 借书订单表
     */
    private int orderid;
    private int userid;
    private int bid;
    private int orderstatus;
}
