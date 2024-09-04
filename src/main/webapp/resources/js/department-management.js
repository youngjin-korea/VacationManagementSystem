const departments = [];
let selectedDeptId = null;

$('#addDepartmentModalBtn').click(addDepartmentModalBtnClickHandler);

function addDepartmentModalBtnClickHandler(){
    var myModal = new bootstrap.Modal(document.getElementById('addDepartmentModal'));
    var departments = []
    myModal.show();


    $.ajax({
        type: "GET",
        url: "/api/departments",
        success: function (data) {
            departments = data;
            console.log(departments);
            var selectElement = $('#addDepartmentSelect'); // #departmentSelect는 <select> 요소의 ID로 가정합니다.

            selectElement.empty();

            // 각 부서 옵션 추가
            departments.forEach(function(department) {
                var indent = '&nbsp;'.repeat((department.level - 1) * 4); // 들여쓰기
                selectElement.append('<option value="' + department.id + '">' + indent + department.name + '</option>');
            });


        },
        error: function(data){
            console.log("실패");

        }
    });
}

$('#addDepartmentBtnOfModal').click(addDepartmentBtnOfModalClickHandler);

function addDepartmentBtnOfModalClickHandler(){

    var data = {
        name: $('#addDepartmentInput').val(),
        upperDeptId : $('#addDepartmentSelect').val()
    };


    $.ajax({
        type: "POST",
        url: "/api/departments",
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function (data) {
            console.log(data);
            location.href = data;
        },
        error: function(data){
            console.log("실패");

        }
    });
}

document.addEventListener("DOMContentLoaded", function(){


    // 콘솔에 추가된 아이디 출력
    if (addedDepartmentId != 0) {
        console.log('Added Department ID:', addedDepartmentId);


        // 2초 동안 하늘색으로 표시할 요소 찾기
        const deptRow = document.querySelector(`td[data-dept-id="${addedDepartmentId}"]`);

        if (deptRow) {
            deptRow.style.backgroundColor = '#CCEDFF';  // 하늘색으로 변경

            // 2초 후 원래 색상으로 복원
            setTimeout(() => {
                deptRow.style.backgroundColor = '';  // 기본 색상으로 복원
            }, 2000);
        }
    }

    $('.department-element').on('click',
        updateDepartmentModalBtnClickHandler
    );


});



function updateDepartmentModalBtnClickHandler(){
    var updateModal = new bootstrap.Modal(document.getElementById('updateDepartmentModal'));
    var departments = []
    selectedDeptId = $(this).data('dept-id');
    var selectedUpperDeptId;
    console.log(selectedDeptId);

    updateModal.show();


    $.ajax({
        type: "GET",
        url: "/api/departments",
        success: function (data) {
            departments = data;

            var selectElement = $('#updateDepartmentSelect'); // #departmentSelect는 <select> 요소의 ID로 가정합니다.

            selectElement.empty();

            // 각 부서 옵션 추가
            departments.forEach(
                function(department) {
                    if (selectedDeptId == department.id){
                        selectedUpperDeptId = department.upperDeptId;
                        $('#updateDepartmentInput').val(department.name);
                    }

                    var indent = '&nbsp;'.repeat((department.level - 1) * 4); // 들여쓰기
                    selectElement.append('<option  value="' + department.id + '">' + indent + department.name + '</option>');


            });

            $('option[value="' + selectedUpperDeptId + '"]').prop('selected', true);
        },
        error: function(data){
            console.log("실패");

        }
    });
}


$('#updateDepartmentBtnOfModal').click(updateDepartmentBtnOfModalClickHandler);

function updateDepartmentBtnOfModalClickHandler(){
    console.log("저장");

    var data = {
        name: $('#updateDepartmentInput').val(),
        upperDeptId : $('#updateDepartmentSelect').val()
    };


    $.ajax({
        type: "PUT",
        url: "/api/departments/" + selectedDeptId,
        contentType: 'application/json',
        data: JSON.stringify(data),
        success: function (data) {
            console.log(data);
            location.href = data;
        },
        error: function(data){
            console.log("실패");

        }
    });
}



$('#deleteDepartmentBtnOfModal').click(deleteDepartmentBtnOfModalClickHandler);

function deleteDepartmentBtnOfModalClickHandler(){
    console.log("삭제");

    $('#updateDepartmentModal').modal('hide');
    $('#deleteConfirmModal').modal('show');



    $('#confirmCancelBtn').off('click').on('click', function() {
        // 모달 닫기
        $('#deleteConfirmModal').modal('hide');
        $('#updateDepartmentModal').modal('show');
    });

    $('#confirmDeleteBtn').off('click').on('click', function() {
        console.log("삭제");



        $.ajax({
            type: "DELETE",
            url: "/api/departments/" + selectedDeptId,
            success: function (data) {
                console.log(data);
                location.href = data; // 성공하면 페이지 리로드 또는 리다이렉트
            },
            error: function(data){
                console.log("실패");
            }
        });


    });
}

