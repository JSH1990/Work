package com.chicchic.mini_project.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CategoryVO {
    private long pk;
    private String model;
    private String fields;
    private String name;
}
