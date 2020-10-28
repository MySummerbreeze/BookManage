package com.gx.domain;

import lombok.Data;

@Data
public class Book {
    private int bid;
    private String bookname;
    private String author;
    private String detail;
    private int status;
    private int price;
    private String category;
}
