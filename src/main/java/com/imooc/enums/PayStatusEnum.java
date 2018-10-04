package com.imooc.enums;

import lombok.Getter;

/**
 * Created by Wandong Wu
 */
@Getter
public enum PayStatusEnum implements CodeEnum {

    WAIT(0, "WAIT FOR PAYMENT "),
    SUCCESS(1, "PAYMENT SUCCESSFLU"),

    ;

    private Integer code;

    private String message;

    PayStatusEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}
