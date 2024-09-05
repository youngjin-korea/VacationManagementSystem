package com.kcc.vacation.domain.grantedvacation.dto.request;


import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@NoArgsConstructor
@Getter
public class GrantedVacationDeleteDTO {

    @Setter
    private List<Integer> ids;

    @Builder
    public GrantedVacationDeleteDTO(List<Integer> ids) {
       this.ids = ids;
    }

}