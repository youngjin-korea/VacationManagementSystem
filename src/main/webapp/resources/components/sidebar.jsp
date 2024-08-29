<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sidebar Example</title>
    <link rel="stylesheet" href="/resources/css/sidebar.css"> <!-- Adjust the path accordingly -->
    <script>
        function toggleSidebar() {
            var sidebar = document.getElementById('leftSidebar-wrapper');
            var isOpen = sidebar.classList.contains('open');
            if (isOpen) {
                sidebar.classList.remove('open');
                sidebar.classList.add('closed');
            } else {
                sidebar.classList.remove('closed');
                sidebar.classList.add('open');
            }
        }
    </script>
</head>
<body>
    <div
        id="leftSidebar-wrapper"
        class="closed"
    >
        <button
            id="leftSidebarBtn"
            onclick="toggleSidebar()"
            class="btn btn-primary"
        >
            <!-- 버튼 안의 내용 (예: 아이콘 또는 텍스트) -->
        </button>
    </div>
</body>
</html>
