package com.imooc.enums;

import lombok.Getter;

/**
 * Created by Wandong Wu
 */
@Getter
public enum ProductStatusEnum implements CodeEnum {
    UP(0, "SHELF"),
    DOWN(1, "UNSHELF")
    ;

    private Integer code;

    private String message;

    ProductStatusEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }


}
