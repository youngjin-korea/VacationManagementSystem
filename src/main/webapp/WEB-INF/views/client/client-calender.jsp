<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>캘린더</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/styles.css"/>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
            function clickCalendar(title){
                swal(title);
            }

            const calendarEl = document.getElementById("calendar");

            try {
                const response = await fetch('/clients/calender', {
                    method: 'GET',
                    headers: {
                        'Content-Type': 'application/json'
                    }
                });
                const result = await response.json();

                const result2 = result.map((it) => {
                    return {
                        start: it.startedDate.slice(0, 10),
                        end: it.endDate.slice(0, 10),
                        title: "부서번호: "+it.deptId+" 이름: "+it.empName+
                            "\n휴가 종류: "+ it.vtName+
                            "\n휴가시작: "+it.startedDate.slice(0, 10)+
                            "\n휴가 종료: "+it.endDate.slice(0, 10),
                    };
                })
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
                            events:result2,
                            color: "blue",
                            textColor: "white",
                        },
                    ],
                    eventClick: function (info) {
                        clickCalendar(info.event.title);
                    },
                });
                calendar.render();
            } catch (e) {
                console.error(e);
            }


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
