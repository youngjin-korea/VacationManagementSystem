package com.kcc.vacation.domain.vacationrequest.service;

import com.kcc.vacation.domain.vacationrequest.dto.request.MyVacationApprover;
import com.kcc.vacation.domain.vacationrequest.dto.request.MyVacationRequest;
import com.kcc.vacation.domain.vacationrequest.dto.request.MyVacationRequestJSP;
import com.kcc.vacation.domain.vacationrequest.dto.response.MyVacation;
import com.kcc.vacation.domain.vacationrequest.dto.response.VacationRequestDetail;
import com.kcc.vacation.domain.vacationrequest.mapper.VacationRequestMapper;
import lombok.RequiredArgsConstructor;
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


    public List<VacationRequestDetail> getVacationList() {
        return vacationRequestMapper.getVacationList();
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
