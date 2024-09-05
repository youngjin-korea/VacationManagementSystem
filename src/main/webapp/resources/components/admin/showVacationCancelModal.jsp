<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- Modal -->
<div class="modal fade" id="showVacationCancelModal" tabindex="-1" role="dialog" aria-labelledby="showVacationCancelModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered" >
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalLabel" style="margin-right: 10px">휴가 취소 요청</h5>
                <p style="margin-bottom: 0px" id="modalStatus"></p>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="form-group" style="display: none">
                    <label for="modalRequestId">요청 ID:</label>
                    <p id="modalRequestId"></p>
                </div>
                <div class="form-group">
                    <label for="modalCancelDate">취소 요청일:</label>
                    <p id="modalCancelDate"></p>
                </div>
                <div class="form-group">
                    <label for="modalRequesterName">요청자 이름:</label>
                    <p id="modalRequesterName"></p>
                </div>
                <div class="form-group">
                    <label for="modalApproverName">결재자 이름:</label>
                    <p id="modalApproverName"></p>
                </div>
                <div class="form-group">
                    <label for="modalRequestPeriod">휴가 기간:</label>
                    <p id="modalRequestPeriod"></p>
                </div>
                <div class="form-group">
                    <label for="modalComments">취소 사유:</label>
                    <p id="modalComments"></p>
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" id="approveBtn" class="btn btn-success" style="display: none;">승인</button>
                <button type="button" id="rejectBtn" class="btn btn-danger" style="display: none;">반려</button>
            </div>
        </div>
    </div>
</div>
