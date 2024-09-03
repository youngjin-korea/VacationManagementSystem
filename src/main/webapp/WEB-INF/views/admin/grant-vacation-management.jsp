<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

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
            margin-top:100px;
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
    </style>

</head>

<body>
<%@ include file="/resources/components/header.jsp" %>
<%@ include file="/resources/components/sidebar.jsp" %>



<div id="mainArea">
    <div id ="vacation-type-main">
        <div id ="vacation-type-header">
            <h3 >휴가 부여 관리</h3>
            <div class="row">
                <div class="col-md-12">
                    <div class="search-container">
                        <div class="search-container-left">
                            <select id="department-dropdown" class="form-control">
                                <option>부서 선택</option>
                                <option>영업부서</option>
                                <option>인사부서</option>

                            </select>

                            <select id="vacation-type-dropdown" class="form-control">
                                <option>휴가 유형 선택</option>
                                <option>연차</option>
                                <option>병가</option>

                            </select>
                        </div>
                        <div class="search-container-right">
                            <!-- 이름 검색 바 -->
                            <input type="text" id="name-search" class="form-control" placeholder="이름 검색">
                            <!-- 임의 휴가 부여 버튼 -->
                            <button class="btn btn-primary" id="addGrantVacationModalBtn" type="button">임의 휴가 추가</button>
                            <!-- 임의 휴가 수정 버튼 -->
                            <button class="btn btn-primary me-md-2" id="updateVacationModalBtn" type="button">휴가 수정</button>

                        </div>
                    </div>
                </div>
            </div>




        </div>


        <div id ="vacation-type-document">

            <table class="table">
                <thead class="table-light">
                <tr>
                    <th scope="col">
                        #
                    </th>
                    <th scope="col">부서</th>
                    <th scope="col">성함</th>
                    <th scope="col">휴가유형</th>
                    <th scope="col">생성일자</th>
                </tr>
                </thead>

                <tbody>
                <tr>
                    <th scope="row">
                        <input class="form-check-input" type="checkbox" class="row-checkbox" id="check1">
                    </th>
                    <td>영업부서</td>
                    <td>홍길동</td>
                    <td>연차</td>
                    <td>2023-10-01</td>
                </tr>
                <tr>
                    <th scope="row">
                        <input class="form-check-input" type="checkbox" class="row-checkbox" id="check2">
                    </th>
                    <td>인사부서</td>
                    <td>인길동</td>
                    <td>오후반차</td>
                    <td>2023-11-01</td>
                </tr>
                <tr>
                    <th scope="row">
                        <input class="form-check-input" type="checkbox" class="row-checkbox" id="check3">
                    </th>
                    <td>개발부서</td>
                    <td>개길동</td>
                    <td>병가</td>
                    <td>2024-01-21</td>
                </tr>
                </tbody>
            </table>
        </div>

    </div>
</div>

<!-- 임의 휴가 부여 모달 grant-vacation-button -->
<div class="modal fade" id="addGrantVacationModal" tabindex="-1" aria-labelledby="addGrantVacationModalLabel" aria-hidden="true">
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
                            <option value="">부서를 선택하세요</option>
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
                    <div class="form-group">
                        <label for="vacationDays">휴가 일수</label>
                        <input type="number" class="form-control" id="vacationDays" name="vacationDays" placeholder="휴가 일수를 입력하세요" required>
                    </div>
                    <div class="form-group">
                        <label for="expiryDateUpdate">만료일자</label>
                        <input type="text" class="form-control" id="expiryDateUpdate" name="expiryDateUpdate" placeholder="날짜를 선택하세요" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="submit" class="btn btn-primary" id="submitButton">저장</button>
            </div>
        </div>
    </div>
</div>

<!-- 임의 휴가 부여 모달 grant-vacation-button -->
<div class="modal fade" id="updateGrantVacationModal" tabindex="-1" aria-labelledby="updateGrantVacationModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="margin-top:200px;">
        <div class="modal-content">

        </div>
    </div>
</div>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Bootstrap Datepicker JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>


<script>
    $(document).ready(function() {
        $('#addGrantVacationModalBtn').click(addGrantVacationModalBtnHandler);

        function addGrantVacationModalBtnHandler(){
            var addGrantVacationModal = new bootstrap.Modal(document.getElementById('addGrantVacationModal'));
            addGrantVacationModal.show();
        }

        $('#updateVacationModalBtn').click(updateVacationModalBtnHandler);

        function updateVacationModalBtnHandler(){
            var updateVacationModal = new bootstrap.Modal(document.getElementById('updateVacationModal'));
            updateVacationModal.show();
        }



        $('#expiryDateUpdate').datepicker({
            format: 'yyyy-mm-dd',
            todayHighlight: true,
            autoclose: true

        });

        // 드롭다운의 폭을 조정
        $('.datepicker').on('show', function(e) {
            $('.datepicker-dropdown').css({
                'width': '100%',
                'max-width': '500px'
            });
        });

    });
</script>


</body>
</html>
