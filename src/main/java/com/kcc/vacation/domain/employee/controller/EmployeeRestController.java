package com.kcc.vacation.domain.employee.controller;

import com.kcc.vacation.domain.employee.dto.request.*;
import com.kcc.vacation.domain.employee.dto.response.EmployeeDetail;
import com.kcc.vacation.domain.employee.dto.response.EmployeeExcelResponse;
import com.kcc.vacation.domain.employee.service.EmployeeService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;


@RestController
@RequiredArgsConstructor
public class EmployeeRestController {

    private final EmployeeService employeeService;

    @GetMapping("api/auth/employees/{id}")
    public EmployeeDetail getById(@PathVariable(value = "id") int id) {

        EmployeeDetail employeeDetail = employeeService.getById(id);
        employeeDetail.convertStatusAndAuthority();
        return employeeDetail;
    }

    @PostMapping("api/employees/mail-send")
    public void sendEmail(MailRequest mailRequest) {
        List<Integer> empIds = mailRequest.getEmpIds();
        employeeService.handleSendMail(empIds);
    }
    @PatchMapping("api/employees/mail-resend")
    public void sendEmail() {
        employeeService.resendMail();
    }

    @PatchMapping("api/employees/certificate")
    public void certificate(@RequestParam(value = "email") String email, @RequestParam(value = "authenticationCode")String authenticationCode) {
        employeeService.certificate(email, authenticationCode);
    }
    @PostMapping("api/employees")
    public String create(@RequestBody EmployeeCreateRequest employeeCreateRequest) {

        EmployeeCreate employeeCreate = EmployeeCreate.of(employeeCreateRequest);

        employeeService.add(employeeCreate);
        return "/admin/employee-management?addedEmployeeId=" + employeeCreate.getId();
    }
    @PutMapping("api/employees/{id}")
    public String update(@RequestBody EmployeeUpdateRequest employeeUpdateRequest, @PathVariable(value = "id") int id) {

        EmployeeUpdate employeeUpdate = EmployeeUpdate.of(employeeUpdateRequest, id);

        employeeService.update(employeeUpdate);
        return "/admin/employee-management?addedEmployeeId=" + id;
    }

    @DeleteMapping("api/employees/{id}")
    public String delete(@PathVariable(value = "id") int id) {
        employeeService.delete(id);
        return "/admin/employee-management";
    }

    @PostMapping("api/employees/excel")
    public List<EmployeeExcelResponse> uploadCheck(@RequestParam("file") MultipartFile file) throws IOException {

        List<EmployeeExcelResponse> employeeDetails = new ArrayList<>();


        XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream());

        // 엑셀 파일의 0번째 시트
        XSSFSheet sheet = workbook.getSheetAt(0);

        for (int i = 1; i < sheet.getPhysicalNumberOfRows(); i++) {
            XSSFRow row = sheet.getRow(i);
            DataFormatter formatter = new DataFormatter();

            EmployeeExcelResponse employee = EmployeeExcelResponse.builder()
                    .id(Integer.parseInt(formatter.formatCellValue(row.getCell(0))))
                    .name(formatter.formatCellValue(row.getCell(1)))
                    .authority(formatter.formatCellValue(row.getCell(2)))
                    .deptName(formatter.formatCellValue(row.getCell(3)))
                    .position(formatter.formatCellValue(row.getCell(4)))
                    .hireDate(formatter.formatCellValue(row.getCell(5)))
                    .email(formatter.formatCellValue(row.getCell(6)))
                    .joinState(formatter.formatCellValue(row.getCell(7)))
                    .build();

            employeeDetails.add(employee);


        }
        return employeeDetails;
    }
    // 파일 다운로드 처리
    @RequestMapping("/fileDownload")
    public void fileDownload(HttpServletResponse response) throws IOException {
        File f = new File("src/main/java/com/kcc/vacation/domain/employee/employees-upload.xlsx");
        // file 다운로드 설정
        response.setContentType("application/download");
        response.setContentLength((int)f.length());
        response.setHeader("Content-disposition", "attachment;filename=employees-upload.xlsx");
        // response 객체를 통해서 서버로부터 파일 다운로드
        OutputStream os = response.getOutputStream();
        // 파일 입력 객체 생성
        FileInputStream fis = new FileInputStream(f);
        FileCopyUtils.copy(fis, os);
        fis.close();
        os.close();
    }


    public static Timestamp handleDate(String dateString) {

        // SimpleDateFormat을 사용해 문자열을 Date 객체로 파싱
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        try {
            Date parsedDate = dateFormat.parse(dateString); // Date 객체로 변환
            return new Timestamp(parsedDate.getTime()); // Timestamp로 변환
        } catch (ParseException e) {
            e.printStackTrace(); // 파싱 중 오류가 발생할 경우 예외 처리
        }
        return null;
    }

}
