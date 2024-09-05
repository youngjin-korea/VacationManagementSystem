<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/create-type-modal.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/vacation-type.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/styles.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


    <style>
        .swal-button {
            background-color: #004DC1;
            font-size: 15px;
            text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
        }

        #department-dropdown, #vacation-type-dropdown {
            width: 150px; /* 드롭다운 메뉴의 너비 조정 */
            height: 38px; /* 드롭다운의 높이 조정 */
        }

        #name-search {
            width: 200px; /* 이름 검색 바의 너비 조정 */
            height: 38px; /* 이름 검색 바의 높이 조정 */
        }

        #delete-button {
            margin-left: 1rem; /* 삭제 버튼과 이름 검색 바 사이의 여백 조정 */
            height: 38px; /* 삭제 버튼의 높이 조정 */
        }

        .search-container {
            display: flex;
            justify-content: space-between; /* 왼쪽과 오른쪽 끝으로 정렬 */
            align-items: center; /* 세로 중앙 정렬 */
            gap: 0.5rem; /* 요소 간의 간격 조정 */
            margin-top: 100px;
        }

        .search-container-left {
            display: flex;
            gap: 1.5rem; /* 요소 간의 간격 조정 */
            margin: 25px 7px;
        }

        .search-container-right {
            display: flex;
            gap: 1.5rem;
            align-items: center;
            margin: 25px 7px;
        }

        #addGrantVacationModalBtn,
        #deleteVacationModalBtn {
            /* 버튼의 크기를 동일하게 설정 */
            width: 200px; /* 원하는 너비로 설정 */
        }
    </style>

</head>

<body>
<%@ include file="/resources/components/header.jsp" %>
<%@ include file="/resources/components/sidebar.jsp" %>


<div id="mainArea">
    <div id="vacation-type-main">
        <div id="vacation-type-header">
            <h3>휴가 부여 관리</h3>
            <div class="row">
                <div class="col-md-12">
                    <div class="search-container">
                        <div class="search-container-left">
                            <select id="department-dropdown" class="form-control" >
                                <option>부서 선택</option>

                            </select>

                            <select id="vacation-type-dropdown" class="form-control">
                                <option value="default">휴가 유형 선택</option>


                            </select>
                        </div>
                        <div class="search-container-right">
                            <!-- 이름 검색 바 -->
                            <input type="text" id="name-search" class="form-control" placeholder="이름 검색">

                            <!-- 임의 휴가 검색 버튼 -->
                            <button class="btn btn-primary" id="searchVacationBtn" type="button">휴가 검색</button>

                            <!-- 임의 휴가 부여 버튼 -->
                            <button class="btn btn-primary" id="addGrantVacationModalBtn" type="button">임의 휴가 추가
                            </button>

                            <!-- 임의 휴가 삭제 버튼 -->
                            <button class="btn btn-primary me-md-2" id="deleteVacationModalBtn" type="button">휴가 삭제
                            </button>

                        </div>
                    </div>
                </div>
            </div>


        </div>


        <div id="vacation-type-document">

            <table class="table">
                <thead class="table-light">
                <tr>
                    <th scope="col">
                        <input class="form-check-input" type="checkbox" id="selectAllGrantCheckbox">
                    </th>

                    <th scope="col">성함</th>
                    <th scope="col">부서</th>
                    <th scope="col">휴가유형</th>
                    <th scope="col">생성일자</th>
                    <th scope="col">만료일자</th>
                </tr>
                </thead>

                <tbody id="grantVacationTable">
                <c:forEach var="Greq" items="${GrantedVacationList}">
                    <!-- data-id : 각 행에 data-id 속성을 추가 및 행의 id 값을 저장 -->
                    <tr data-id="${Greq.id}">
                        <th scope="row">
                            <input class="form-check-input row-checkbox" type="checkbox" data-id="${Greq.id}">
                        </th>
                        <td>${Greq.emp_name}</td>
                        <td>${Greq.dept_name}</td>
                        <td>${Greq.vacation_name}</td>
                        <fmt:formatDate value="${Greq.granted_date}" pattern="yyyy-MM-dd" var="granted_date"/>
                        <td>${granted_date}</td>
                        <fmt:formatDate value="${Greq.expiration_date}" pattern="yyyy-MM-dd" var="expiration_date"/>
                        <td>${expiration_date}</td>

                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>

    </div>
</div>

<!-- 임의 휴가 부여 추가 모달 grant-vacation-button -->
<div class="modal fade" id="addGrantVacationModal" tabindex="-1" aria-labelledby="addGrantVacationModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="margin-top:200px;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">임의 휴가 부여하기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="inputForm">
                    <div class="form-group">
                        <label for="departmentSelect">부서 선택</label>
                        <select class="form-control" id="departmentSelect" name="departmentSelect" required>
                            <option value="">부서 선택</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="employeeSelect">사원 선택</label>
                        <select class="form-control" id="employeeSelect" name="employeeSelect" required>
                            <option value="">사원을 선택하세요</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="vacationTypeSelect">휴가 유형 선택</label>
                        <select class="form-control" id="vacationTypeSelect" name="vacationTypeSelect" required>
                            <option value="">휴가 유형을 선택하세요</option>
                        </select>
                    </div>
                    <div>
                        <label for="addDescription"></label>
                        <input type="text" class="form-control" id="addDescription" name="addDescription"
                               placeholder="설명을 입력하세요" required>
                    </div>
                    <div class="form-group">
                        <label for="vacationDays">휴가 일수</label>
                        <input type="text" class="form-control" id="vacationDays" name="vacationDays"
                               placeholder="휴가 일수를 입력하세요" required>
                    </div>
                    <div class="form-group">
                        <label for="addEmployeeDatepicker">만료일자</label>
                        <input id="addEmployeeDatepicker" width="276"/>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="submit" class="btn btn-primary" id="addGrantVacationBtn">저장</button>
            </div>
        </div>
    </div>
</div>



<!-- 임의 휴가 상세보기 grant-vacation-button -->
<!-- 휴가 정보 및 직원 정보 모달 -->
<div class="modal fade" id="detailGrantVacationModal" tabindex="-1" aria-labelledby="detailGrantVacationModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg" style="margin-top:100px;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="detailGrantVacationModalTitle">휴가 정보</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- 휴가 정보 섹션 -->
                <div class="mb-4">
                    <h6 class="mb-3">휴가 상세 정보</h6>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <strong>휴가 일수:</strong>
                            <p id="grantVacationTypeName" class="form-text">휴가 유형 정보</p>
                        </div>

                        <div class="col-md-6 mb-3">
                            <strong>휴가 일수:</strong>
                            <p id="grantVacationDays" class="form-text">휴가 일수 정보</p>
                        </div>
                        <div class="col-md-6 mb-3">
                            <strong>부여일:</strong>
                            <p id="grantGrantedDate" class="form-text">부여일 정보</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <strong>만료일자:</strong>
                            <p id="grantExpirationDate" class="form-text">만료일자 정보</p>
                        </div>
                        <div class="col-md-6 mb-3">
                            <strong>설명:</strong>
                            <p id="grantDescription" class="form-text">설명 정보</p>
                        </div>
                    </div>
                </div>

                <!-- 직원 정보 섹션 -->
                <div class="mb-4">
                    <h6 class="mb-3">직원 정보</h6>
                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <strong>사원 이름:</strong>
                            <p id="grantEmployeeName" class="form-text">사원 이름 정보</p>
                        </div>
                        <div class="col-md-4 mb-3">
                            <strong>직위:</strong>
                            <p id="grantEmployeePosition" class="form-text">직위 정보</p>
                        </div>
                        <div class="col-md-4 mb-3">
                            <strong>이메일:</strong>
                            <p id="grantEmployeeEmail" class="form-text">이메일 정보</p>
                        </div>
                    </div>
                </div>

                <!-- 부서 정보 섹션 -->
                <div>
                    <h6 class="mb-3">부서 정보</h6>
                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <strong>부서:</strong>
                            <p id="grantDeptName" class="form-text">부서 이름 정보</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="updateGrantVacationModalBtn">수정하기</button>
            </div>
        </div>
    </div>
</div>

<!-- 임의 휴가 부여 모달 grant-vacation-button -->

<div class="modal fade" id="updateGrantVacationModal" tabindex="-1" aria-labelledby="updateGrantVacationModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="margin-top:200px;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateGrantVacationModalTitle">임의 휴가 수정하기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="updateGrantVacationModalForm">
                    <div class="form-group">
                        <label for="updateGrantVacationDept">부서 선택</label>
                        <div id="updateGrantVacationDept" class="form-control-plaintext">
                            부서 이름이 표시됩니다
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updateGrantVacationEmp">사원 선택</label>
                        <div id="updateGrantVacationEmp" class="form-control-plaintext">
                            사원 이름이 표시됩니다
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updateGrantVacationType">휴가 유형 선택</label>
                        <div id="updateGrantVacationType" class="form-control-plaintext">
                            휴가 유형이 표시됩니다
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updateGrantVacationDays">휴가 일수</label>
                        <input type="text" class="form-control" id="updateGrantVacationDays" name="vacationDays"
                               placeholder="휴가 일수를 입력하세요" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="submit" class="btn btn-primary" id="updateSubmitButton">저장</button>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function () {

        $.ajax({
            url: '/admin/grant-vacation-management/departments',
            method: 'GET',
            success: function (data) {
                var departmentDropdown = $('#department-dropdown');
                departmentDropdown.empty();

                departmentDropdown.append('<option value="0">부서 선택</option>');
                data.forEach(function (department) {
                    departmentDropdown.append('<option value="' + department.departmentId + '">' + department.departmentName + '</option>');
                });
            }
        });

        $.ajax({
            url: '/admin/grant-vacation-management/vacationtypes',
            method: 'GET',
            success: function (data) {
                var vacationTypeDropdown = $('#vacation-type-dropdown');
                vacationTypeDropdown.empty();
                vacationTypeDropdown.append('<option value="0">휴가 유형</option>');
                data.forEach(function (vacationType) {
                    vacationTypeDropdown.append('<option value="' + vacationType.vacationTypeId + '">' + vacationType.vacationTypeName + '</option>');
                });
            }
        });

        document.getElementById('searchVacationBtn').addEventListener('click', function () {

                // 입력 필드의 값 가져오기
            var searchText = $('#name-search').val();

            // 콘솔에 입력된 텍스트도 출력
            console.log('검색한 이름:', searchText);




        });

        document.getElementById('addGrantVacationModalBtn').addEventListener('click', function () {
            alert("클릭됐습니다.");

            loadoptionData();
            var addGrantVacationModal = new bootstrap.Modal(document.getElementById('addGrantVacationModal'));
            addGrantVacationModal.show();
        });// 휴가 추가 이벤트 끝

        //--------------- 공통 함수 모음 -----------
        function formatDate(dateString) {
            const date = new Date(dateString);
            return date.toLocaleDateString('ko-KR'); // 한국어 날짜 형식
        }

        // 수정시 클릭한 해당 grantvacation 테이블의 Id가 필요
        var grantVacationId = '';

        var dept_name_selectedText = '';

        var vacation_name_selectedText = '';

        // 성공 alert
        function successAlert() {
            return new Promise((resolve) => {
                swal({
                    title: "성공적으로 삭제되었습니다.",
                    text: "",
                    icon: 'success',
                    buttons: {
                        confirm: {
                            text: "확인",
                            value: true,
                            className: "swal-button"
                        }
                    }
                }).then(() => {
                    resolve();
                });
            });
        }

        //실패 alert
        function failAlert() {
            return new Promise((resolve) => {
                swal("오류", "데이터 삭제에 실패했습니다.", "warning")
                    .then(() => {
                        resolve()
                    });
            })
        }

        // 전체 check 하기
        document.getElementById('selectAllGrantCheckbox').addEventListener('change', function () {

            var isChecked = this.checked;
            var checkboxes = document.querySelectorAll('.row-checkbox');
            checkboxes.forEach(function (checkbox) {
                checkbox.checked = isChecked;
            });
        });

        // 수정모달 목록별 로드 하기
        function loadoptionData() {
            //부서 목록 로드
            $.ajax({
                url: '/admin/grant-vacation-management/departments',
                method: 'GET',
                success: function (data) {
                    var departmentSelect = $('#departmentSelect');
                    departmentSelect.empty(); // 기존 옵션 제거
                    departmentSelect.append('<option value="">부서를 선택하세요</option>');
                    data.forEach(function (department) {
                        departmentSelect.append('<option value="' + department.departmentId + '">' + department.departmentName + '</option>');
                    });
                }
            });


            $('#departmentSelect').change(function () {
                var departmentId = $(this).val();
                $.ajax({
                    url: '/admin/grant-vacation-management/employees?departmentId=' + departmentId, // 서버 API URL
                    method: 'GET',
                    success: function (data) {
                        var employeeSelect = $('#employeeSelect');
                        employeeSelect.empty();
                        employeeSelect.append('<option value="">사원을 선택하세요</option>');
                        data.forEach(function (employee) {
                            employeeSelect.append('<option value="' + employee.empId + '">' + employee.empName + '</option>');
                        });
                    }
                });
            });
            $.ajax({
                url: '/admin/grant-vacation-management/vacationtypes',
                method: 'GET',
                success: function (data) {
                    var vacationTypeSelect = $('#vacationTypeSelect');
                    vacationTypeSelect.empty();
                    vacationTypeSelect.append('<option value="">휴가 유형을 선택하세요</option>');
                    data.forEach(function (vacationType) {
                        vacationTypeSelect.append('<option value="' + vacationType.vacationTypeId + '">' + vacationType.vacationTypeName + '</option>');
                    });
                }
            });
        }


        // 검색 테이블 변경 함수
        function searchTypeTable(dept_name_selectedText,vacation_name_selectedText){
            $.ajax({
                url: '/admin/grant-vacation-management/typeList',
                method: 'GET',
                data : ({
                    dept_name: dept_name_selectedText,
                    vacation_name: vacation_name_selectedText
                }),
                success: function (data) {

                    console.log(data);
                    var newBody = $('<tbody id="grantVacationTable">');

                    data.forEach( function (item) {
                        var row = $('<tr>')
                            .append($('<th>').append($('<input class="form-check-input row-checkbox" type="checkbox">')))
                            .append($('<td>').text(item.emp_name))
                            .append($('<td>').text(item.dept_name))
                            .append($('<td>').text(item.vacation_name))
                            .append($('<td>').text(item.granted_date))
                            .append($('<td>').text(item.expiration_date));

                        newBody.append(row);
                    });

                    $('#grantVacationTable').replaceWith(newBody);

                }
            });
        }

        $(document).on('change', '#department-dropdown', function() {
            var selectedValue = $(this).val();
            var dept_name_selectedText = $('#department-dropdown option:selected').text();

            searchTypeTable(dept_name_selectedText,vacation_name_selectedText);
        });




        $(document).on('change', '#department-dropdown', function() {
            $('#vacation-type-dropdown').val('0');
            var selectedValue = $(this).val();
            var dept_name_selectedText = $('#department-dropdown option:selected').text();
            vacation_name_selectedText = '';

            searchTypeTable(dept_name_selectedText,vacation_name_selectedText);
        });

        document.getElementById('vacation-type-dropdown').addEventListener('click', function () {
            $('#department-dropdown').val('0');
            var selectedValue = $(this).val();
            var vacation_name_selectedText = $('#vacation-type-dropdown option:selected').text();
            dept_name_selectedText = '';

            searchTypeTable(dept_name_selectedText,vacation_name_selectedText);

        });



        // data pick
        $(function () {
            //input을 datepicker로 선언
            $("#addEmployeeDatepicker").datepicker({
                dateFormat: 'yy-mm-dd' //달력 날짜 형태
                , showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                , showMonthAfterYear: true // 월- 년 순서가아닌 년도 - 월 순서
                , changeYear: true //option값 년 선택 가능
                , changeMonth: true //option값  월 선택 가능
                , buttonText: "선택" //버튼 호버 텍스트
                , yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
                , monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 텍스트
                , monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'] //달력의 월 부분 Tooltip
                , dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'] //달력의 요일 텍스트
                , dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'] //달력의 요일 Tooltip
                , minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                , maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
            });


            $('#updateGrantVacationExpiryDate').datepicker('setDate', 'today');
            //초기값을 오늘 날짜로 설정해줘야 합니다.
            $('#addEmployeeDatepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
        });

        //-----------------------공통 함수 끝------

        // 상세보기 모달 ajax
        document.getElementById('grantVacationTable').addEventListener('click', function (event) {
            var target = event.target;

            // 클릭된 행을 찾기
            while (target && target.nodeName !== 'TR') {
                target = target.parentNode;

                if (target.closest('th')) {
                    return;
                }
            }

            if (target) {
                grantVacationId = target.getAttribute('data-id');

                // AJAX 요청을 통해 데이터 가져오기
                $.ajax({
                    url: '/admin/grant-vacation-management/detail?id=' + grantVacationId,
                    method: 'GET',
                    success: function (data) {
                        console.log("Data received:", data);

                        // Populate the detail modal fields with data from the server response
                        document.getElementById('grantVacationDays').innerText = data.vacation_days || '정보 없음';
                        document.getElementById('grantGrantedDate').innerText = formatDate(data.granted_date) || '정보 없음';
                        document.getElementById('grantExpirationDate').innerText = formatDate(data.expiration_date) || '정보 없음';
                        document.getElementById('grantDescription').innerText = data.description || '정보 없음';
                        document.getElementById('grantEmployeeName').innerText = data.emp_name || '정보 없음';
                        document.getElementById('grantEmployeePosition').innerText = data.position || '정보 없음';
                        document.getElementById('grantEmployeeEmail').innerText = data.email || '정보 없음';
                        document.getElementById('grantDeptName').innerText = data.dept_name || '정보 없음';
                        document.getElementById('grantVacationTypeName').innerText = data.vacation_type_name || '정보 없음';


                        // 상세 모달 표시
                        var detailGrantVacationModal = new bootstrap.Modal(document.getElementById('detailGrantVacationModal'));
                        detailGrantVacationModal.show();

                        // 수정하기 버튼 클릭 이벤트 리스너 추가
                        document.getElementById('updateGrantVacationModalBtn').addEventListener('click', function () {
                            // Populate the update modal fields with data
                            document.getElementById('updateGrantVacationDept').innerText = data.dept_name || '부서 이름이 표시됩니다';
                            document.getElementById('updateGrantVacationEmp').innerText = data.emp_name || '사원 이름이 표시됩니다';
                            document.getElementById('updateGrantVacationType').innerText = data.vacation_type_name || '휴가 유형이 표시됩니다';
                            document.getElementById('updateGrantVacationDays').value = data.vacation_days || '';

                            // 상세 모달 닫기
                            detailGrantVacationModal.hide();

                            // 수정 모달 표시
                            var updateGrantVacationModal = new bootstrap.Modal(document.getElementById('updateGrantVacationModal'));
                            updateGrantVacationModal.show();
                        }, {once: true});
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.error('Error:', errorThrown);
                    }
                });
            }
        });

        // 임의 부여 저장 버튼 클릭
        $('#addGrantVacationBtn').on('click', function (event) {
            event.preventDefault();


            // formData 사용
            var formData = {


                emp_id: $('#employeeSelect').val(),
                vacation_type_id: $('#vacationTypeSelect').val(),
                vacation_days: $('#vacationDays').val(),
                expiration_date: $('#addEmployeeDatepicker').val(),
                description: $('#addDescription').val(),

            };


            // 추가 api ajax 호출
            $.ajax({
                url: '/admin/grant-vacation-management/add',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(formData),
                success: function (response) {
                    swal({
                        title: "성공적으로 추가되었습니다.",
                        text: "",
                        icon: 'success',
                        buttons: {
                            confirm: {
                                text: "확인",
                                value: true,
                                className: "swal-button"
                            }
                        }
                    }).then(() => {

                        var addGrantVacationModal = bootstrap.Modal.getInstance(document.getElementById('addGrantVacationModal'));
                        addGrantVacationModal.hide();
                        location.reload(true);
                    });

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.error('Error:', errorThrown);
                    alert('저장 중 오류가 발생했습니다.');
                }
            });
        });

        // 모달의 수정 버튼 클릭
        document.getElementById('updateSubmitButton').addEventListener('click', function () {
            console.log("var grantVacationId " + grantVacationId);
            // console.log("vacation_days "+ $('#updateGrantVacationDays').val() );

            // 수정 api AJAX 요청
            $.ajax({
                url: '/admin/grant-vacation-management/update', // 실제 데이터 업데이트 URL로 변경
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    vacation_days: $('#updateGrantVacationDays').val(),
                    id: grantVacationId
                }),
                success: function (response) {
                    console.log("Data updated successfully:", response);
                    swal("성공", "데이터가 업데이트되었습니다.", "success").then(() => {
                        // 모달 닫기 및 데이터 새로고침
                        location.reload();

                    })

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.error('Error:', errorThrown);
                    swal("실패", "데이터가 업데이트 실패했습니다.", "warning");

                }
            });
        }); //  모달 수정 버튼 클릭 이벤트 끝

        document.getElementById('deleteVacationModalBtn').addEventListener('click', function () {
            var selectedIds = [];
            var checkboxes = document.querySelectorAll('.row-checkbox:checked');
            checkboxes.forEach(function (checkbox) {
                selectedIds.push(checkbox.getAttribute('data-id'));
                console.log(checkbox.getAttribute('data-id'));
            });

            if (selectedIds.length === 0) {
                alert('삭제할 항목을 선택해 주세요.');
                return;
            }

            console.log("selectedIds" + JSON.stringify({id: selectedIds}));


            // 삭제 요청을 위한 AJAX
            $.ajax({
                url: '/admin/grant-vacation-management/delete',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({ids: selectedIds}),
                success: function (response) {
                    console.log("Data deleted successfully:", response);
                    successAlert().then(() => {
                        // 테이블 새로 고침
                        location.reload(true);
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.error('Error:', errorThrown);
                    failAlert().then(() => {
                        location.reload(true);
                    });

                }
            });

        });

    });
</script>


</body>
</html>
