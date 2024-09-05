<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />

    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/styles.css" />
</head>

<body>
<%@ include file="/resources/components/header.jsp" %>
<%@ include file="/resources/components/sidebar.jsp" %>
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
                <th scope="col">휴가 취소 요청일</th>
            </tr>

        </thead>

    </table>

</div>
</body>
</html>
