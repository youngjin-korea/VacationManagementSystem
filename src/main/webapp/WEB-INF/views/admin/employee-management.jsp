<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />

    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/styles.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/employee-management.css" />
    <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />


</head>

<body>
<%@ include file="/resources/components/header.jsp" %>
<%@ include file="/resources/components/sidebar.jsp" %>
<div id="mainArea">
    <div class="d-flex justify-content-between m-5">
        <div class="col-3">
            <h3 class="fw-bold">직원관리</h3>
        </div>
        <div id="organization-btn-group" class="col-9 d-flex justify-content-end">
            <div class="mx-2">
                <button type="button" class="btn border border-black btn-black bg-white"><p>다운로드</p></button>
            </div>
            <div class="mx-2">
                <button id="uploadEmployeeBtn" type="button" class="btn border border-black btn-black bg-white"><p>업로드</p></button>
            </div>
            <div class="mx-2">
                <button id="addEmployeeBtn" type="button" class="btn btn-primary"><p>+ 직원 추가하기</p></button>
            </div>

        </div>

    </div>
    <div style="margin: 0 70px; position:relative;">
        <div class="my-4 d-flex justify-content-between align-items-center">
            <div class="col-4 d-flex">
                <h4>총 직원 수 1</h4>
                <div class="mx-2">
                    <button id="sendJoinCodeBtn" type="button" class="btn border border-black btn-black bg-white"><p>합류코드 전송(0)</p></button>
                </div>
            </div>
            <div class="col-2">
                <input class= "col-12 code-input ps-2 border" placeholder="검색.." type="text">
            </div>
        </div>
        <div class="s-table-container">
            <table class="table table-hover">
                <thead>
                <tr style="border-bottom: 2px solid rgb(160, 160, 160);">
                    <th colspan="col">
                        <div class ="checkbox-img">
                            <img src="/resources/assets/checkbox-unactive.png"/>
                        </div>
                    </th>
                    <th scope="col">사번</th>
                    <th scope="col">이름</th>
                    <th scope="col">액세스 권한</th>
                    <th scope="col">소속</th>
                    <th scope="col">직책</th>
                    <th scope="col">입사일</th>
                    <th scope="col">이메일</th>
                    <th scope="col" class="text-center">합류여부</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td colspan="col">
                        <div class ="checkbox-img">
                            <img src="/resources/assets/checkbox-unactive.png"/>
                        </div>
                    </td>
                    <td>105486</td>
                    <td>지승용</td>
                    <td>최고관리자</td>
                    <td>최상위부서</td>
                    <td>부서장</td>
                    <td>2024-08-31</td>
                    <td>gkfktkrh153@gmail.com</td>
                    <td class="text-center">O</td>
                </tr>
                <tr>
                    <td colspan="col">
                        <div class ="checkbox-img">
                            <img src="/resources/assets/checkbox-unactive.png"/>
                        </div>
                    </td>
                    <td>105486</td>
                    <td>지승용</td>
                    <td>최고관리자</td>
                    <td>최상위부서</td>
                    <td>부서장</td>
                    <td>2024-08-31</td>
                    <td>gkfktkrh153@gmail.com</td>
                    <td class="text-center">O</td>
                </tr>
                <tr>
                    <td colspan="col">
                        <div class ="checkbox-img">
                            <img src="/resources/assets/checkbox-unactive.png"/>
                        </div>
                    </td>
                    <td>105486</td>
                    <td>지승용</td>
                    <td>최고관리자</td>
                    <td>최상위부서</td>
                    <td>부서장</td>
                    <td>2024-08-31</td>
                    <td>gkfktkrh153@gmail.com</td>
                    <td class="text-center">O</td>
                </tr>
                <tr>
                    <td colspan="col">
                        <div class ="checkbox-img">
                            <img src="/resources/assets/checkbox-unactive.png"/>
                        </div>
                    </td>
                    <td>105486</td>
                    <td>지승용</td>
                    <td>최고관리자</td>
                    <td>최상위부서</td>
                    <td>부서장</td>
                    <td>2024-08-31</td>
                    <td>gkfktkrh153@gmail.com</td>
                    <td class="text-center">O</td>
                </tr>
                <tr>
                    <td colspan="col">
                        <div class ="checkbox-img">
                            <img src="/resources/assets/checkbox-unactive.png"/>
                        </div>
                    </td>
                    <td>105486</td>
                    <td>지승용</td>
                    <td>최고관리자</td>
                    <td>최상위부서</td>
                    <td>부서장</td>
                    <td>2024-08-31</td>
                    <td>gkfktkrh153@gmail.com</td>
                    <td class="text-center">O</td>
                </tr>
                <tr>
                    <td colspan="col">
                        <div class ="checkbox-img">
                            <img src="/resources/assets/checkbox-unactive.png"/>
                        </div>
                    </td>
                    <td>105486</td>
                    <td>지승용</td>
                    <td>최고관리자</td>
                    <td>최상위부서</td>
                    <td>부서장</td>
                    <td>2024-08-31</td>
                    <td>gkfktkrh153@gmail.com</td>
                    <td class="text-center">O</td>
                </tr>
                <tr>
                    <td colspan="col">
                        <div class ="checkbox-img">
                            <img src="/resources/assets/checkbox-unactive.png"/>
                        </div>
                    </td>
                    <td>105486</td>
                    <td>지승용</td>
                    <td>최고관리자</td>
                    <td>최상위부서</td>
                    <td>부서장</td>
                    <td>2024-08-31</td>
                    <td>gkfktkrh153@gmail.com</td>
                    <td class="text-center">O</td>
                </tr>
                <tr>
                    <td colspan="col">
                        <div class ="checkbox-img">
                            <img src="/resources/assets/checkbox-unactive.png"/>
                        </div>
                    </td>
                    <td>105486</td>
                    <td>지승용</td>
                    <td>최고관리자</td>
                    <td>최상위부서</td>
                    <td>부서장</td>
                    <td>2024-08-31</td>
                    <td>gkfktkrh153@gmail.com</td>
                    <td class="text-center">O</td>
                </tr>
                <tr>
                    <td colspan="col">
                        <div class ="checkbox-img">
                            <img src="/resources/assets/checkbox-unactive.png"/>
                        </div>
                    </td>
                    <td>105486</td>
                    <td>지승용</td>
                    <td>최고관리자</td>
                    <td>최상위부서</td>
                    <td>부서장</td>
                    <td>2024-08-31</td>
                    <td>gkfktkrh153@gmail.com</td>
                    <td class="text-center">O</td>
                </tr>
                </tbody>
            </table>

        </div>
    </div>

</div>

<!-- 직원추가 모달 -->
<div class="modal fade" id="addEmployeeModal" tabindex="-1">
    <div class="modal-dialog" style="margin-top:200px;">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title fs-5 fw-bold" id="exampleModalLabel">직원 추가하기</h2>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-flex flex-column">
                <div class="d-flex mb-3">
                    <div class="col-3 d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">사번</p></div>
                    <div class="col-6 d-flex align-items-center" style="position: relative">
                        <input type="text" class="form-control" style="border-radius: 2px;" >
                    </div>
                </div>
                <div class="d-flex mb-3">
                    <div class="col-3 d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">이름</p></div>
                    <div class="col-6 d-flex align-items-center" style="position: relative">
                        <input type="text" class="form-control" style="border-radius: 2px;" >
                    </div>
                </div>
                <div class="d-flex mb-3">
                    <div class="col-3 d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">이메일</p></div>
                    <div class="col-6 d-flex align-items-center" style="position: relative">
                        <input type="text" class="form-control" style="border-radius: 2px;" >
                    </div>
                </div>
                <div class="d-flex  mb-3">
                    <div class="col-3 d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">조직</p></div>
                    <div class="col-6">
                        <select class="form-select" id="inputGroupSelect01">
                            <option selected>최상위 부서</option>
                            <option value="1">영업부서</option>
                            <option value="2">영업 1팀</option>
                            <option value="3">영업 2팀</option>
                        </select>
                    </div>
                </div>
                <div class="d-flex mb-3">
                    <div class="col-3 d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">직책</p></div>
                    <div class="col-6 d-flex align-items-center" style="position: relative">
                        <input type="text" class="form-control" style="border-radius: 2px;" >
                    </div>
                </div>
                <div class="d-flex mb-3 ">
                    <div class="col-3 d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">권한</p></div>
                    <div class="col-6">
                        <select class="form-select" id="inputGroupSelect02">
                            <option selected>최고관리자</option>
                            <option value="1">1차 승인권자</option>
                            <option value="2">2차 승인권자</option>
                        </select>
                    </div>
                </div>
                <div class="d-flex mb-3 ">
                    <div class="col-3 d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">입사일</p></div>
                    <div class="col-6">
                        <input id="addEmployeeDatepicker" width="276" />
                    </div>
                </div>
                <div class="my-3 d-flex justify-content-start">
                    <p class ="text-color-gray2" style="font-size: 12px;">
                        * 직원을 추가하고 초대메일을 보내 조직을 구성하세요.

                </div>



            </div>
            <div class="modal-footer">
                <button id="modalCloseBtn" type="button" data-bs-dismiss="modal" class="btn border border-black btn-black bg-white" style="border-radius: 2px;"><p>닫기</p></button>
                <button id="addEmployeeBtnOfModal" type="button" data-bs-dismiss="modal"  class="btn btn-primary">추가하기</button>
            </div>
        </div>
    </div>
</div>

<!-- 합류 코드 전송 모달-->
<div class="modal fade" id="sendJoinCodeModal" tabindex="-1">
    <div class="modal-dialog" style="margin-top:200px;">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title fs-5 fw-bold">합류 코드 전송</h2>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-flex flex-column">

                <div class="d-flex mb-3">
                    <div class="d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">
                        <p>미합류 직원 : 0명</p>
                    </div>
                </div>
                <div class="d-flex">
                    <div class="d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">
                        <p style="color: #3391FF">합류코드가 전송될 직원들 : 0명</p>
                    </div>
                </div>
                <div class="d-flex">
                    <label class="form-check py-4 d-flex align-items-center" for="joinCodeRadio1">
                        <input class="form-check-input" name="joinCodeRadioForm" type="radio" id="joinCodeRadio1">
                        <span class="ms-2">즉시전송</span>
                    </label>
                    <label class="ms-4 form-check py-4 d-flex align-items-center" for="joinCodeRadio2">
                        <input class="form-check-input" name="joinCodeRadioForm" type="radio" id="joinCodeRadio2">
                        <span class="ms-2">예약전송</span>
                    </label>
                </div>

                <div class="d-flex">
                    <div class="col-6">
                        <input id="joinCodeDatepicker" width="200" />
                    </div>
                    <div class="col-6">
                        <input id="joinCodeTimePicker" type="time" class="form-control" value="10:05 AM" />
                    </div>
                </div>



                <div class="mb-3 d-flex justify-content-start">
                    <p class ="text-color-gray2" style="font-size: 12px;">
                        * 참고사항<br>
                        합류코드는 각 직원에 등록된 이메일로 전송됩니다.

                </div>



            </div>
            <div class="modal-footer">
                <button type="button" data-bs-dismiss="modal" class="btn border border-black btn-black bg-white" style="border-radius: 2px;"><p>닫기</p></button>
                <button id="sendJoinCodeBtnOfModal" type="button" data-bs-dismiss="modal"  class="btn btn-primary">전송하기</button>
            </div>
        </div>
    </div>
</div>

<!-- 직원업로드 모달 -->
<div class="modal fade" id="uploadEmployeeModal" tabindex="-1">
    <div class="modal-dialog" style="margin-top:200px;">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="modal-title fs-5 fw-bold">엑셀을 이용해 직원을 추가해보세요</h2>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-flex flex-column">

                <div class="d-flex mb-3">
                    <div class="d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">
                        <p>
                            직원 일괄추가 템플릿을 다운로드한 후,
                            <br>
                            템플릿 형식에 맞춰 직원정보를 입력한 뒤 업로드해주세요
                        </p>

                    </div>
                </div>
                <div class="d-flex">
                    <div class="d-flex col-12 justify-content-center align-items-center p-4" style="background-color: #E6EFFA">

                        <div>
                            <p class ="text-color-gray1" style="font-size: 15px">employees-upload.xlsx</p>
                        </div>
                        <button type="button" class="d-flex ms-2 btn btn-light border border-2 align-items-center" style="height: 27px;">
                            <p class ="text-color-gray1" style="font-size: 15px;">다운로드</p>
                        </button>
                    </div>
                </div>



            </div>
            <div class="modal-footer">
                <button type="button" data-bs-dismiss="modal" class="btn border border-black btn-black bg-white" style="border-radius: 2px;"><p>닫기</p></button>
                <button id="uploadEmployeePreviewBtnOfModal" type="button" data-bs-dismiss="modal"  class="btn btn-primary">업로드 미리보기</button>
            </div>
        </div>
    </div>
</div>

<!-- 직원업로드 미리보기 모달 -->
<div class="modal fade" id="uploadEmployeePreviewModal" tabindex="-1">
    <div class="modal-dialog" style="margin-top:100px; margin-left: 20vw; margin-right: 20vw;">
        <div class="modal-content" style="width: 60vw">
            <div class="modal-header">
                <h2 class="modal-title fs-5 fw-bold">업로드 미리보기</h2>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-flex flex-column">

                <div class="d-flex mb-3">
                    <div class="d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">
                        <p>
                            * 올바른 포맷으로 입력되지 않은 경우 붉은색으로 표시됩니다.
                        </p>
                    </div>
                </div>

                <div class="s-excel-table-container">
                    <table class="table table-hover">
                        <thead>
                        <tr style="border-bottom: 2px solid rgb(160, 160, 160);">
                            <th scope="col"></th>
                            <th scope="col">사번</th>
                            <th scope="col">이름</th>
                            <th scope="col">액세스 권한</th>
                            <th scope="col">소속</th>
                            <th scope="col">직책</th>
                            <th scope="col">입사일</th>
                            <th scope="col">이메일</th>
                            <th scope="col" class="text-center">합류여부</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td colspan="col">
                                1
                            </td>
                            <td>105486</td>
                            <td>지승용</td>
                            <td>최고관리자</td>
                            <td>최상위부서</td>
                            <td>부서장</td>
                            <td>2024-08-31</td>
                            <td>gkfktkrh153@gmail.com</td>
                            <td class="text-center">O</td>
                        </tr>
                        <tr>
                            <td colspan="col">
                                2
                            </td>
                            <td>105486</td>
                            <td>지승용</td>
                            <td>최고관리자</td>
                            <td>최상위부서</td>
                            <td>부서장</td>
                            <td>2024-08-31</td>
                            <td>gkfktkrh153@gmail.com</td>
                            <td class="text-center">O</td>
                        </tr>
                        <tr>
                            <td colspan="col">
                                3
                            </td>
                            <td>105486</td>
                            <td>지승용</td>
                            <td>최고관리자</td>
                            <td>최상위부서</td>
                            <td>부서장</td>
                            <td>2024-08-31</td>
                            <td>gkfktkrh153@gmail.com</td>
                            <td class="text-center">O</td>
                        </tr>
                        <tr>
                            <td colspan="col">
                                4
                            </td>
                            <td>105486</td>
                            <td>지승용</td>
                            <td>최고관리자</td>
                            <td>최상위부서</td>
                            <td>부서장</td>
                            <td>2024-08-31</td>
                            <td>gkfktkrh153@gmail.com</td>
                            <td class="text-center">O</td>
                        </tr>
                        <tr>
                            <td colspan="col">
                                5
                            </td>
                            <td>105486</td>
                            <td>지승용</td>
                            <td>최고관리자</td>
                            <td>최상위부서</td>
                            <td>부서장</td>
                            <td>2024-08-31</td>
                            <td>gkfktkrh153@gmail.com</td>
                            <td class="text-center">O</td>
                        </tr>
                        <tr>
                            <td colspan="col">
                                6
                            </td>
                            <td>105486</td>
                            <td>지승용</td>
                            <td>최고관리자</td>
                            <td>최상위부서</td>
                            <td>부서장</td>
                            <td>2024-08-31</td>
                            <td>gkfktkrh153@gmail.com</td>
                            <td class="text-center">O</td>
                        </tr>
                        <tr>
                            <td colspan="col">
                                7
                            </td>
                            <td>105486</td>
                            <td>지승용</td>
                            <td>최고관리자</td>
                            <td>최상위부서</td>
                            <td>부서장</td>
                            <td>2024-08-31</td>
                            <td>gkfktkrh153@gmail.com</td>
                            <td class="text-center">O</td>
                        </tr>
                        <tr>
                            <td colspan="col">
                                8
                            </td>
                            <td>105486</td>
                            <td>지승용</td>
                            <td>최고관리자</td>
                            <td>최상위부서</td>
                            <td>부서장</td>
                            <td>2024-08-31</td>
                            <td>gkfktkrh153@gmail.com</td>
                            <td class="text-center">O</td>
                        </tr>
                        <tr>
                            <td colspan="col">
                                9
                            </td>
                            <td>105486</td>
                            <td>지승용</td>
                            <td>최고관리자</td>
                            <td>최상위부서</td>
                            <td>부서장</td>
                            <td>2024-08-31</td>
                            <td>gkfktkrh153@gmail.com</td>
                            <td class="text-center">O</td>
                        </tr>
                        </tbody>
                    </table>

                </div>


            </div>
            <div class="modal-footer">
                <button type="button" data-bs-dismiss="modal" class="btn border border-black btn-black bg-white" style="border-radius: 2px;"><p>닫기</p></button>
                <button id="uploadEmployeeCompleteBtnOfModal" type="button" data-bs-dismiss="modal"  class="btn btn-primary">업로드</button>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

<script src="/resources/js/employee-management.js"></script>

<script>
    $('#addEmployeeDatepicker').datepicker({
        uiLibrary: 'bootstrap5'
    });
</script>

<script>
    $('#joinCodeDatepicker').datepicker({
        uiLibrary: 'bootstrap5'
    });
</script>

</body>
</html>
