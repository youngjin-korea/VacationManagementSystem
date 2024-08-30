<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sidebar Example</title>
    <link rel="stylesheet" href="/resources/css/sidebar.css">

    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        $(document).ready(function () {
            $('.dropdown-toggle').on('click', function () {
                $(this).next('.collapse').toggleClass('show');
                $(this).parent().toggleClass('active');
            });

            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });

        function toggleSidebar() {
            var sidebar = document.getElementById("leftSidebar-wrapper");
            var menubar = document.getElementById("menubar");
            var isOpen = sidebar.classList.contains("open");

            if (isOpen) {
                sidebar.classList.remove("open");
                sidebar.classList.add("closed");
                menubar.classList.remove("show-content");
                mainArea.style.paddingLeft="100px";
            } else {
                sidebar.classList.remove("closed");
                sidebar.classList.add("open");
                menubar.classList.add("show-content");
                mainArea.style.paddingLeft="330px";
            }
        }
    </script>
</head>
<body>
    <div id="leftSidebar-wrapper" class="closed">
        <button id="leftSidebarBtn" onclick="toggleSidebar()" class="btn btn-primary">
         
        </button>
        
        <div id="menubar" class="hidden-content">
            <!-- Sidebar -->
            <nav id="sidebar">
                <%-- <div class="sidebar-header">
                    <h3>NeoV</h3>
                </div> --%>

                <ul class="list-unstyled components">
                    <li class="active">
                        <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Home</a>
                        <ul class="collapse list-unstyled" id="homeSubmenu">
                            <li><a href="#">Home 1</a></li>
                            <li><a href="#">Home 2</a></li>
                            <li><a href="#">Home 3</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">About</a>
                    </li>
                    <li>
                        <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Pages</a>
                        <ul class="collapse list-unstyled" id="pageSubmenu">
                            <li><a href="#">Page 1</a></li>
                            <li><a href="#">Page 2</a></li>
                            <li><a href="#">Page 3</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">Portfolio</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                </ul>

            </nav>
        </div>
    </div>
</body>
</html>
