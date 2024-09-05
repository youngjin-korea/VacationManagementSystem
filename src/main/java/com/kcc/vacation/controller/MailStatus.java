package com.kcc.vacation.controller;

import lombok.Getter;
import org.springframework.stereotype.Component;

@Component
public class MailStatus {

    @Getter
    private static boolean isMailSystemActive = true;

    public static void convertActiveStatus() {
        isMailSystemActive = !isMailSystemActive;
    }
}
