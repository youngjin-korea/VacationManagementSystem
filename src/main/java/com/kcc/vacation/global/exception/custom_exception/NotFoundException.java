package com.kcc.vacation.global.exception.custom_exception;


import com.kcc.vacation.global.exception.CustomException;
import com.kcc.vacation.global.exception.ErrorCode;

public class NotFoundException extends CustomException {
    public NotFoundException(ErrorCode errorCode) {
        super(errorCode);
    }
}