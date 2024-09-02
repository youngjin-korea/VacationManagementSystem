<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>휴가 신청 목록</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/styles.css" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>

<body>
<%@ include file="/resources/components/header.jsp" %>
<%@ include file="/resources/components/sidebar.jsp" %>

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

    <table class="table">
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
            <tr>
                <th scope="row">
                    <input class="form-check-input" type="checkbox" id="check${request.id}">
                </th>
                <td>${request.empId}</td>
                <td>${request.startedDate} - ${request.endDate}</td>
                <td>이름</td>
<%--                <td>--%>
<%--                    <c:out value="${fn:substringAfter(request.endDate, request.startedDate)}"/> <!-- 일수 계산 수정 필요 -->--%>
<%--                </td>--%>
                <td>${request.regDate}</td>
                <td>${request.status}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
