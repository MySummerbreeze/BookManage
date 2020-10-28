package com.gx.domain;

import lombok.Data;

@Data
public class User {
    private int id;
    private String username;
    private String password;
    private int grade;
}
