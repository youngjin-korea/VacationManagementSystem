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
        <option value="1">승인 대기</option>
        <option value="2">승인 완료</option>
        <option value="3">승인 거절</option>
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
                        <c:when test="${request.status == '승인 거절'}">
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
    // 상태에 따른 클래스 및 텍스트 설정 함수
    function setStatus(elementId, status) {
        const statusMap = {
            'TRUE': { text: '확인', class: 'completeSpan' },
            'FALSE': { text: '거절', class: 'rejectedSpan' },
            '대기': { text: '대기', class: 'waitingSpan' }
        };
        const element = document.getElementById(elementId);
        const { text, class: className } = statusMap[status] || { text: '대기', class: 'waitingSpan' };
        element.textContent = text;
        element.classList.remove('completeSpan', 'waitingSpan', 'rejectedSpan');
        element.classList.add(className);
    }

    // 진행도 설정 함수
    // 진행도 설정 함수
    function setProgress(firstStatus, secondStatus, topStatus, progressBar, progressText, firstApprover, secondApprover) {
        let progress = 0;

        // 3단계 진행일 경우 (1차, 2차, 최종)
        if (firstApprover.charAt(0) !== '0') {
            if (topStatus === 'TRUE') {
                progress = 100;
            } else if (secondStatus === 'TRUE') {
                progress = 66;
            } else if (firstStatus === 'TRUE') {
                progress = 33;
            }

            // 2단계 진행일 경우 (2차 없이 1차와 최종 승인만 있을 때)
        } else if (secondApprover.charAt(0) !== '0') {
            if (topStatus === 'TRUE') {
                progress = 100;
            } else if (secondStatus === 'TRUE') {
                progress = 50;
            }

            // 1단계 진행일 경우 (최종 승인만 있을 때)
        } else {
            if (topStatus === 'TRUE') {
                progress = 100;
            } else {
                progress = 0;
            }
        }

        progressBar.style.width = progress + "%";
        progressText.textContent = progress + "%";
    }


    // 승인 버튼 표시 여부 설정 함수
    function toggleApprovalButtons(status, isYourTurn, approveBtn, rejectBtn) {
        if (status === '승인 대기' && isYourTurn === 'TRUE') {
            approveBtn.style.display = 'inline-block';
            rejectBtn.style.display = 'inline-block';
        } else {
            approveBtn.style.display = 'none';
            rejectBtn.style.display = 'none';
        }
    }

    // 모달 초기화 함수
    function initializeModal() {
        const progressBar = document.getElementById('modalAdminRequestBar');
        const progressText = document.getElementById('modalProgressText');
        progressBar.style.width = '0%';
        progressText.textContent = "0%";

        ['modalFirstApproverName', 'modalSecondApproverName', 'modalTopApproverName'].forEach(id => {
            document.getElementById(id).closest('p').style.display = 'block';
        });

        ['modalFirstStatus', 'modalSecondStatus', 'modalTopStatus'].forEach(id => {
            document.getElementById(id).closest('p').style.display = 'block';
        });
    }

    document.addEventListener('show.bs.modal', function (event) {
        initializeModal();

        const clickedRow = event.relatedTarget;
        if (!clickedRow) return;

        const requestId = clickedRow.getAttribute('data-request-id');
        const empId = clickedRow.getAttribute('data-emp-id');
        const name = clickedRow.getAttribute('data-name');
        const period = clickedRow.getAttribute('data-period');
        const days = clickedRow.getAttribute('data-days');
        const regDate = clickedRow.getAttribute('data-reg-date');
        const status = clickedRow.getAttribute('data-status');
        const comments = clickedRow.getAttribute('data-comments');
        const topApproverName = clickedRow.getAttribute('data-topApproverName');
        const firstApproverName = clickedRow.getAttribute('data-firstApproverName');
        const secondApproverName = clickedRow.getAttribute('data-secondApproverName');
        const topStatus = clickedRow.getAttribute('data-topStatus');
        const firstStatus = clickedRow.getAttribute('data-firstStatus');
        const secondStatus = clickedRow.getAttribute('data-secondStatus');
        const isYourTurn = clickedRow.getAttribute('data-isYourTurn');

        // 모달 데이터 설정
        document.getElementById('modalReqId').textContent = requestId;
        document.getElementById('modalEmpId').textContent = empId;
        document.getElementById('modalName').textContent = name;
        document.getElementById('modalPeriod').textContent = period;
        document.getElementById('modalDays').textContent = days;
        document.getElementById('modalRegDate').textContent = regDate;
        document.getElementById('modalStatus').textContent = status;
        document.getElementById('modalComments').textContent = comments;

        document.getElementById('modalTopApproverName').textContent = topApproverName;
        document.getElementById('modalFirstApproverName').textContent = firstApproverName;
        document.getElementById('modalSecondApproverName').textContent = secondApproverName;

        // 상태별 처리
        setStatus('modalTopStatus', topStatus);
        setStatus('modalFirstStatus', firstStatus);
        setStatus('modalSecondStatus', secondStatus);

        // 승인 진행도 설정
        const progressBar = document.getElementById('modalAdminRequestBar');
        const progressText = document.getElementById('modalProgressText');
        const firstApprover = clickedRow.getAttribute('data-firstApprover');
        const secondApprover = clickedRow.getAttribute('data-secondApprover');

        if (firstApprover.charAt(0) !== '0') {
            // 3단계 진행일 경우 (1차, 2차, 최종 승인)
            setProgress(firstStatus, secondStatus, topStatus, progressBar, progressText, firstApprover, secondApprover);
        } else if (secondApprover.charAt(0) !== '0') {
            // 2단계 진행일 경우 (2차 없이 1차와 최종 승인만 있을 때)
            ['modalFirstApproverName', 'modalFirstStatus'].forEach(id => {
                document.getElementById(id).closest('p').style.display = 'none';
            });
            setProgress('', secondStatus, topStatus, progressBar, progressText, firstApprover, secondApprover);
        } else {
            // 1단계 진행일 경우 (최종 승인만 있을 때)
            ['modalFirstApproverName', 'modalFirstStatus', 'modalSecondApproverName', 'modalSecondStatus'].forEach(id => {
                document.getElementById(id).closest('p').style.display = 'none';
            });
            setProgress('', '', topStatus, progressBar, progressText, firstApprover, secondApprover);
        }

        // 승인/반려 버튼 표시
        toggleApprovalButtons(status, isYourTurn, document.getElementById('approveBtn'), document.getElementById('rejectBtn'));
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
                                placeholder: "반려 사유를 입력",
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
