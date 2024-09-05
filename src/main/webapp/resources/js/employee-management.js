let departments = [];
let selectedEmpId = null;
/**
 * 페이지 로딩 시
 */

document.addEventListener("DOMContentLoaded", function(){
    resolveTotalNumber();
    // 콘솔에 추가된 아이디 출력
    if (addedEmployeeId != null) {
        console.log('Added Department ID:', addedEmployeeId);


        // 2초 동안 하늘색으로 표시할 요소 찾기
        const deptRows = document.querySelectorAll(`tr[data-emp-id="${addedEmployeeId}"] td`);
        const deptRow = document.querySelector(`tr[data-emp-id="${addedEmployeeId}"]`);

        //
        console.log(deptRow);
        deptRow.scrollIntoView({ behavior: 'smooth', block: 'end' });
        console.log(deptRows);

        if (deptRows) {
            deptRows.forEach(td =>{
                td.style.backgroundColor = '#CCEDFF';  // 하늘색으로 변경

                // 2초 후 원래 색상으로 복원
                setTimeout(() => {
                    td.style.backgroundColor = '';  // 기본 색상으로 복원
                }, 2000);
            });
        }
    }
    console.log('11');

    $('.employee-element').on('click',
        employeeElementClickHandler
    );
    $('#employee-element-header').on('click',
        employeeElementHeaderClickHandler,
        console.log("전체 선택 버튼 이벤트 등록")
    );



});

function employeeElementClickHandler(){


    $(this).find('img').attr('src') === '/resources/assets/checkbox-active.png' ?
        $(this).find('img').attr('src', '/resources/assets/checkbox-unactive.png'):
        $(this).find('img').attr('src', '/resources/assets/checkbox-active.png');

    resolveClickedNumber();
}
function employeeElementHeaderClickHandler(){


    // img의 현재 상태를 보고 변경
    let imgSrcToBeChanged =
        $(this).find('img').attr('src') === '/resources/assets/checkbox-active.png' ?
            '/resources/assets/checkbox-unactive.png': '/resources/assets/checkbox-active.png'

    console.log(imgSrcToBeChanged);


    $(this).find('img').attr('src', imgSrcToBeChanged); // 전체 선택 버튼 변경
    $('.employee-element').find('img').attr('src',  imgSrcToBeChanged); // 선택 버튼 전체 변경
    resolveClickedNumber();
}


// 미합류 직원 수
function resolveUnJoinedNumber(){
    var filteredImages = $('.employee-element').filter(function() {
        // 현재 요소에서 .joinState 클래스의 텍스트가 'X'인지 확인
        return $(this).find('.joinState').text().trim() === 'X';
    });

    $('#unJoinedNumber').text("미합류 직원 수(" + filteredImages.length + ")");

}


function resolveClickedNumber(){

    /**
     *   1. 현재 요소에서 .joinState 클래스의 텍스트가 'X'인지 확인
     *   2. 현재 요소에서 img 태그의 src 속성이 '/resources/assets/checkbox-active.png'인지 확인
     *   3. 두 조건 모두 만족한다면 합류코드가 전송될 직원들의 수
     */

    var filteredImages = $('.employee-element').filter(function() {

        var isJoinStateX = $(this).find('.joinState').text().trim() === 'X';
        var isImageSrcActive = $(this).find('img').attr('src') === '/resources/assets/checkbox-active.png';

        // 두 조건 모두 만족하는지 확인
        return isJoinStateX && isImageSrcActive;
    });

    $('#clickedNumber1').text("합류코드 전송(" + filteredImages.length + ")");
    $('#clickedNumber2').text("합류코드가 전송될 직원들(" + filteredImages.length + ")");

    /**
     *   1. 현재 요소에서 img 태그의 src 속성이 '/resources/assets/checkbox-active.png'인지 확인
     *   2. 모든 체크된 인원을 의미
     *   3. 1명일 때는 정보 수정 버튼을 생성
     */

    filteredImages = $('.employee-element').filter(function() {

        var isImageSrcActive = $(this).find('img').attr('src') === '/resources/assets/checkbox-active.png';
        return isImageSrcActive;
    });

    if (filteredImages.length === 1){
        $('#empUpdateBtn').show();
    }
    else
        $('#empUpdateBtn').hide();

}

// 총 사원의 수 관리
function resolveTotalNumber(){
    $('#totalNumber').text("총 인원 수 (" +  $('.employee-element').length + ")");
}



/**
 * 직원 추가
 */

$('#addEmployeeBtn').click(addEmployeeBtnClickHandler);

function addEmployeeBtnClickHandler(){
    var myModal = new bootstrap.Modal(document.getElementById('addEmployeeModal'));
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




$('#addEmployeeBtnOfModal').click(addEmployeeBtnOfModalClickHandler);

function addEmployeeBtnOfModalClickHandler(){
    console.log("직원추가요청");

    var data = {
        name: $('#addEmployeeNameInput').val(),
        email: $('#addEmployeeEmailInput').val(),
        deptId:$('#updateDepartmentSelect option:selected').val(),
        position: $('#addEmployeePositionInput').val(),
        authority: $('#addEmployeeIdAuthoritySelect').val(),
        hireDate: $('#addEmployeeDatepicker').val(),

    };
    console.log($('#addEmployeeDepartmentIdSelect').val());


    $.ajax({
        type: "POST",
        url: "/api/employees",
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

/**
 * 직원 수정
 */


$('#empUpdateBtn').click(updateEmployeeBtnClickHandler);

function updateEmployeeBtnClickHandler(){
    var updateModal = new bootstrap.Modal(document.getElementById('updateEmployeeModal'));
    updateModal.show();

    $.ajax({
        type: "GET",
        url: "/api/departments",
        success: function (data) {
            departments = data;
            console.log(departments);
            var selectElement = $('#updateDepartmentSelect'); // #departmentSelect는 <select> 요소의 ID로 가정합니다.

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

    var filteredImage = $('.employee-element').filter(function() {

        var isImageSrcActive = $(this).find('img').attr('src') === '/resources/assets/checkbox-active.png';
        return isImageSrcActive;
    });

    selectedEmpId =  filteredImage.data('emp-id');

    console.log(selectedEmpId);
    $.ajax({
        type: "GET",
        url: "/api/auth/employees/" + selectedEmpId,
        success: function (data) {
            let employee = data;

            $('#updateEmployeeIdAuthoritySelect option').each(function() {
                if ($(this).text().substring(0, 2) === employee.authority.substring(0,2)) {
                    $(this).prop('selected', true);
                    return false; // 조건에 맞는 첫 번째 option만 선택 후 루프 종료
                }
            });

            const formattedDate = formatDate(employee.hireDate);
            console.log(formattedDate);

            $('#updateEmployeeNameInput').val(employee.name);
            $('#updateEmployeeEmailInput').val(employee.email);
            $('#updateEmployeeDepartmentIdSelect').val(employee.deptId);
            $('#updateEmployeePositionInput').val(employee.position)
            $('#updateEmployeeDatepicker').val(formattedDate);

        },
        error: function(data){
            console.log("실패");

        }
    });



}

$('#updateEmployeeBtnOfModal').click(updateEmployeeBtnOfModalClickHandler);

function updateEmployeeBtnOfModalClickHandler(){

    console.log("직원수정요청");
    console.log(selectedEmpId);
    updateEmployee();

}

function updateEmployee(){
    var data = {
        name: $('#updateEmployeeNameInput').val(),
        email: $('#updateEmployeeEmailInput').val(),
        deptId:$('#updateDepartmentSelect option:selected').val(),
        position: $('#updateEmployeePositionInput').val(),
        authority: $('#updateEmployeeIdAuthoritySelect').val(),
        hireDate: $('#updateEmployeeDatepicker').val(),

    };
    console.log(data);

    $.ajax({
        type: "PUT",
        url: "/api/employees/" + selectedEmpId,
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

/**
 *  합류코드 전송
 */

$('#sendJoinCodeBtn').click(sendJoinCodeBtnClickHandler);

function sendJoinCodeBtnClickHandler(){
    var myModal = new bootstrap.Modal(document.getElementById('sendJoinCodeModal'));
    resolveUnJoinedNumber();
    myModal.show();
}
/**
 *  사원 정보 업로드
 */


$('#uploadEmployeeBtn').click(uploadEmployeeBtnClickHandler);

function uploadEmployeeBtnClickHandler(){
    var myModal = new bootstrap.Modal(document.getElementById('uploadEmployeeModal'));
    myModal.show();
}



$('#uploadEmployeePreviewBtnOfModal').click(uploadEmployeePreviewBtnOfModalClickHandler);

function uploadEmployeePreviewBtnOfModalClickHandler(){
    var myModal = new bootstrap.Modal(document.getElementById('uploadEmployeePreviewModal'));
    myModal.show();
}


/**
 * 직원 삭제
 */

$('#deleteEmployeeBtnOfModal').click(deleteEmployeeBtnOfModalClickHandler);

function deleteEmployeeBtnOfModalClickHandler(){
    console.log("삭제");

    $('#updateEmployeeModal').modal('hide');
    $('#deleteConfirmModal').modal('show');



    $('#confirmCancelBtn').off('click').on('click', function() {
        // 모달 닫기
        $('#deleteConfirmModal').modal('hide');
        $('#updateEmployeeModal').modal('show');
    });

    $('#confirmDeleteBtn').off('click').on('click', function() {
        console.log("삭제");



        $.ajax({
            type: "DELETE",
            url: "/api/employees/" + selectedEmpId,
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



function formatDate(isoString) {
    // 문자열을 Date 객체로 변환
    const date = new Date(isoString);

    // 연도, 월, 일 추출
    const year = date.getFullYear();
    const month = ('0' + (date.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 1을 더함
    const day = ('0' + date.getDate()).slice(-2);

    // 원하는 형식으로 반환
    return `${year}-${month}-${day}`;
}

// 사용 예시

