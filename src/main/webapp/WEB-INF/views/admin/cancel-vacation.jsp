<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>휴가 취소 신청 목록</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/styles.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/admin-cancel-vacation.css" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<%@ include file="/resources/components/header.jsp" %>
<%@ include file="/resources/components/sidebar.jsp" %>
<%@ include file="/resources/components/admin/showVacationCancelModal.jsp" %>
<div id="mainArea">
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link" aria-current="page" href="request-vacation">휴가 신청 목록</a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" href="#">휴가 취소 신청 목록</a>
        </li>
    </ul>

    <h5 style="margin: 20px">결재 상태</h5>

    <select class="form-select" aria-label="Default select example" style="max-width: 250px; margin: 10px">
        <option selected disabled>조건을 선택하세요.</option>
        <option value="1">취소 대기</option>
        <option value="2">취소 완료</option>
        <option value="3">취소 거절</option>
    </select>

    <table id="cancelVacationTable" class="table table-hover">
        <thead class="table-light">
        <tr>
            <th scope="col">선택</th>
            <th scope="col">요청 ID</th>
            <th scope="col">취소 요청일</th>
            <th scope="col">요청자 이름</th>
            <th scope="col">결재자 이름</th>
            <th scope="col">휴가 기간</th>
            <th scope="col">상태</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="cancelDetail" items="${vacationCancelList}">
            <tr data-bs-toggle="modal" data-bs-target="#showVacationCancelModal"
                data-id="${cancelDetail.id}"
                data-status="${cancelDetail.status}"
                data-cancel-date="<fmt:formatDate value='${cancelDetail.cancelDate}' pattern='yyyy-MM-dd'/>"
                data-request-start-date="<fmt:formatDate value='${cancelDetail.requestStartDate}' pattern='yyyy-MM-dd'/>"
                data-request-end-date="<fmt:formatDate value='${cancelDetail.requestEndDate}' pattern='yyyy-MM-dd'/>"
                data-requester-name="${cancelDetail.requesterName}"
                data-approver-name="${cancelDetail.approverName}"
                data-comments="${cancelDetail.comments}"
            >
                <td><input type="checkbox" name="selectedCancel" value="${cancelDetail.id}"/></td>
                <td>${cancelDetail.id}</td>

                <td><fmt:formatDate value='${cancelDetail.cancelDate}' pattern='yyyy-MM-dd'/></td>
                <td>${cancelDetail.requesterName}</td>
                <td>${cancelDetail.approverName}</td>
                <td>
                    <fmt:formatDate value='${cancelDetail.requestStartDate}' pattern='yyyy-MM-dd'/> -
                    <fmt:formatDate value='${cancelDetail.requestEndDate}' pattern='yyyy-MM-dd'/>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${cancelDetail.status == '취소 완료'}">
                            <span class="completeSpan">${cancelDetail.status}</span>
                        </c:when>
                        <c:when test="${cancelDetail.status == '취소 대기'}">
                            <span class="waitingSpan">${cancelDetail.status}</span>
                        </c:when>
                        <c:when test="${cancelDetail.status == '취소 거절'}">
                            <span class="rejectedSpan">${cancelDetail.status}</span>
                        </c:when>
                        <c:otherwise>
                            ${request.status} <!-- Other statuses without color -->
                        </c:otherwise>
                    </c:choose>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script>
    // Modal 열기 시 데이터 채우기
    document.addEventListener('show.bs.modal', function (event) {


        var clickedRow = $(event.relatedTarget); // 버튼 요소
        var id = clickedRow.data('id'); // 데이터-속성에서 ID 가져오기
        var status = clickedRow.data('status');
        var cancelDate = clickedRow.data('cancel-date');
        var requestStartDate = clickedRow.data('request-start-date');
        var requestEndDate = clickedRow.data('request-end-date');
        var requesterName = clickedRow.data('requester-name');
        var approverName = clickedRow.data('approver-name');
        var comments = clickedRow.data('comments');

        // 모달 데이터 설정
        document.getElementById('modalRequestId').textContent = id;
        document.getElementById('modalCancelDate').textContent = cancelDate;
        document.getElementById('modalRequesterName').textContent = requesterName;
        document.getElementById('modalApproverName').textContent = approverName;
        document.getElementById('modalRequestPeriod').textContent = requestStartDate + ' - ' + requestEndDate;
        document.getElementById('modalStatus').textContent = status;
        document.getElementById('modalComments').textContent = comments;

        // 상태에 따른 클래스 추가
        var statusElement = document.getElementById('modalStatus');
        statusElement.classList.remove('waitingSpan', 'completeSpan', 'rejectedSpan');

        if (status === '취소 대기') {
            statusElement.classList.add('waitingSpan');
            document.getElementById('approveBtn').style.display = 'inline-block';
            document.getElementById('rejectBtn').style.display = 'inline-block';
        } else if (status === '취소 완료') {
            statusElement.classList.add('completeSpan');
            document.getElementById('approveBtn').style.display = 'none';
            document.getElementById('rejectBtn').style.display = 'none';
        } else if (status === '취소 거절') {
            statusElement.classList.add('rejectedSpan');
            document.getElementById('approveBtn').style.display = 'none';
            document.getElementById('rejectBtn').style.display = 'none';
        }

    });


    document.getElementById('approveBtn').addEventListener('click', function () {

        swal({
            title: "정말 승인하시겠습니까?",
            text: "승인 완료 시, 취소할 수 없습니다.",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
            .then((willDelete) => {
                // 승인 완료
                if (willDelete) {
                    var cancelId = document.getElementById('modalRequestId').textContent;
                    // 여기에서 AJAX를 통해 POST 요청을 보냅니다.
                    $.ajax({
                        url: `/admin/cancel-approve-vacation?id=` + cancelId,
                        method: 'POST',
                        contentType: 'application/json',
                        success: function (data) {
                            console.log("Data received", data);
                            swal("승인이 완료되었습니다!", {
                                icon: "success",
                                button: "확인",
                            }).then(() => {
                                // 페이지 리로드
                                location.reload();
                            });
                        },
                        error: function (jqXHR, testStatus, errThrown) {
                            console.error('Error', errThrown);
                        }
                    })
                } else {
                    // 승인 취소
                    swal("승인을 취소하였습니다.");
                }
            });

    });


    document.getElementById('rejectBtn').addEventListener('click', function () {
        var modal = document.getElementById('showVacationCancelModal');
        $(modal).modal('hide'); // Hide the modal

        swal({
            title: "정말로 반려하시겠습니까?",
            text: "거절 완료 시, 취소할 수 없습니다.",
            icon: "warning",
            buttons: true,
            dangerMode: true,
        })
            .then((willDelete) => {
                if (willDelete) {
                    // 거절 확인
                    swal({
                        title: "반려 사유를 작성해 주세요.",
                        text: "사유를 입력하지 않으면, 거절 처리할 수 없습니다.",
                        content: {
                            element: "input",
                            attributes: {
                                placeholder: "반려 사유를 입력",
                                type: "text"
                            }
                        },
                        buttons: ["취소", "확인"],
                        dangerMode: true,
                    })
                        .then((value) => {
                            if (value) {
                                var cancelId = document.getElementById('modalRequestId').textContent;

                                $.ajax({
                                    url: `/admin/cancel-reject-vacation?id=` + cancelId + `&commentsOfApprover=` + value,
                                    method: 'POST',
                                    contentType: 'application/json',
                                    success: function (data) {
                                        console.log("Data received", data);
                                        swal("반려 처리가 완료되었습니다!", {
                                            icon: "success",
                                            button: "확인",
                                        }).then(() => {
                                            // 페이지 리로드
                                            location.reload();
                                        });
                                    },
                                    error: function (jqXHR, testStatus, errThrown) {
                                        console.error('Error', errThrown);
                                    }
                                });
                            } else {
                                // 입력 취소
                                swal("반려를 취소하였습니다!");
                            }
                        });
                } else {
                    // 반려 취소
                    swal("반려를 취소하였습니다!");
                }
            });
    });
</script>
</body>
</html>
