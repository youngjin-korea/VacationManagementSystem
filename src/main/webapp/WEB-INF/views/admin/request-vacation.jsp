<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>휴가 신청 목록</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/styles.css"/>
    <link rel="stylesheet" type="text/css" href="/resources/css/admin-request-vacation.css"/>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>

<body>
<%@ include file="/resources/components/header.jsp" %>
<%@ include file="/resources/components/sidebar.jsp" %>
<%@ include file="/resources/components/admin/showRequestVacation.jsp" %>

<div id="mainArea">

    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">휴가 신청 목록</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="cancel-vacation">휴가 취소 신청 목록</a>
        </li>
    </ul>

    <h5 style="margin: 20px">결재 상태</h5>

    <select class="form-select" aria-label="Default select example" style="max-width: 250px; margin: 10px">
        <option selected disabled>조건을 선택하세요.</option>
        <option value="1">승인 대기중</option>
        <option value="2">승인 완료</option>
        <option value="3">반려</option>
    </select>

    <table class="table table-hover">
        <thead class="table-light">
        <tr>
            <th scope="col">선택</th>
            <th scope="col">사번</th>
            <th scope="col">이름</th>
            <th scope="col">휴가 신청 기간</th>
            <th scope="col">휴가 일수</th>
            <th scope="col">요청 일자</th>
            <th scope="col">신청 상태</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach var="request" items="${vacationRequestList}">
            <tr data-bs-toggle="modal" data-bs-target="#showVacationRequestModal"
                data-request-id="${request.id}"
                data-emp-id="${request.empId}"
                data-name="${request.employeeName}"
                data-period="<fmt:formatDate value='${request.startedDate}' pattern='yyyy-MM-dd'/> - <fmt:formatDate value='${request.endDate}' pattern='yyyy-MM-dd'/>"
                data-days="<fmt:parseDate var='startDate' value='${request.startedDate}' pattern='yyyy-MM-dd' />
                           <fmt:parseDate var='endDate' value='${request.endDate}' pattern='yyyy-MM-dd' />
                           <c:set var='diffInMillis' value='${endDate.time - startDate.time}' />
                           <c:set var='diffInDays' value='${diffInMillis / (1000.0 * 60 * 60 * 24)}' />
                           <fmt:formatNumber value='${diffInDays}' type='number' maxFractionDigits='1' minFractionDigits='0' /> 일"
                data-reg-date="<fmt:formatDate value='${request.regDate}' pattern='yyyy-MM-dd'/>"
                data-status="${request.status}"
                data-comments="${request.comments}"
                data-topApprover="${request.topApprover}"
                data-firstApprover="${request.firstApprover}"
                data-secondApprover="${request.secondApprover}"
                data-topStatus="${request.topStatus}"
                data-firstStatus="${request.firstStatus}"
                data-secondStatus="${request.secondStatus}"
                data-isYourTurn="${request.isYourTurn}"
                data-firstApproverName="${request.firstApproverName}"
                data-secondApproverName="${request.secondApproverName}"
                data-topApproverName="${request.topApproverName}"
            >
                <th class="checkbox-th" scope="row">
                    <input class="form-check-input" type="checkbox" id="${request.id}">
                </th>
                <td>${request.empId}</td>
                <td>${request.employeeName}</td>
                <td><fmt:formatDate value="${request.startedDate}" pattern="yyyy-MM-dd"/> - <fmt:formatDate
                        value="${request.endDate}" pattern="yyyy-MM-dd"/></td>

                <td>
                    <fmt:parseDate var="startDate" value="${request.startedDate}" pattern="yyyy-MM-dd"/>
                    <fmt:parseDate var="endDate" value="${request.endDate}" pattern="yyyy-MM-dd"/>
                    <c:set var="diffInMillis" value="${endDate.time - startDate.time}"/>
                    <c:set var="diffInDays" value="${diffInMillis / (1000.0 * 60 * 60 * 24)}"/>
                    <fmt:formatNumber value="${diffInDays}" type="number" maxFractionDigits="1" minFractionDigits="0"/>
                    일
                </td>

                <td><fmt:formatDate value="${request.regDate}" pattern="yyyy-MM-dd"/></td>
                <td>
                    <c:choose>
                        <c:when test="${request.status == '승인 완료'}">
                            <span class="completeSpan">${request.status}</span>
                        </c:when>
                        <c:when test="${request.status == '승인 대기'}">
                            <span class="waitingSpan">${request.status}</span>
                        </c:when>
                        <c:when test="${request.status == '거절'}">
                            <span class="rejectedSpan">${request.status}</span>
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
    // 모달을 열 때 호출하여 초기화하는 함수
    function initializeModal() {
        var progressBar = document.getElementById('modalAdminRequestBar');
        var progressText = document.getElementById('modalProgressText');

        // 진행도 및 텍스트를 초기화
        progressBar.style.width = '0%';
        progressText.textContent = "0%";

        // 승인 권자 및 상태를 초기화
        document.getElementById('modalFirstApprover').closest('p').style.display = 'block';
        document.getElementById('modalSecondApprover').closest('p').style.display = 'block';
        document.getElementById('modalTopApprover').closest('p').style.display = 'block';

        document.getElementById('modalFirstStatus').closest('p').style.display = 'block';
        document.getElementById('modalSecondStatus').closest('p').style.display = 'block';
        document.getElementById('modalTopStatus').closest('p').style.display = 'block';

        console.log("초기화");
    }

    document.addEventListener('show.bs.modal', function (event) {
        var clickedRow = event.relatedTarget; // 클릭된 테이블 행
        if (!clickedRow) return;

        console.log(clickedRow);

        var requestId = clickedRow.getAttribute('data-request-id');
        var empId = clickedRow.getAttribute('data-emp-id');
        var name = clickedRow.getAttribute('data-name');
        var period = clickedRow.getAttribute('data-period');
        var days = clickedRow.getAttribute('data-days');
        var regDate = clickedRow.getAttribute('data-reg-date');
        var status = clickedRow.getAttribute('data-status');
        var comments = clickedRow.getAttribute('data-comments');

        var topApprover = clickedRow.getAttribute('data-topApprover');
        var firstApprover = clickedRow.getAttribute('data-firstApprover');
        var secondApprover = clickedRow.getAttribute('data-secondApprover');
        var topStatus = clickedRow.getAttribute('data-topStatus');
        var firstStatus = clickedRow.getAttribute('data-firstStatus');
        var secondStatus = clickedRow.getAttribute('data-secondStatus');


        // 모달에 데이터 설정
        document.getElementById('modalReqId').textContent = requestId;
        document.getElementById('modalEmpId').textContent = empId;
        document.getElementById('modalName').textContent = name;
        document.getElementById('modalPeriod').textContent = period;
        document.getElementById('modalDays').textContent = days;
        document.getElementById('modalRegDate').textContent = regDate;
        document.getElementById('modalStatus').textContent = status;
        document.getElementById('modalComments').textContent = comments;

        document.getElementById('modalTopApprover').textContent = topApprover;
        document.getElementById('modalFirstApprover').textContent = firstApprover;
        document.getElementById('modalSecondApprover').textContent = secondApprover;
        document.getElementById('modalTopStatus').textContent = topStatus;
        document.getElementById('modalFirstStatus').textContent = firstStatus;
        document.getElementById('modalSecondStatus').textContent = secondStatus;


        initializeModal();

        // 승인 진행도 설정
        var progressBar = document.getElementById('modalAdminRequestBar');
        var progressText = document.getElementById('modalProgressText');
        // 3단계 진행일 경우
        if (firstApprover.charAt(0) !== "0") {

            if (topStatus === 'TRUE') {
                progressBar.style.width = '100%';
                progressText.textContent = "100%";
            } else if (secondStatus === 'TRUE') {
                progressBar.style.width = '66%';
                progressText.textContent = "66%";
            } else if (firstStatus === 'TRUE') {
                progressBar.style.width = '33%';
                progressText.textContent = "33%";
            } else {
                progressBar.style.width = '0%';
                progressText.textContent = "0%";
            }

        // 2단계 진행일 경우
        } else if (secondApprover.charAt(0) !== "0") {
            // 1단계 승인권자 정보를 숨깁니다.
            document.getElementById('modalFirstApprover').closest('p').style.display = 'none';
            document.getElementById('modalFirstStatus').closest('p').style.display = 'none';

            if (topStatus === 'TRUE') {
                progressBar.style.width = '100%';
                progressText.textContent = "100%";
            } else if (secondStatus === 'TRUE') {
                progressBar.style.width = '50%';
                progressText.textContent = "50%";
            } else {
                progressBar.style.width = '0%';
                progressText.textContent = "0%";
            }

        // 1단계 진행일 경우
        } else {
            document.getElementById('modalFirstApprover').closest('p').style.display = 'none';
            document.getElementById('modalFirstStatus').closest('p').style.display = 'none';
            document.getElementById('modalSecondApprover').closest('p').style.display = 'none';
            document.getElementById('modalSecondStatus').closest('p').style.display = 'none';
            if (topStatus === 'TRUE') {
                progressBar.style.width = '100%';
                progressText.textContent = "100%";
            } else {
                progressBar.style.width = '0%';
                progressText.textContent = "0%";
            }
        }


        var modalStatus = document.getElementById('modalStatus');
        modalStatus.textContent = status;

        // 기존 클래스 제거
        modalStatus.classList.remove('completeSpan', 'waitingSpan', 'rejectedSpan');

        // 텍스트 색상 변경
        switch (status) {
            case '승인 완료':
                modalStatus.classList.add('completeSpan');
                break;
            case '승인 대기':
                modalStatus.classList.add('waitingSpan');
                break;
            case '거절':
                modalStatus.classList.add('rejectedSpan');
                break;
            default:
                modalStatus.classList.add('defaultSpan'); // 기본 상태 클래스 (필요시 추가)
        }

        // 승인/반려 버튼 표시 여부 결정
        var approveBtn = document.getElementById('approveBtn');
        var rejectBtn = document.getElementById('rejectBtn');
        var isYourTurn = clickedRow.getAttribute('data-isYourTurn');

        if (status === '승인 대기' && isYourTurn === 'TRUE') {
            approveBtn.style.display = 'inline-block';
            rejectBtn.style.display = 'inline-block';
        } else {
            approveBtn.style.display = 'none';
            rejectBtn.style.display = 'none';
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
                    var requestId = document.getElementById('modalReqId').textContent;
                    // 여기에서 AJAX를 통해 POST 요청을 보냅니다.
                    $.ajax({
                        url: `/admin/approve-vacation`,
                        method: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify({id: requestId}),
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
        var modal = document.getElementById('showVacationRequestModal');
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
                                placeholder: "반려 사유를 입력하세요...",
                                type: "text"
                            }
                        },
                        buttons: ["취소", "확인"],
                        dangerMode: true,
                    })
                        .then((value) => {
                            if (value) {
                                var requestId = document.getElementById('modalReqId').textContent;

                                $.ajax({
                                    url: `/admin/reject-vacation?id=` + requestId + `&commentsOfApprover=` + value,
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
