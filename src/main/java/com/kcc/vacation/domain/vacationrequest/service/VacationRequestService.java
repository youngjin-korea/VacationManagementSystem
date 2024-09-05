package com.kcc.vacation.domain.vacationrequest.service;
import com.kcc.vacation.domain.vacationrequest.dto.request.MyVacationApprover;
import com.kcc.vacation.domain.employee.dto.response.Employee;
import com.kcc.vacation.domain.employee.mapper.EmployeeMapper;
import com.kcc.vacation.domain.vacationrequest.dto.request.MyVacationRequest;
import com.kcc.vacation.domain.vacationrequest.dto.request.MyVacationRequestJSP;
import com.kcc.vacation.domain.vacationrequest.dto.response.MyVacation;
import com.kcc.vacation.domain.vacationrequest.dto.response.VacationRequestListDetail;
import com.kcc.vacation.domain.vacationrequest.mapper.VacationRequestMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class VacationRequestService {

    private final VacationRequestMapper vacationRequestMapper;
    private final EmployeeMapper employeeMapper;

    // 휴가 요청 목록 보기 - 관리자
    // 승인 권한이 있는 목록만 출력
    public List<VacationRequestListDetail> getVacationRequestListByApproverId() {

        // 로그인한 유저 정보
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        Employee loginUser = employeeMapper.findByEmail(username);
//        String authority = loginUser.getAuthority();
        // 현재 임의의 인사팀 부서장인 1003 번으로 접속했다고 가정함
//        return vacationRequestMapper.getVacationList(loginUser.getId());

        // basic data
        List<VacationRequestListDetail> vacationRequestListDetailBase = vacationRequestMapper.getVacationRequestListByApproverId(1003);

        // 1.최고관리자일 경우
//        if(authority.equals("ROLE_TOP_APPROVAL")){
        // 최고 관리자라고 상정
        if(true){
            for(VacationRequestListDetail vacationRequestList : vacationRequestListDetailBase){
                if(vacationRequestList.getStatus().equals("승인 대기")) {
                    // 1-1. 1차, 2차 승인권자가 존재하지 않을 때 (승인권자가 최고관리자뿐일 때)
                    if(vacationRequestList.getFirstApprover() == 0 &&
                            vacationRequestList.getSecondApprover() == 0) {
                        vacationRequestList.setIsYourTurn("TRUE"); // 최종 승인을 위한 표시
                    }

                    // 1-2. 2차가 존재하고 승인했을 때 (1차 승인이 없는 경우)
                    else if(vacationRequestList.getSecondStatus() !=null && vacationRequestList.getSecondStatus().equals("TRUE") &&
                            vacationRequestList.getFirstApprover() == 0) {
                        vacationRequestList.setIsYourTurn("TRUE"); // 최종 승인을 위한 표시
                    }


                    // 1-3. 1차, 2차가 모두 존재하고 승인했을 때
                    else if(vacationRequestList.getFirstStatus() !=null && vacationRequestList.getFirstStatus().equals("TRUE") &&
                            vacationRequestList.getSecondStatus() !=null && vacationRequestList.getSecondStatus().equals("TRUE")) {
                        vacationRequestList.setIsYourTurn("TRUE"); // 최종 승인을 위한 표시
                    }

                }
            }
        // 2. 2차 관리자일 경우    
        }else if(false){
//        }else if(authority.equals("ROLE_SECOND_APPROVAL")){
            for(VacationRequestListDetail vacationRequestList : vacationRequestListDetailBase){
                if(vacationRequestList.getStatus().equals("승인 대기")){
                    // 2-1. 1차 승인권자가 존재하고 승인했을 때
                    if(vacationRequestList.getFirstStatus().equals("TRUE")){
                        vacationRequestList.setIsYourTurn("TRUE");
                    }
                }
            }


        // 3. 1차 관리자일 경우
//        }else if(authority.equals("ROLE_FIRST_APPROVAL")){
        }else if(false){
            for(VacationRequestListDetail vacationRequestList : vacationRequestListDetailBase){
                // 3-1. 아직 내가 승인하지 않은 경우
                if(vacationRequestList.getFirstStatus().equals("NULL")){
                    vacationRequestList.setIsYourTurn("TRUE");
                }
            }
        }

        return vacationRequestListDetailBase;
    }

    // 휴가 승인 - 관리자
    public boolean approveVacation(int requestId) {

        // 로그인한 유저 정보
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        Employee loginUser = employeeMapper.findByEmail(username);

        //int rowsAffected = vacationRequestMapper.updateApproverStatus(requestId, loginUser.getId());

        // 현재 임의의 인사팀 부서장인 1003 번으로 접속했다고 가정함
        int rowsAffected = vacationRequestMapper.approveVacation(requestId, 1003);

        return rowsAffected > 0; // 업데이트된 행의 수가 0보다 크면 true 리턴
    }

    public boolean rejectVacation(int id, String commentsOfApprover) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        Employee loginUser = employeeMapper.findByEmail(username);
        // 현재 임의의 인사팀 부서장인 1003 번으로 접속했다고 가정함
        int rowsAffectedFALSE = vacationRequestMapper.rejectVacationFALSE(id, 1003);
        int rowsAffectedTRUE = vacationRequestMapper.rejectVacationSTATUS(id, commentsOfApprover);
        // 예외처리 추가 예정
        return rowsAffectedFALSE + rowsAffectedTRUE > 1;
    }

    public List<MyVacation> getMyVacationList(int employeeId) {return vacationRequestMapper.getMyVacations(employeeId);}

    @Transactional
    public String insertVacationRequest(MyVacationRequestJSP myVacationRequestJSP, MyVacationApprover myVacationApprover) {

        MyVacationRequestJSP mvr = myVacationRequestJSP;
        //String으로 넘어온 startedDate, endedDate -> Timestamp타입으로 변경
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        try {
            Date startedDate = format.parse(mvr.getStartedDate());
            Date endedDate = format.parse(mvr.getEndedDate());

            Timestamp startedTimestamp = new Timestamp(startedDate.getTime());
            Timestamp endedTimestamp = new Timestamp(endedDate.getTime());

            MyVacationRequest myVacationRequest = MyVacationRequest.builder()
                    .startedDate(startedTimestamp)
                    .endedDate(endedTimestamp)
                    .filePath(mvr.getFilePath())
                    .comments(mvr.getComments())
                    .typeId(mvr.getTypeId())
                    .empId(mvr.getEmpId()).build();

            // 휴가 추가
            int isSuccess1 = vacationRequestMapper.insertVacationRequest(myVacationRequest);
            // 휴가 승인자 추가
            MyVacationApprover approver = myVacationApprover;
            approver.setId(myVacationRequest.getId());
            int isSucess2 = vacationRequestMapper.insertApprover(approver);

            if(isSuccess1 == 1 && isSucess2 == 1){
                return "success";
            }
            return "fail";

        } catch (ParseException e) {
            e.printStackTrace();
            return "fail";
        }
    }


}
