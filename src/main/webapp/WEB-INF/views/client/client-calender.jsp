<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>휴가 캘린더</title>
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

        document.addEventListener("DOMContentLoaded", function () {
            const calendarEl = document.getElementById("calendar");

            const calendar = new Calendar(calendarEl, {
                plugins: [dayGridPlugin],
                headerToolbar: {
                    left: "prev,next today",
                    center: "title",
                    right: "",
                },
                eventSources: [
                    {
                        events: [
                            {title: "event", start: "2024-08-01"},
                            {title: "연차", start: "2024-08-14", end: "2024-08-16T20:59:59"},
                        ],
                        color: "blue",
                        textColor: "white",
                    },
                ],
                selectable: true, // 드래그로 날짜 선택 가능
                select: function (info) {
                    // 선택된 날짜 범위 처리
                    const startDate = info.startStr;
                    const endDate = info.endStr;

                    // 선택된 날짜를 입력란에 채우기 (기능 유지)
                    console.log(`Selected Start Date: ${startDate}`);
                    console.log(`Selected End Date: ${endDate}`);
                },
                eventClick: function (info) {
                    // 클릭된 이벤트의 세부 정보 표시
                    alert(info);
                    console.log(info.event);
                    const event = info.event;
                    document.getElementById("event-details").innerHTML = `
              <h4>이벤트 상세 정보</h4>
              <p><strong>제목:</strong> ${event.title}</p>
              <p><strong>시작:</strong> ${event.start.toISOString().split('T')[0]}</p>
            `;
                },
            });
            calendar.render();
        });
    </script>
    <style>
        .container-vac {
            display: flex;
            justify-content: center;
            align-items: center;
        }
    </style>
</head>

<body>
<%@ include file="/resources/components/header.jsp" %>
<%@ include file="/resources/components/sidebar.jsp" %>

<div id="mainArea">
    <div class="container-vac">
        <div id="calendar" style="width: 60%;"></div>
        
    </div>
</div>
</body>
</html>
