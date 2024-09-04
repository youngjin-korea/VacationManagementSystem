<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>휴가 신청 목록</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/styles.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/admin-request-vacation.css" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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
            <a class="nav-link" href="#">휴가 취소 신청 목록</a>
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
                data-emp-id="${request.empId}"
                data-name="${request.name}"
                data-period="<fmt:formatDate value='${request.startedDate}' pattern='yyyy-MM-dd'/> - <fmt:formatDate value='${request.endDate}' pattern='yyyy-MM-dd'/>"
                data-days="<fmt:parseDate var='startDate' value='${request.startedDate}' pattern='yyyy-MM-dd' />
                           <fmt:parseDate var='endDate' value='${request.endDate}' pattern='yyyy-MM-dd' />
                           <c:set var='diffInMillis' value='${endDate.time - startDate.time}' />
                           <c:set var='diffInDays' value='${diffInMillis / (1000.0 * 60 * 60 * 24)}' />
                           <fmt:formatNumber value='${diffInDays}' type='number' maxFractionDigits='1' minFractionDigits='0' /> 일"
                data-reg-date="<fmt:formatDate value='${request.regDate}' pattern='yyyy-MM-dd'/>"
                data-status="${request.status}">
                <th class="checkbox-th" scope="row">
                    <input class="form-check-input" type="checkbox" id="check${request.id}">
                </th>
                <td>${request.empId}</td>
                <td>${request.name}</td>
                <td><fmt:formatDate value="${request.startedDate}" pattern="yyyy-MM-dd"/> - <fmt:formatDate value="${request.endDate}" pattern="yyyy-MM-dd"/></td>

                <td>
                    <fmt:parseDate var="startDate" value="${request.startedDate}" pattern="yyyy-MM-dd" />
                    <fmt:parseDate var="endDate" value="${request.endDate}" pattern="yyyy-MM-dd" />
                    <c:set var="diffInMillis" value="${endDate.time - startDate.time}" />
                    <c:set var="diffInDays" value="${diffInMillis / (1000.0 * 60 * 60 * 24)}" />
                    <fmt:formatNumber value="${diffInDays}" type="number" maxFractionDigits="1" minFractionDigits="0" /> 일
                </td>

                <td><fmt:formatDate value="${request.regDate}" pattern="yyyy-MM-dd"/> </td>
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
    document.addEventListener('show.bs.modal', function (event) {
        var button = event.relatedTarget; // 클릭된 테이블 행
        var empId = button.getAttribute('data-emp-id');
        var name = button.getAttribute('data-name');
        var period = button.getAttribute('data-period');
        var days = button.getAttribute('data-days');
        var regDate = button.getAttribute('data-reg-date');
        var status = button.getAttribute('data-status');

        // 모달에 데이터 설정
        document.getElementById('modalEmpId').textContent = empId;
        document.getElementById('modalName').textContent = name;
        document.getElementById('modalPeriod').textContent = period;
        document.getElementById('modalDays').textContent = days;
        document.getElementById('modalRegDate').textContent = regDate;
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
    });

</script>

</body>
</html>
