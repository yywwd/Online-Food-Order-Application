package com.imooc.enums;

import lombok.Getter;

/**
 * Created by Wandong Wu
 */
@Getter
public enum OrderStatusEnum implements CodeEnum {
    NEW(0, "NEW ORDER"),
    FINISHED(1, "FINISHED"),
    CANCEL(2, "CANCELD"),
    ;

    private Integer code;

    private String message;

    OrderStatusEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}
