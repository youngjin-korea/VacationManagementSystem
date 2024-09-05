package com.kcc.vacation.domain.grantedvacation.controller;

import com.kcc.vacation.domain.grantedvacation.dto.request.GrantVacationUpdateDTO;
import com.kcc.vacation.domain.grantedvacation.dto.request.GrantedVacationCreate;
import com.kcc.vacation.domain.grantedvacation.dto.request.GrantedVacationDeleteDTO;
import com.kcc.vacation.domain.grantedvacation.dto.request.GrantedVacationEmpInfo;
import com.kcc.vacation.domain.grantedvacation.dto.response.GrantedVacationDetail;
import com.kcc.vacation.domain.grantedvacation.dto.response.GrantedVacationList;
import com.kcc.vacation.domain.grantedvacation.service.GrantedVacationService;
import com.kcc.vacation.domain.vacationtype.dto.request.VacationTypeDeleteDTO;
import com.kcc.vacation.domain.vacationtype.dto.request.VacationTypeUpdateDTO;
import com.kcc.vacation.domain.vacationtype.dto.response.VacationTypeDetail;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class GrantedVacationRestController {

    private final GrantedVacationService grantedVacationService;


    @GetMapping("/admin/grant-vacation-management/detail")
    public ResponseEntity<GrantedVacationDetail> getGrantedVacationDetail(@RequestParam int id) {
        try {
            System.out.println(" getVacationTypeDetail: rrr "+id);

            GrantedVacationDetail grantdetail = grantedVacationService.grantedVacationDetail(id);
            System.out.println("grantdetail"+grantdetail.getDept_name());
            if (grantdetail != null) {
                return ResponseEntity.ok(grantdetail);
            } else {
                return ResponseEntity.notFound().build();
            }
        } catch (Exception e) {
            return ResponseEntity.status(500).body(null);
        }
    }

    @GetMapping("/admin/grant-vacation-management/typeList")
    public String grantVacationTypeList(@RequestParam String dept_name,@RequestParam String vacation_name ,Model model) {

        System.out.println("grantVacationTypeList");
        List<GrantedVacationList> grantedVacationSearchList = grantedVacationService.grantedVacationSearchList(dept_name,vacation_name);

        for (GrantedVacationList grantedVacationList : grantedVacationSearchList) {
            System.out.println(grantedVacationList.getVacation_name());
        }

        model.addAttribute("grantedVacationSearchList", grantedVacationSearchList);

        return "admin/grant-vacation-management";
    }

    @PostMapping("admin/grant-vacation-management/update")
    public ResponseEntity<String> updateVacationType(@RequestBody GrantVacationUpdateDTO updateRequestDTO) {
        try {

            grantedVacationService.updateGrantedVacation(updateRequestDTO);
            return ResponseEntity.ok("Update successful");

        } catch (Exception e) {

            e.printStackTrace();

            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Update failed");

        }
    }

    @PostMapping("admin/grant-vacation-management/delete")
    public ResponseEntity<String> deleteVacationTypes(@RequestBody GrantedVacationDeleteDTO deleteRequest) {
        System.out.println("Received delete request: " + deleteRequest); // 로그 추가

        List<Integer> ids = deleteRequest.getIds();

        System.out.println("IDs received: " + ids); // 로그 추가

        if (ids == null || ids.isEmpty()) {
            return ResponseEntity.badRequest().body("삭제할 항목을 선택해 주세요.");
        }

        try {
            grantedVacationService.deleteGrantedVacation(ids);
            return ResponseEntity.ok("성공적으로 삭제되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("삭제 중 오류가 발생했습니다.");
        }
    }


    @PostMapping("admin/grant-vacation-management/add")
    public ResponseEntity<String> updateVacationType(@RequestBody GrantedVacationCreate grantCreate) {
        try {

            grantedVacationService.insertGrantedVacation(grantCreate);
            return ResponseEntity.ok("Update successful");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Update failed");
        }
    }





    @GetMapping("admin/grant-vacation-management/departments")
    public List<GrantedVacationEmpInfo> getAllDepartments() {
        return grantedVacationService.getAllDepartments();
    }

    // 선택한 부서의 사원 목록 조회
    @GetMapping("admin/grant-vacation-management/employees")
    public List<GrantedVacationEmpInfo> getEmployeeNamesByDepartment(@RequestParam int departmentId) {
        return grantedVacationService.getAllEmployees(departmentId);
    }

    @GetMapping("admin/grant-vacation-management/vacationtypes")
    public List<GrantedVacationEmpInfo> getAllVacationtypes() {
        return grantedVacationService.getAllVacationType();
    }

}
