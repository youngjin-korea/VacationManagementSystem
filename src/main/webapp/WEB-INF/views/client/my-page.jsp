<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>

    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/styles.css"/>
</head>

<style>
    #container {
        width: 100%;
        height: 91vh;
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 123px;
    }

    #border-box {
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), /* 약한 그림자 */ 0 1px 3px rgba(0, 0, 0, 0.08); /* 더 약한 그림자 */
        width: 1357px;
        height: 500px;
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 228px;
    }

    .content {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 33px;
        margin-bottom: 20px;
    }

    .content > div {
        border: 1px solid #ddd;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), /* 약한 그림자 */ 0 1px 3px rgba(0, 0, 0, 0.08); /* 더 약한 그림자 */
        width: 350px;
        height: 40px;
        padding: 10px;

        display: flex;
        align-items: center;
    }

    .content input {
        all: unset;
        width: 100%;
    }

    #intro {
        font-size: x-large;
        position: absolute;
        left: 232px;
        top: 171px;
    }

    #submit-btn {
        display: flex;
        justify-content: end;
        padding-top: 10px;
    }

    #emp-name {
        font-weight: bold;
    }
</style>
<body>
<%@ include file="/resources/components/header.jsp" %>
<%@ include file="/resources/components/sidebar.jsp" %>
<div id="mainArea">

    <div id="container">
        <div id="intro">
            <div>사원정보 | <span id="emp-name">${myInfo.empName}</span>님의 개인정보수정</div>
        </div>
        <form id="updateForm" action="/client/my-page" method="post">
            <div id="border-box">
                <div id="left-con">
                    <div class="content">
                        <label>사번</label>
                        <div>
                            <input name="id" value="${myInfo.id}" type="text" readonly/>
                        </div>
                    </div>
                    <div class="content">
                        <label>부서</label>
                        <div>
                            <input value="${myInfo.deptName}" type="text" disabled/>
                        </div>
                    </div>
                    <div class="content">
                        <label>직책</label>
                        <div><input value="${myInfo.position}" type="text" disabled/></div>
                    </div>
                </div>
                <div id="right-con">
                    <div class="content">
                        <label>입사일</label>
                        <div><input  id="hireDateInput" type="text" disabled/></div>
                    </div>
                    <div class="content">
                        <label>* 전화번호</label>
                        <div><input id="phoneNumber" name="phoneNumber" value="${myInfo.phoneNumber}" type="tel"/></div>
                    </div>
                    <div class="content">
                        <label>* 개인 메일</label>
                        <div><input id="email" name="email" value="${myInfo.email}" type="email"/></div>
                    </div>
                </div>
            </div>
            <div id="submit-btn">
                <button type="button" class="btn btn-primary" onclick="validateAndSubmit()">수정하기</button>
            </div>
        </form>
    </div>
</div>
<script>
    // 현재 값과 비교하기 위해 기존 값 저장
    const originalPhoneNumber = "${myInfo.phoneNumber}";
    const originalEmail = "${myInfo.email}";
    const originalHireDate = "${myInfo.hireDate}";

    function formatHireDate(dateString) {
        // 날짜 문자열에서 날짜 부분만 추출
        const datePart = dateString.split(' ')[0];
        return datePart;
    }

    document.addEventListener('DOMContentLoaded', function() {
        const originalHireDate = "${myInfo.hireDate}";
        const formattedDate = formatHireDate(originalHireDate);
        document.getElementById('hireDateInput').value = formattedDate;
    });

    // 전화번호 유효성 검사 함수
    function validatePhoneNumber(phoneNumber) {
        const phoneRegex = /^\d{3}-\d{4}-\d{4}$/;
        return phoneRegex.test(phoneNumber);
    }

    // 이메일 유효성 검사 함수
    function validateEmail(email) {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }

    // 변경 사항 확인 및 유효성 검사 함수
    function validateAndSubmit() {
        const phoneNumber = document.getElementById("phoneNumber").value.trim();
        const email = document.getElementById("email").value.trim();

        if (phoneNumber === originalPhoneNumber && email === originalEmail) {
            alert("변경된 정보가 없습니다.");
            return;
        }

        if (phoneNumber !== originalPhoneNumber && !validatePhoneNumber(phoneNumber)) {
            alert("유효한 전화번호 형식이 아닙니다. 000-0000-0000 형식으로 입력해 주세요.");
            return;
        }

        if (email !== originalEmail && !validateEmail(email)) {
            alert("유효한 이메일 형식이 아닙니다.");
            return;
        }

        // 모든 유효성 검사를 통과한 경우 폼 제출
        document.getElementById("updateForm").submit();
    }

    // URL에서 쿼리 파라미터를 가져오는 함수
    function getParameterByName(name) {
        const url = new URL(window.location.href);
        return url.searchParams.get(name);
    }

    // updateSuccess 플래그 확인
    const updateSuccess = getParameterByName('updateSuccess');
    if (updateSuccess === 'true') {
        alert("변경이 성공적으로 완료되었습니다.");
    }
</script>
</body>
</html>
