$('#addEmployeeBtn').click(addEmployeeBtnClickHandler);

function addEmployeeBtnClickHandler(){
    var myModal = new bootstrap.Modal(document.getElementById('addEmployeeModal'));
    myModal.show();
}
$('#sendJoinCodeBtn').click(sendJoinCodeBtnClickHandler);

function sendJoinCodeBtnClickHandler(){
    var myModal = new bootstrap.Modal(document.getElementById('sendJoinCodeModal'));
    myModal.show();
}
$('#uploadEmployeeBtn').click(uploadEmployeeBtnClickHandler);

function uploadEmployeeBtnClickHandler(){
    var myModal = new bootstrap.Modal(document.getElementById('uploadEmployeeModal'));
    myModal.show();
}



$('#modalCloseBtn').click(closeModalBtnClickHandler);

function closeModalBtnClickHandler(){
    console.log("closeBtn")


}

$('#addEmployeeBtnOfModal').click(addEmployeeBtnOfModalClickHandler);

function addEmployeeBtnOfModalClickHandler(){
    console.log("addEmployee")
}


$('#uploadEmployeePreviewBtnOfModal').click(uploadEmployeePreviewBtnOfModalClickHandler);

function uploadEmployeePreviewBtnOfModalClickHandler(){
    var myModal = new bootstrap.Modal(document.getElementById('uploadEmployeePreviewModal'));
    myModal.show();
}