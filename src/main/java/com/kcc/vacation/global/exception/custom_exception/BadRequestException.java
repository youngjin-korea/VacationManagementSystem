package com.kcc.vacation.global.exception.custom_exception;

import com.kcc.vacation.global.exception.CustomException;
import com.kcc.vacation.global.exception.ErrorCode;

public class BadRequestException extends CustomException {
    public BadRequestException(ErrorCode errorCode) {
        super(errorCode);
    }
}