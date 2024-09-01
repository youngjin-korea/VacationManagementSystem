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
        padding: 0 260px;
        font-size: x-large;
        position: absolute;
        left: 62px;
        top: 171px;
    }
    #submit-btn{
        display: flex;
        justify-content: end;
        padding-top: 10px;
    }
</style>

<body>
<%@ include file="/resources/components/header.jsp" %>
<%@ include file="/resources/components/sidebar.jsp" %>
<div id="mainArea">

    <div id="container">
        <div id="intro">
            <div>사원정보 | <span id="emp-name"></span>님의 개인정보수정</div>
        </div>
        <form action="" method="post">
            <div id="border-box">
                <div id="left-con">
                    <div class="content">
                        <label>사번</label>
                        <div>
                            <input value="11" type="text" disabled/>
                        </div>
                    </div>
                    <div class="content">
                        <label>부서</label>
                        <div>
                            <input value="11" type="text" disabled/>
                        </div>
                    </div>
                    <div class="content">
                        <label>직책</label>
                        <div><input value="11" type="text" disabled/></div>
                    </div>
                </div>
                <div id="right-con">
                    <div class="content">
                        <label>입사일</label>
                        <div><input value="11" type="text" disabled/></div>
                    </div>
                    <div class="content">
                        <label>전화번호</label>
                        <div><input type="tel"/></div>
                    </div>
                    <div class="content">
                        <label>개인 메일</label>
                        <div><input type="email"/></div>
                    </div>
                </div>
            </div>
            <div id="submit-btn">
                <button type="submit" class="btn btn-primary">수정하기</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
