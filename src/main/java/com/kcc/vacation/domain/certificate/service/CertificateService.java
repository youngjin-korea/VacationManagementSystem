package com.kcc.vacation.domain.certificate.service;

import com.kcc.vacation.domain.certificate.mapper.CertificateMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class CertificateService {

    private final CertificateMapper certificateMapper;
}
