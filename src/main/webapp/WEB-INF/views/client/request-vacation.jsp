<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/styles.css"/>
    <script type="importmap">
        {
          "imports": {
            "@fullcalendar/core": "https://cdn.skypack.dev/@fullcalendar/core@6.1.15",
            "@fullcalendar/daygrid": "https://cdn.skypack.dev/@fullcalendar/daygrid@6.1.15"
          }
        }
    </script>

    <script type="module">
        import {Calendar} from "@fullcalendar/core";
        import dayGridPlugin from "@fullcalendar/daygrid";

        document.addEventListener("DOMContentLoaded", async function () {
                // JSP에서 전달받은 employeeId를 JavaScript 변수로 설정
                const employeeId = "<%= request.getAttribute("employeeId") %>";
                const myRole = "<%= request.getAttribute("myRole") %>";

                try {
                    // 1. 서버에서 데이터 가져오기 (GET 요청)
                    const response = await fetch(`/my-vacations/${employeeId}`, {
                        method: 'GET',
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    });
                    const approver = await fetch(`/approvers/${employeeId}`, {
                        method: 'GET',
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    });
                    const topApprover = await fetch('/appreovers/top-approver', {
                        method: 'GET',
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    });
                    // 2. 응답이 성공적이었는지 확인
                    if (!response.ok) {
                        throw new Error(`HTTP error! status: ${response.status}`);
                    }
                    // 3. JSON으로 파싱
                    let myVacations = await response.json();
                    let approvers = await approver.json();
                    let topApprovers = await topApprover.json();

                    const f_input = document.getElementById("approve1");
                    const s_input = document.getElementById("approve2");
                    const t_input = document.getElementById("approve3");
                    const l_approve1 = document.getElementById("l-approve1");
                    const l_approve2 = document.getElementById("l-approve2");
                    topApprovers.map((it) => {
                        const optionElement = document.createElement("option");
                        optionElement.value = it.id;
                        optionElement.textContent = "부서번호: " + it.id + ", 이름: " + it.name;
                        t_input.appendChild(optionElement);
                    })

                    switch (myRole) {
                        case "ROLE_NONE":
                            approvers.map((it) => {
                                if (it.authority === "ROLE_FIRST_APPROVAL") {
                                    const optionElement = document.createElement("option");
                                    optionElement.value = it.id;
                                    optionElement.textContent = "부서번호: " + it.id + ", 이름: " + it.name;
                                    f_input.appendChild(optionElement);
                                } else if (it.authority === "ROLE_SECOND_APPROVAL") {
                                    const optionElement = document.createElement("option");
                                    optionElement.value = it.id;
                                    optionElement.textContent = "부서번호: " + it.id + ", 이름: " + it.name;
                                    s_input.appendChild(optionElement);
                                }
                            })
                            break;
                        case "ROLE_FIRST_APPROVAL":
                            approvers.map((it) => {
                                if (it.authority === "ROLE_SECOND_APPROVAL") {
                                    const optionElement = document.createElement("option");
                                    optionElement.value = it.id;
                                    optionElement.textContent = "부서번호: " + it.id + ", 이름: " + it.name;
                                    f_input.appendChild(optionElement);
                                }
                            })
                            s_input.style.display = "none";
                            l_approve1.style.display = "none";
                            break;
                        case "ROLE_SECOND_APPROVAL":
                        case "ROLE_TOP_APPROVAL":
                            f_input.style.display = "none";
                            s_input.style.display = "none";
                            l_approve1.style.display = "none";
                            l_approve2.style.display = "none";
                            break;
                    }
                    if (myVacations.length == 0) {
                        myVacations = [{start: "", end: "", vacationDays: 0}]
                    }
                    const first = approvers.filter((it) => it.authority === "ROLE_FIRST_APPROVAL");
                    const second = approvers.filter((it) => it.authority === "ROLE_SECOND_APPROVAL");
                    const last = approvers.filter((it) => it.authority === "ROLE_TOP_APPROVAL");

                    const annualDays = document.getElementById("annual-days");
                    annualDays.innerHTML = myVacations.length;

                    //보유연차 표시
                    const allVacDays = document.getElementById("annual-days");
                    allVacDays.innerHTML = myVacations[0].vacationDays;

                    const calendarEl = document.getElementById("calendar");

                    const vacationTableBody = document.getElementById("vacation-table-body");
                    const vacationTableBody2 = document.getElementById("vacation-table-body2");

                    // function addEmployeeBtnClickHandler(obj) {
                    //     // 태그 선택
                    //     const vacType = document.getElementById("m-vac-type");
                    //     const start = document.getElementById("m-vac-start");
                    //     const end = document.getElementById("m-vac-end");
                    //     const status = document.getElementById("m-vac-status");
                    //     const approvedate = document.getElementById("m-vac-approvedate");
                    //
                    //     var myModal = new bootstrap.Modal(document.getElementById('addEmployeeModal'));
                    //     // 값 넣기
                    //     vacType.value = obj.title;
                    //     start.value = String(obj.start).slice(0, 15);
                    //     end.value = String(obj.end).slice(0, 15);
                    //     status.value = obj.status;
                    //     approvedate.value = obj.approvedDate.split("T")[0];
                    //     myModal.show();
                    // }

                    // const calendar = new Calendar(calendarEl, {
                    //     plugins: [dayGridPlugin],
                    //     headerToolbar: {
                    //         left: "prev,next today",
                    //         center: "title",
                    //         right: "",
                    //     },
                    //     fixedWeekCount: false,
                    //     height: 840,
                    //     eventSources: [
                    //         {
                    //             events: myVacations,
                    //             color: "blue",
                    //             textColor: "white",
                    //         },
                    //     ],
                    //     eventClick: function (info) {
                    //         const obj = {
                    //             id: info.event.extendedProps.vacationId,
                    //             title: info.event.title,
                    //             start: info.event.start,
                    //             end: info.event.end,
                    //             approvedDate: info.event.extendedProps.approvedDate,
                    //             status: info.event.extendedProps.status,
                    //         }
                    //
                    //         addEmployeeBtnClickHandler(obj);
                    //     },
                    // });
                    // calendar.render();
                    let reqsCancels = [];
                    let reqList = [];
                    let cancelList = [];
                    try {
                        // 서버에 GET 요청을 보내고 응답을 기다립니다.
                        const response = await fetch('/clients/vacation-requests-cancels', {
                            method: 'GET',
                            headers: {
                                'Content-Type': 'application/json'
                            }
                        });

                        // 응답이 성공적이지 않으면 에러를 던집니다.
                        if (!response.ok) {
                            throw new Error(`HTTP error! status: ${response.status}`);
                        }

                        // 응답을 JSON으로 파싱합니다.
                        reqsCancels = await response.json();

                        // JSON 데이터를 사용할 수 있습니다.
                        console.log(reqsCancels);
                    } catch (error) {
                        // 에러 처리
                        console.error('Error fetching data:', error);
                    }
                    reqList = reqsCancels.filter((it) => it.cancelStatus === null);
                    cancelList = reqsCancels.filter((it) => it.cancelStatus !== null);
                    console.log("reqList: ", reqList);
                    console.log("cancelList: ", cancelList);

                    // 취소 버튼 클릭 시 호출되는 함수 정의
                    window.cancelVacation = async function (vacationId) {
                        const result = confirm("휴가를 취소 하시겠습니까?");
                        // 서버에 취소 요청 보내기
                        if (result === false) {
                            console.log(result);
                            return;
                        }
                        console.log("휴가 취소 요청 - ID:", vacationId);
                        const btn = document.getElementById("\"" + vacationId + "\"");

                        await fetch('/clients/cancel', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json'
                            },
                            body: JSON.stringify({
                                comments: "개인사유",
                                vacationRequestId: vacationId,
                                cancelApproverId: 1042
                                })
                        });
                        location.reload(true);
                    };
                    // 휴가신청 현황 테이블에 데이터 삽입
                    reqList.forEach(function (vacation) {
                        var row = document.createElement("tr");
                        row.innerHTML =
                            "<td>" + vacation.name + "</td>" +
                            "<td>" + vacation.startedDate.slice(0, 10) + "</td>" +
                            "<td>" + vacation.endDate.slice(0, 10) + "</td>" +
                            "<td>" + vacation.status + "</td>" +
                            "<td>" +
                            "<button " + "id = \"" + vacation.id + "\" type=\"button\" class=\"btn btn-danger\" onclick=\"cancelVacation(" + vacation.id + ")\">취소</button>" +
                            "</td>";
                        vacationTableBody.appendChild(row);
                    });

                    // 휴가취소현황 테이블에 데이터 삽입
                    cancelList.forEach(function (vacation) {
                        var row = document.createElement("tr");
                        row.innerHTML =
                            "<td>" + vacation.name + "</td>" +
                            "<td>" + vacation.startedDate.slice(0, 10) + "</td>" +
                            "<td>" + vacation.endDate.slice(0, 10) + "</td>" +
                            "<td>" + vacation.cancelStatus + "</td>" +
                            "<td>" + vacation.cancelApproveDate + "</td>";
                        vacationTableBody2.appendChild(row);
                    });

                } catch (error) {
                    console.error('Error fetching data:', error);
                }

            }
        )
    </script>
    <style>
        /* 테이블 css */
        .vacation-status {
            flex: 1;
            background-color: #f9f9fb;
            padding: 20px;
        }

        .vacation-status h4 {
            margin-bottom: 20px;
        }

        .vacation-status table {
            width: 100%;
            border-collapse: collapse;
        }

        .vacation-status table, th, td {
            border: 1px solid #ddd;
        }

        .vacation-status th, td {
            padding: 8px;
            text-align: left;
        }

        .vacation-status th {
            background-color: #f2f2f2;
        }

        .table-scroll {
            height: 766px;
            overflow-y: scroll;
            padding-right: 39px;
        }

        .list-scroll {
            height: 344px;
            overflow-y: scroll;
            padding-right: 39px;
        }

        /* 최외각 div */
        .container-vac {
            display: flex;
            gap: 20px;
            padding-left: 20px;
        }

        .req-vac {
            flex: 1;
            background-color: #f9f9fb;
            padding: 63px 94px 0px 94px;
        }

        .req-vac h4 {
            margin-bottom: 20px;
        }

        .req-vac label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        .req-vac select,
        .req-vac input[type="date"],
        .req-vac input[type="time"],
        .req-vac input[type="file"],
        .req-vac textarea,
        .req-vac button {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            font-size: 16px;
            box-sizing: border-box;
        }

        .req-vac button {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            padding: 13px;
        }

        .req-vac button:hover {
            background-color: #0056b3;
        }

        #event-details {
            margin-top: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f0f0f0;
        }

        #myVac {
            color: red;
        }
    </style>
</head>

<body>
<%@ include file="/resources/components/header.jsp" %>
<%@ include file="/resources/components/sidebar.jsp" %>

<div id="mainArea">
    <div class="container-vac">
        <div style="width: 47%;">
            <div class="vacation-status">
                <h4>나의 휴가 신청 현황</h4>
                <div class="list-scroll">
                    <table>
                        <thead>
                        <tr>
                            <th>휴가 유형</th>
                            <th>시작 날짜</th>
                            <th>종료 날짜</th>
                            <th>상태</th>
                            <th>취소신청</th>
                        </tr>
                        </thead>
                        <tbody id="vacation-table-body">
                        <!-- 데이터가 여기에 삽입됩니다 -->
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="vacation-status">
                <h4>나의 휴가 취소 신청 현황</h4>
                <div class="list-scroll">
                    <table>
                        <thead>
                        <tr>
                            <th>휴가 유형</th>
                            <th>시작 날짜</th>
                            <th>종료 날짜</th>
                            <th>상태</th>
                            <th>취소 승인 일시</th>
                        </tr>
                        </thead>
                        <tbody id="vacation-table-body2">
                        <!-- 데이터가 여기에 삽입됩니다 -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="req-vac">
            <form class="table-scroll" action="/client/request-vacation" method="post">
                <h4>휴가 신청하기</h4>
                <label for="vacation-type">휴가 유형 | <span id="myVac">보유 연차: <span
                        id="annual-days"></span> / 15</span></label>
                <input type="hidden" name="empId" value="${employeeId}">
                <select id="vacation-type" name="typeId">
                    <option value="1" selected>연차</option>
                    <option value="9">오전 반차</option>
                    <option value="8">오후 반차</option>
                    <option value="2">병가</option>
                    <option value="5">출산 휴가</option>
                    <option value="6">육아 휴가</option>
                    <option value="4">무급 휴가</option>
                    <option value="3">임시 휴가</option>
                    <option value="7">공휴일</option>
                </select>

                <label for="start-date">시작 날짜</label>
                <input type="date" id="start-date" name="startedDate"/>

                <label for="end-date">종료 날짜</label>
                <input type="date" id="end-date" name="endedDate"/>

                <label for="file">첨부파일</label>
                <input type="file" id="file" name="filePath"/>

                <label for="reason">휴가 사유</label>
                <textarea id="reason" name="comments" rows="4" cols="50" style="resize: none;"></textarea>

                <label id="l-approve1" for="approve1">승인권자 1</label>
                <select id="approve1" name="firstApprover">
                    <option value="null" disabled selected>승인권자 선택하기</option>
                </select>

                <label id="l-approve2" for="approve2">승인권자 2</label>
                <select id="approve2" name="secondApprover">
                    <option value="null" disabled selected>승인권자 선택하기</option>
                </select>

                <label for="approve3">승인권자 3</label>
                <select id="approve3" name="topApprover">
                    <option value="null" disabled selected>승인권자 선택하기</option>
                </select>

                <button id="submit-vacation" type="submit">신청하기</button>
            </form>
        </div>
    </div>
</div>
<%--<!-- 취소신청 모달 -->--%>
<%--<div class="modal fade" id="addEmployeeModal" tabindex="-1">--%>
<%--    <div class="modal-dialog" style="margin-top:200px;">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h2 class="modal-title fs-5 fw-bold" id="exampleModalLabel">휴가 취소신청</h2>--%>
<%--                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--            </div>--%>
<%--            <div class="modal-body d-flex flex-column">--%>
<%--                <div class="d-flex mb-3">--%>
<%--                    <div class="col-3 d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">--%>
<%--                        휴가유형</p></div>--%>
<%--                    <div class="col-6 d-flex align-items-center" style="position: relative">--%>
<%--                        <input id="m-vac-type" type="text" class="form-control" style="border-radius: 2px;" readonly>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="d-flex mb-3">--%>
<%--                    <div class="col-3 d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">시작--%>
<%--                        날짜</p></div>--%>
<%--                    <div class="col-6 d-flex align-items-center" style="position: relative">--%>
<%--                        <input id="m-vac-start" type="text" class="form-control" style="border-radius: 2px;" readonly>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="d-flex mb-3">--%>
<%--                    <div class="col-3 d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">종료--%>
<%--                        날짜</p></div>--%>
<%--                    <div class="col-6 d-flex align-items-center" style="position: relative">--%>
<%--                        <input id="m-vac-end" type="text" class="form-control" style="border-radius: 2px;" readonly>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="d-flex mb-3">--%>
<%--                    <div class="col-3 d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">승인--%>
<%--                        상태</p>--%>
<%--                    </div>--%>
<%--                    <div class="col-6 d-flex align-items-center" style="position: relative">--%>
<%--                        <input id="m-vac-status" type="text" class="form-control" style="border-radius: 2px;" readonly>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="d-flex mb-3">--%>
<%--                    <div class="col-3 d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">승인--%>
<%--                        날짜</p>--%>
<%--                    </div>--%>
<%--                    <div class="col-6 d-flex align-items-center" style="position: relative">--%>
<%--                        <input id="m-vac-approvedate" type="text" class="form-control" style="border-radius: 2px;"--%>
<%--                               readonly>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="d-flex  mb-3">--%>
<%--                    <div class="col-3 d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">--%>
<%--                        취소승인권자</p></div>--%>
<%--                    <div class="col-6">--%>
<%--                        <select class="form-select" id="inputGroupSelect01">--%>
<%--                            <option selected>최상위 부서</option>--%>
<%--                            <option value="1">영업부서</option>--%>
<%--                            <option value="2">영업 1팀</option>--%>
<%--                            <option value="3">영업 2팀</option>--%>
<%--                        </select>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button id="modalCloseBtn" type="button" data-bs-dismiss="modal"--%>
<%--                        class="btn border border-black btn-black bg-white" style="border-radius: 2px; height: 36px;"><p>--%>
<%--                    닫기</p>--%>
<%--                </button>--%>
<%--                <button id="addEmployeeBtnOfModal" type="button" data-bs-dismiss="modal" class="btn btn-primary">취소 신청--%>
<%--                </button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>
