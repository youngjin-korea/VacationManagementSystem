<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/styles.css" />

    <%-- javascript 가져오기 --%>
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
            <th scope="col">
                선택
            </th>
            <th scope="col">사번</th>
            <th scope="col">이름</th>
            <th scope="col">휴가 신청 기간</th>
            <th scope="col">휴가 일수</th>
            <th scope="col">요청 일자</th>
            <th scope="col">신청 상태</th>
        </tr>
        </thead>

        <tbody>
        <tr>
            <th scope="row">
                <input class="form-check-input" type="checkbox" id="check1">
            </th>
            <td>사번1</td>
            <td>이름1</td>
            <td>휴가신청기간1</td>
            <td>휴가 일수1</td>
            <td>요청 일자1</td>
            <td>신청 상태2</td>
        </tr>
        <tr>
            <th scope="row">
                <input class="form-check-input" type="checkbox" id="check2">

            </th>
            <td>사번2</td>
            <td>이름2</td>
            <td>휴가신청기간2</td>
            <td>휴가 일수2</td>
            <td>요청 일자2</td>
            <td>신청 상태2</td>
        </tr>
        <tr>
            <th scope="row">
                <input class="form-check-input" type="checkbox" id="check3">

            </th>
            <td>사번3</td>
            <td>이름3</td>
            <td>휴가신청기간3</td>
            <td>휴가 일수3</td>
            <td>요청 일자3</td>
            <td>신청 상태3</td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>
