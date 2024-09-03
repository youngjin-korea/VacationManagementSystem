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
                try {
                    // 1. 서버에서 데이터 가져오기 (GET 요청)
                    const response = await fetch(`/my-vacations/${employeeId}`, {
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
                    // const AllVacDays = JSON.parse(myVacations).vacationDays;
                    // console.log(AllVacDays);
                    const myVacations = await response.json();
                    // const days = myVacations.vacationDays;
                    console.log("================!!",myVacations[0].vacationDays);

                    //보유연차 표시
                    const allVacDays = document.getElementById("annual-days");
                    allVacDays.innerHTML = myVacations[0].vacationDays;

                    const calendarEl = document.getElementById("calendar");
                    const vacationTableBody = document.getElementById("vacation-table-body");

                    function addEmployeeBtnClickHandler(obj) {
                        // 태그 선택
                        const vacType = document.getElementById("m-vac-type");
                        const start = document.getElementById("m-vac-start");
                        const end = document.getElementById("m-vac-end");
                        const status = document.getElementById("m-vac-status");
                        const approvedate = document.getElementById("m-vac-approvedate");

                        var myModal = new bootstrap.Modal(document.getElementById('addEmployeeModal'));
                        // 값 넣기
                        vacType.value = obj.title;
                        start.value = String(obj.start).slice(0,15);
                        end.value = String(obj.end).slice(0,15);
                        status.value = obj.status;
                        approvedate.value = obj.approvedDate.split("T")[0];
                        myModal.show();
                    }

                    const calendar = new Calendar(calendarEl, {
                        plugins: [dayGridPlugin],
                        headerToolbar: {
                            left: "prev,next today",
                            center: "title",
                            right: "",
                        },
                        fixedWeekCount: false,
                        height: 840,
                        eventSources: [
                            {
                                events: myVacations,
                                color: "blue",
                                textColor: "white",
                            },
                        ],
                        eventClick: function (info) {
                            const obj = {
                                id : info.event.extendedProps.vacationId,
                                title : info.event.title,
                                start : info.event.start,
                                end : info.event.end,
                                approvedDate : info.event.extendedProps.approvedDate,
                                status : info.event.extendedProps.status,
                            }

                            addEmployeeBtnClickHandler(obj);
                        },
                    });
                    calendar.render();



                } catch (error) {
                    console.error('Error fetching data:', error);
                }

            }
        )
        ;
    </script>
    <style>
        /* 최외각 div */
        .container-vac {
            display: flex;
            gap: 20px;
            padding-left: 20px;
        }

        .req-vac {
            flex: 1;
            background-color: #f9f9fb;
            padding: 63px 20px 0px 20px;
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
        <div id="calendar" style="width: 75%;"></div>
        <div class="req-vac">
            <form action="#" method="post">
                <h4>휴가 신청하기</h4>
                <label for="vacation-type">휴가 유형 | <span id="myVac">보유 연차: <span
                        id="annual-days"></span> / 15</span></label>
                <select id="vacation-type">
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
                <input type="date" id="start-date"/>

                <label for="end-date">종료 날짜</label>
                <input type="date" id="end-date"/>

                <label for="approve1">승인권자 1</label>
                <select id="approve1"></select>

                <label for="approve2">승인권자 2</label>
                <select id="approve2"></select>

                <label for="approve3">승인권자 3</label>
                <select id="approve3"></select>

                <button id="submit-vacation" type="submit">신청하기</button>
            </form>
        </div>
    </div>
</div>

<!-- 취소신청 모달 -->
<div class="modal fade" id="addEmployeeModal" tabindex="-1">
    <div class="modal-dialog" style="margin-top:200px;">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title fs-5 fw-bold" id="exampleModalLabel">휴가 취소신청</h2>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-flex flex-column">
                <div class="d-flex mb-3">
                    <div class="col-3 d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">
                        휴가유형</p></div>
                    <div class="col-6 d-flex align-items-center" style="position: relative">
                        <input id="m-vac-type" type="text" class="form-control" style="border-radius: 2px;" readonly>
                    </div>
                </div>
                <div class="d-flex mb-3">
                    <div class="col-3 d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">시작
                        날짜</p></div>
                    <div class="col-6 d-flex align-items-center" style="position: relative">
                        <input id="m-vac-start" type="text" class="form-control" style="border-radius: 2px;" readonly>
                    </div>
                </div>
                <div class="d-flex mb-3">
                    <div class="col-3 d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">종료
                        날짜</p></div>
                    <div class="col-6 d-flex align-items-center" style="position: relative">
                        <input id="m-vac-end" type="text" class="form-control" style="border-radius: 2px;" readonly>
                    </div>
                </div>
                <div class="d-flex mb-3">
                    <div class="col-3 d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">승인
                        상태</p>
                    </div>
                    <div class="col-6 d-flex align-items-center" style="position: relative">
                        <input id="m-vac-status" type="text" class="form-control" style="border-radius: 2px;" readonly>
                    </div>
                </div>
                <div class="d-flex mb-3">
                    <div class="col-3 d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">승인
                        날짜</p>
                    </div>
                    <div class="col-6 d-flex align-items-center" style="position: relative">
                        <input id="m-vac-approvedate" type="text" class="form-control" style="border-radius: 2px;" readonly>
                    </div>
                </div>
                <div class="d-flex  mb-3">
                    <div class="col-3 d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">
                        취소승인권자</p></div>
                    <div class="col-6">
                        <select class="form-select" id="inputGroupSelect01">
                            <option selected>최상위 부서</option>
                            <option value="1">영업부서</option>
                            <option value="2">영업 1팀</option>
                            <option value="3">영업 2팀</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button id="modalCloseBtn" type="button" data-bs-dismiss="modal"
                        class="btn border border-black btn-black bg-white" style="border-radius: 2px; height: 36px;"><p>닫기</p>
                </button>
                <button id="addEmployeeBtnOfModal" type="button" data-bs-dismiss="modal" class="btn btn-primary">취소 신청
                </button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    const annual = 3;

    const annualDays = document.getElementById("annual-days");
    annualDays.innerHTML = annual;

</script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>
</html>
