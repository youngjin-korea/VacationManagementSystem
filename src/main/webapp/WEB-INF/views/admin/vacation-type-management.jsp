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
</head>

<body>
<%@ include file="/resources/components/header.jsp" %>
<%@ include file="/resources/components/sidebar.jsp" %>


<div id="mainArea">
    <div id="vacation-type-main">
        <div id="vacation-type-header">
            <h3>휴가유형관리</h3>


            <div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-top:5%; margin-bottom:3%">
                <button class="btn btn-primary me-md-2" id="addVacationTypeModalBtn" type="button">휴가유형추가</button>
                <button class="btn btn-primary" id="delete-vacation-button" type="button">휴가유형삭제</button>
            </div>
        </div>


        <div id="vacation-type-document">

            <table class="table">
                <thead class="table-light">
                <tr>
                    <th scope="col">
                        <input class="form-check-input" type="checkbox" id="flexCheckDefault">
                    </th>
                    <th scope="col">휴가 번호</th>
                    <th scope="col">휴가 이름</th>
                    <th scope="col">휴가 생성일</th>
                    <th scope="col">휴가 수정일</th>
                    <th scope="col">최대 휴가지급일</th>
                    <th scope="col">휴가 유급 여부</th>
                </tr>
                </thead>

                <tbody id="vacationTableBody">

                <c:forEach var="req" items="${vacationTypeList}">
                    <!-- data-id : 각 행에 data-id 속성을 추가 및 행의 id 값을 저장 -->
                    <tr data-id="${req.id}">
                        <th scope="row">
                            <input class="form-check-input" type="checkbox" class="row-checkbox" id="check1">
                        </th>
                        <td>${req.id}</td>
                        <td>${req.name}</td>
                        <fmt:formatDate value="${req.created_date}" pattern="yyyy-MM-dd" var="formattedCreatedDate"/>
                        <td>${formattedCreatedDate}</td>
                        <fmt:formatDate value="${req.updated_date}" pattern="yyyy-MM-dd" var="formattedCreatedDate"/>
                        <td>${formattedCreatedDate}</td>
                        <td>${req.max_days}</td>
                        <td>${req.is_paid}</td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>

    </div>
</div>


<!-- 휴가 유형 추가 모달 -->
<div class="modal fade" id="addVacationTypeModal" tabindex="-1" aria-labelledby="addVacationTypeModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="margin-top:200px;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addVacationTypeModalLabel">휴가 유형 추가하기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="inputForm">

                    <div class="form-group">
                        <label for="vacationTypeName">휴가 유형 이름</label>
                        <input type="text" class="form-control" id="vacationTypeName" name="vacationTypeName"
                               placeholder="여기에 입력하세요" required>
                    </div>
                    <div class="form-group">
                        <label>유급 여부</label>
                        <div class="radio-group">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="isPaid" id="noPaid" value="false">
                                <label class="form-check-label" for="noPaid">무급</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="isPaid" id="paid" value="ture">
                                <label class="form-check-label" for="paid">유급</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="maxDays">최대 사용 가능일 수</label>
                        <input type="text" class="form-control" id="maxDays" name="maxDays"
                               placeholder="여기에 입력하세요" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn quiet-btn" data-bs-dismiss="modal">닫기</button>
                <button type="submit" class="btn quiet-btn" id="addTypeSubmitButton">저장</button>
            </div>
        </div>

    </div>
</div>


<!-- 휴가 유형 수정 모달 -->
<div class="modal fade" id="updateVacationTypeModal" tabindex="-1" aria-labelledby="updateVacationTypeModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="margin-top:200px;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateVacationTypeModalLabel">휴가 유형 수정하기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="updateForm">
                    <div class="form-group">
                        <label for="updateVacationId">휴가 유형 ID</label>
                        <input type="text" class="form-control" id="updateVacationId" name="updateVacationId" placeholder="여기에 입력하세요" readonly>
                    </div>
                    <div class="form-group">
                        <label for="updateVacationTypeName">휴가 유형 이름</label>
                        <input type="text" class="form-control" id="updateVacationTypeName" name="updateVacationTypeName" placeholder="여기에 입력하세요" readonly>
                    </div>
                    <div class="form-group">
                        <label>유급 여부</label>
                        <div class="radio-group">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="updateIsPaid" id="updateNoPaid" value="false">
                                <label class="form-check-label" for="updateNoPaid">무급</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="updateIsPaid" id="updatePaid" value="true">
                                <label class="form-check-label" for="updatePaid">유급</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="updateMaxDays">최대 사용 가능일 수</label>
                        <input type="text" class="form-control" id="updateMaxDays" name="updateMaxDays" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn quiet-btn" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn quiet-btn" id="updateSubmitButton">저장</button>
            </div>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>


<script type="text/javascript">



    $('#delete-vacation-button').on('click', function () {
        swal({
            title: "성공적으로 삭제 완료됐습니다.",
            text: "",
            icon: 'success',

            buttons: {
                confirm: {
                    text: "확인",
                    value: true,
                    className: "swal-button"
                }
            }
        })
    });


    document.addEventListener('DOMContentLoaded', function () {

        var addVacationTypeModal = new bootstrap.Modal(document.getElementById('addVacationTypeModal'));
        var updateVacationTypeModal = new bootstrap.Modal(document.getElementById('updateVacationTypeModal'));


        // 저장 모달 버튼 클릭 시 모달 표시
        document.getElementById('addVacationTypeModalBtn').addEventListener('click', function () {

            addVacationTypeModal.show();
        });// 휴가 추가 이벤트 끝

        //저장모달의 저장 클릭시 저장 함수
        document.getElementById('addTypeSubmitButton').addEventListener('click', function () { var vacationTypeName = document.getElementById('vacationTypeName').value.trim();
            var maxDays = document.getElementById('maxDays').value.trim();
            var isPaid = document.querySelector('input[name="updateIsPaid"]:checked') ? document.querySelector('input[name="updateIsPaid"]:checked').value.toUpperCase() : '';

            // 데이터 유효성 검사
            if (!vacationTypeName || !maxDays || !isPaid) {
                alert('모든 필드를 입력해 주세요.');
                return;
            }


            // 데이터 전송을 위한 AJAX 요청
            $.ajax({
                url: '/admin/vacation-type-management/add', // 실제 데이터 전송 URL로 변경
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    name: vacationTypeName,
                    max_days: maxDays,
                    is_paid: isPaid
                }),
                success: function (response) {
                    console.log("Data added successfully:", response);
                    addVacationTypeModal.hide();
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

                        // 테이블 새로고침 등을 통해 데이터 업데이트 필요
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.error('Error:', errorThrown);
                    swal({
                        title: "데이터 추가 실패",
                        text: "데이터 추가에 실패했습니다.",
                        icon: 'error',
                        buttons: {
                            confirm: {
                                text: "확인",
                                value: true,
                                className: "swal-button"
                            }
                        }
                    });
                }
            });
        }); // 저장 함수 모달 끝

            // 테이블 행 클릭 시 수정할 데이터 로드 및 모달 표시
        document.getElementById('vacationTableBody').addEventListener('click', function (event) {

            var target = event.target;


            // 클릭된 행을 찾기
            while (target && target.nodeName !== 'TR') {
                target = target.parentNode;
                if(target.closest('th')) {
                    return;
                }
            }

            if (target) {
                var vacationId = target.getAttribute('data-id');
                console.log("vacationId: " + vacationId);

                // AJAX 요청을 통해 데이터 가져오기
                $.ajax({
                    url: '/admin/vacation-type-management/detail',
                    method: 'GET',
                    data: {id: vacationId},
                    success: function (data) {
                        console.log("Data received:", data);

                        document.getElementById('updateVacationId').value = data.id;
                        document.getElementById('updateVacationTypeName').value = data.name;
                        document.getElementById('updateMaxDays').value = data.max_days;

                        if (data.is_paid === 'TRUE') {
                            document.getElementById('updatePaid').checked = true;
                            document.getElementById('updateNoPaid').checked = false;
                        } else {
                            document.getElementById('updatePaid').checked = false;
                            document.getElementById('updateNoPaid').checked = true;
                        }
                        // 모달 표시
                        updateVacationTypeModal.show();
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.error('Error:', errorThrown);
                    }
                });

            }
        });// document.getElementById('vacationTableBody').addEventListener('click' : 원하는 정보 세부사항 보여주기 모달 끝

        // 수정 모달의 저장 버튼 클릭 시 데이터 업데이트
        document.getElementById('updateSubmitButton').addEventListener('click', function () {
            var vacationTypeName = document.getElementById('updateVacationTypeName').value.trim();
            var maxDays = document.getElementById('updateMaxDays').value.trim();
            var isPaid = document.querySelector('input[name="updateIsPaid"]:checked') ? document.querySelector('input[name="updateIsPaid"]:checked').value : '';

            // 데이터 유효성 검사
            if (!vacationId || !vacationTypeName || !maxDays || !isPaid) {
                alert('모든 필드를 입력해 주세요.');
                return;
            }

            // 데이터 업데이트를 위한 AJAX 요청
            $.ajax({
                url: '/admin/vacation-type-management/update', // 실제 데이터 업데이트 URL로 변경
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    id: vacationId,
                    name: vacationTypeName,
                    max_days: maxDays,
                    is_paid: isPaid
                }),
                success: function (response) {
                    console.log("Data updated successfully:", response);
                    alert('데이터가 업데이트되었습니다.');

                    // 모달 닫기 및 데이터 새로고침
                    updateVacationTypeModal.hide();
                    location.reload();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.error('Error:', errorThrown);
                    alert('데이터 업데이트에 실패했습니다.');
                }
            });
        }); // document.getElementById('updateSubmitButton') : 모달 수정 버튼 클릭 이벤트 끝

    });// document.addEventListener 끝
</script>


</body>
</html>
