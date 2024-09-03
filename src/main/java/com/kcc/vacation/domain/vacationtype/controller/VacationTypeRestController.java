package com.kcc.vacation.domain.vacationtype.controller;

import com.kcc.vacation.domain.vacationtype.dto.response.VacationTypeDetail;
import com.kcc.vacation.domain.vacationtype.service.VacationTypeService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
public class VacationTypeRestController {

    private final VacationTypeService vacationTypeService;


    @PostMapping("admin/vacation-type-management/add")
    public ResponseEntity<String> updateVacationType(@RequestBody VacationTypeDetail vacationTypeDetail) {
        try {

            vacationTypeService.insertVacationType(vacationTypeDetail);
            return ResponseEntity.ok("Update successful");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Update failed");
        }
    }
    @GetMapping("admin/vacation-type-management/detail")
    public ResponseEntity<VacationTypeDetail> getVacationTypeDetail(@RequestParam("id") int id) {
        try {
            System.out.println(" getVacationTypeDetail(: rrr "+id);

            VacationTypeDetail detail = vacationTypeService.getVacationTypeById(id);
            System.out.println("Returning detail: " + detail);
            if (detail != null) {
                return ResponseEntity.ok(detail);
            } else {
                return ResponseEntity.notFound().build();
            }
        } catch (Exception e) {
            return ResponseEntity.status(500).body(null);
        }
    }
}
