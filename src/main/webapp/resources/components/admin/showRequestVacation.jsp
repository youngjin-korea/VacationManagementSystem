<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!-- Modal HTML -->
<div class="modal fade" id="showVacationRequestModal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalLabel" style="margin-right: 10px">휴가 생성 </h5>
                 <span id="modalStatus"></span>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p style="display: none"><span id="modalReqId"></span></p>
                <p><strong>승인 진행도</strong></p>

                <div class="approve-step">
                    <p><strong>1차 승인권자: </strong><span id="modalFirstApprover"></span></p>
                    <p><strong>2차 승인권자: </strong><span id="modalSecondApprover"></span></p>
                    <p><strong>최고 승인권자: </strong><span id="modalTopApprover"></span></p>
                    <p><strong>1차 승인상태: </strong><span id="modalFirstStatus"></span></p>
                    <p><strong>2차 승인상태: </strong><span id="modalSecondStatus"></span></p>
                    <p><strong>최고 승인상태: </strong><span id="modalTopStatus"></span></p>

                </div>

                <div class="progress" role="progressbar" style="margin-bottom: 10px" aria-label="Example with label" aria-valuemin="0" aria-valuemax="100">
                    <div class="progress-bar" id="modalAdminRequestBar"><span id="modalProgressText"></span></div>
                </div>

                <p><strong>사번:</strong> <span id="modalEmpId"></span></p>
                <p><strong>이름:</strong> <span id="modalName"></span></p>
                <p><strong>휴가 신청 기간:</strong> <span id="modalPeriod"></span></p>
                <p><strong>휴가 일수:</strong> <span id="modalDays"></span></p>
                <p><strong>요청 일자:</strong> <span id="modalRegDate"></span></p>
                <p><strong>신청 사유:</strong> <span id="modalComments"></span> </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" id="approveBtn" class="btn btn-success" style="display: none;">승인</button>
                <button type="button" id="rejectBtn" class="btn btn-danger" style="display: none;">반려</button>
            </div>
        </div>
    </div>
</div>
