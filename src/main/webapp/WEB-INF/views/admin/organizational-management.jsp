<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />

    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/styles.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/organization-management.css" />
</head>

<body>
<%@ include file="/resources/components/header.jsp" %>
<%@ include file="/resources/components/sidebar.jsp" %>
<div id="mainArea">
    <div class="d-flex m-5">
        <div class="col-8">
            <h3 class="fw-bold">조직관리</h3>
        </div>
        <div id="organization-btn-group" class="col-4 d-flex justify-content-end">
            <div class="mx-2">
                <button type="button" class="btn btn-primary">다운로드</button>
            </div>
            <div class="mx-2">
                <button type="button" class="btn btn-primary">업로드</button>
            </div>
            <div class="mx-2">
                <button type="button" class="btn btn-primary">+ 조직 추가하기</button>
            </div>

        </div>

    </div>
    <div style="margin: 0 70px;">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">조직명</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>최상위 부서</td>
            </tr>
            <tr >
                <td style="padding-left: 60px;">ㄴ 영업부서</td>
            </tr>
            <tr>
                <td style="padding-left: 120px;">ㄴ 영업 1팀</td>
            </tr>
            </tbody>
        </table>

    </div>

</div>
</body>
</html>
