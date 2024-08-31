<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/styles.css" />
    <script type="importmap">
      {
        "imports": {
          "@fullcalendar/core": "https://cdn.skypack.dev/@fullcalendar/core@6.1.15",
          "@fullcalendar/daygrid": "https://cdn.skypack.dev/@fullcalendar/daygrid@6.1.15"
        }
      }
    </script>
    <script type="module">
      import { Calendar } from "@fullcalendar/core";
      import dayGridPlugin from "@fullcalendar/daygrid";

      document.addEventListener("DOMContentLoaded", function () {
        const calendarEl = document.getElementById("calendar");
        const vacationTableBody = document.getElementById("vacation-table-body");
      
       
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
              events: [
                // 여기에 실제 데이터로 대체될 예정
                { title: "연차", start: "2024-08-14", end: "2024-08-16" },
                { title: "병가", start: "2024-09-01", end: "2024-09-03", status:"true" }
              ],
              color: "blue",
              textColor: "white",
            },
          ],
          eventClick: function (info) {
            // 클릭된 이벤트의 세부 정보 표시
            console.log(info.event);
            console.log(info.event.startStr);
            console.log(info.event.endStr);
            console.log(info.event.title);
            console.log(info.event.extendedProps.status);
          },
        });
        calendar.render();

        // 예시 데이터 (실제로는 서버에서 데이터 조회 필요)
        const vacations = [
          { type: "연차", start_date: "2024-08-14", end_date: "2024-08-16", status: "승인됨" },
          { type: "병가", start_date: "2024-09-01", end_date: "2024-09-03", status: "대기중" }
        ];

        // 테이블에 데이터 삽입
        vacations.forEach(vacation => {
          const row = document.createElement("tr");
          row.innerHTML = `
            <td>${vacation.type}</td>
            <td>${vacation.start_date}</td>
            <td>${vacation.end_date}</td>
            <td>${vacation.status}</td>
          `;
          vacationTableBody.appendChild(row);
        });
      });
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
      #myVac{
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
            <label for="vacation-type">휴가 유형 | <span id="myVac">보유 연차: <span id="annual-days"></span> / 15</span></label>
            <select id="vacation-type">
              <option value="연차 휴가" selected>연차</option>
              <option value="오전 반차">오전 반차</option>
              <option value="오후 반차">오후 반차</option>
              <option value="병가">병가</option>
              <option value="출산 휴가">출산 휴가</option>
              <option value="육아 휴가">육아 휴가</option>
              <option value="무급 휴가">무급 휴가</option>
              <option value="임시 휴가">임시 휴가</option>
              <option value="공휴일">공휴일</option>
            </select>

            <label for="start-date">시작 날짜</label>
            <input type="date" id="start-date" />

            <label for="end-date">마지막 날짜</label>
            <input type="date" id="end-date" />

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
    <script type="text/javascript">
       const annual = 3;
       
          const annualDays = document.getElementById("annual-days");
        annualDays.innerHTML = annual;
        
    </script>
  </body>
</html>
