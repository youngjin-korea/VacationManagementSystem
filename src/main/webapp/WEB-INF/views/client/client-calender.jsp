<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>캘린더</title>
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
                            {title: "연차", start: "2024-08-14", end: "2024-08-16"},
                            {title: "병가", start: "2024-09-01", end: "2024-09-03", status: "true"}
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
        })
    </script>
</head>

<body>
<%@ include file="/resources/components/header.jsp" %>
<%@ include file="/resources/components/sidebar.jsp" %>

<div id="mainArea">
    <div id="calendar" style="width: 95%;"></div>
</div>

</body>
</html>
