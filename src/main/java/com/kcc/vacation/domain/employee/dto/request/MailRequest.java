package com.kcc.vacation.domain.employee.dto.request;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@NoArgsConstructor
@Getter
@Setter
public class MailRequest {

    List<Integer> empIds;
}
