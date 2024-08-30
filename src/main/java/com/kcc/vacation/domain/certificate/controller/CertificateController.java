package com.kcc.vacation.domain.certificate.controller;

import com.kcc.vacation.domain.certificate.service.CertificateService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;

@Controller
@RequiredArgsConstructor
public class CertificateController {
    private final CertificateService certificateService;
}
