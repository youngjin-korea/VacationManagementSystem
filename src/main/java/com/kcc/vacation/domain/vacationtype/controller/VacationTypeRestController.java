package com.kcc.vacation.domain.vacationtype.controller;

import com.kcc.vacation.domain.vacationtype.dto.request.VacationTypeDeleteDTO;
import com.kcc.vacation.domain.vacationtype.dto.request.VacationTypeUpdateDTO;
import com.kcc.vacation.domain.vacationtype.dto.response.VacationTypeDetail;
import com.kcc.vacation.domain.vacationtype.service.VacationTypeService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
            System.out.println(" getVacationTypeDetail: rrr "+id);

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

    @PostMapping("admin/vacation-type-management/delete")
    public ResponseEntity<String> deleteVacationTypes(@RequestBody VacationTypeDeleteDTO deleteRequest) {
        System.out.println("Received delete request: " + deleteRequest); // 로그 추가

        List<Integer> ids = deleteRequest.getIds();

        System.out.println("IDs received: " + ids); // 로그 추가

        if (ids == null || ids.isEmpty()) {
            return ResponseEntity.badRequest().body("삭제할 항목을 선택해 주세요.");
        }

        try {
            vacationTypeService.deleteVacationTypes(ids);
            return ResponseEntity.ok("성공적으로 삭제되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("삭제 중 오류가 발생했습니다.");
        }
    }

    @PostMapping("admin/vacation-type-management/update")
    public ResponseEntity<String> updateVacationType(@RequestBody VacationTypeUpdateDTO updateRequest) {
        try {
            vacationTypeService.updateVacationType(updateRequest);
            return ResponseEntity.ok("Update successful");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Update failed");
        }
    }

}
