package com.kcc.vacation.domain.vacationtype.dto.request;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Timestamp;
import java.util.List;

@NoArgsConstructor
@Getter
public class VacationTypeDeleteDTO {

    @Setter
    private List<Integer> ids;

    @Builder
    public VacationTypeDeleteDTO(List<Integer> ids) {
       this.ids = ids;
    }

}