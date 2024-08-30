package com.kcc.vacation.domain.certificate.dto.response;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Getter
public class CertificateDetail {

    private String name;
    private String title;

    @Builder
    public CertificateDetail(String name, String title) {
        this.name = name;
        this.title = title;
    }
}
