package com.kcc.vacation.global.exception.custom_exception;

import com.kcc.vacation.global.exception.CustomException;
import com.kcc.vacation.global.exception.ErrorCode;

public class ForbiddenException extends CustomException {
    public ForbiddenException(ErrorCode errorCode) {
        super(errorCode);
    }
}