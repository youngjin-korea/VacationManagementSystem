package com.kcc.vacation.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
public class MailController {


    @PatchMapping("/mail-system")
    public void update(){
        MailStatus.convertActiveStatus();
        log.info("Mail status updated : " + MailStatus.isMailSystemActive());
    }
}
