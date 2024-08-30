package com.kcc.vacation.domain.certificate.controller;

import com.kcc.vacation.domain.certificate.dto.response.CertificateDetail;
import com.kcc.vacation.domain.certificate.service.CertificateService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class CertificateRestController {

    private final CertificateService certificateService;

    @GetMapping()
    public String hello(){
        CertificateDetail build = CertificateDetail.builder()
                .title("aa")
                .name("bb")
                .build();


        new CertificateDetail("title", "name");

        return "hello";
    }
}
