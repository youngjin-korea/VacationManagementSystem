<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>휴가 신청 현황</title>
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
    </style>
  </head>

  <body>
    <%@ include file="/resources/components/header.jsp" %> 
    <%@ include file="/resources/components/sidebar.jsp" %>

    <div id="mainArea">
      <div class="container-vac">
        <div id="calendar" style="width: 75%;"></div>
        <div class="vacation-status">
          <h4>나의 휴가 신청 현황</h4>
          <table>
            <thead>
              <tr>
                <th>휴가 유형</th>
                <th>시작 날짜</th>
                <th>종료 날짜</th>
                <th>상태</th>
              </tr>
            </thead>
            <tbody id="vacation-table-body">
              <!-- 데이터가 여기에 삽입됩니다 -->
            </tbody>
          </table>
        </div>
      </div>
    </div>
    
  </body>
</html>
