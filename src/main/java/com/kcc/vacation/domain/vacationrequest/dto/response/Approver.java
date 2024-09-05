package com.kcc.vacation.domain.vacationrequest.dto.response;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter
public class Approver {
    private int id;
    private String name;
    private String authority;

    @Builder
    public Approver(int id, String name, String authority) {
        this.id = id;
        this.name = name;
        this.authority = authority;
    }
}
