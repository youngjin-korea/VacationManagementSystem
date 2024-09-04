<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!-- Modal HTML -->
<div class="modal fade" id="showVacationRequestModal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalLabel">상세 정보</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p><strong>사번:</strong> <span id="modalEmpId"></span></p>
                <p><strong>이름:</strong> <span id="modalName"></span></p>
                <p><strong>휴가 신청 기간:</strong> <span id="modalPeriod"></span></p>
                <p><strong>휴가 일수:</strong> <span id="modalDays"></span></p>
                <p><strong>요청 일자:</strong> <span id="modalRegDate"></span></p>
                <p><strong>신청 상태:</strong> <span id="modalStatus"></span></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>
