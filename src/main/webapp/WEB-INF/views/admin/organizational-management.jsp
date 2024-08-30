<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />

    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/styles.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/organization-management.css" />
</head>

<body>
    <%@ include file="/resources/components/header.jsp" %>
    <%@ include file="/resources/components/sidebar.jsp" %>
    <div id="mainArea">
        <div class="d-flex justify-content-between m-5">
            <div class="col-3">
                <h3 class="fw-bold">조직관리</h3>
            </div>
            <div id="organization-btn-group" class="col-9 d-flex justify-content-end">
                <div class="mx-2">
                    <button type="button" class="btn border border-black btn-black bg-white"><p>다운로드</p></button>
                </div>
                <div class="mx-2">
                    <button type="button" class="btn border border-black btn-black bg-white"><p>업로드</p></button>
                </div>
                <div class="mx-2">
                    <button type="button" class="btn btn-primary"><p>+ 조직 추가하기</p></button>
                </div>

            </div>

        </div>
        <div style="margin: 0 70px; position:relative;">
            <table class="table table-hover">
                <thead>
                <tr style="border-bottom: 2px solid rgb(160, 160, 160);">
                    <th scope="col">조직명</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>최상위 부서</td>
                </tr>
                <tr >
                    <td style="padding-left: 60px;">ㄴ 영업부서</td>
                </tr>
                <tr>
                    <td style="padding-left: 120px;">ㄴ 영업 1팀</td>
                </tr>
                <tr>
                    <td>최상위 부서</td>
                </tr>
                <tr >
                    <td style="padding-left: 60px;">ㄴ 영업부서</td>
                </tr>
                <tr>
                    <td style="padding-left: 120px;">ㄴ 영업 1팀</td>
                </tr>
                <tr>
                    <td>최상위 부서</td>
                </tr>
                <tr >
                    <td style="padding-left: 60px;">ㄴ 영업부서</td>
                </tr>
                <tr>
                    <td style="padding-left: 120px;">ㄴ 영업 1팀</td>
                </tr>

                </tbody>
            </table>
            <div style="position:absolute; top: 3px; right: 0px;" ><input class= "col-12 code-input ps-2 border" placeholder="검색.." type="text"></div>
        </div>

    </div>

    <!-- 모달 -->
    <div class="modal fade" id="addOrganizationModal" tabindex="-1">
        <div class="modal-dialog" style="margin-top:200px;">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title fs-5 fw-bold" id="exampleModalLabel">조직 추가하기</h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body d-flex flex-column">
                    <div class="d-flex mb-3">
                        <div class="col-3 d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">조직명</p></div>
                        <div class="col-6 d-flex align-items-center" style="position: relative">
                            <input type="text" class="form-control" style="border-radius: 2px;" >
                        </div>
                    </div>
                    <div class="d-flex ">
                        <div class="col-3 d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">상위조직</p></div>
                        <div class="col-6">
                            <select class="form-select" id="inputGroupSelect01">
                                <option selected>최상위 부서</option>
                                <option value="1">영업부서</option>
                                <option value="2">영업 1팀</option>
                                <option value="3">영업 2팀</option>
                            </select>
                        </div>
                    </div>
                    <div class="my-3 d-flex justify-content-start">
                        <p class ="text-color-gray2" style="font-size: 12px;">
                            * 자유롭게 조직도를 구성해주세요! Depth는 7Level 까지 설정 가능합니다.
                            <br> * 원활한 서비스의 제공을 위해 가장 하위 레벨의 조직만이 팀원을 1명 이상 가집니다.
                        </p>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn border border-black btn-black bg-white" style="border-radius: 2px;"><p>닫기</p></button>
                    <button type="button" class="btn btn-primary">변경사항 저장</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    <script type="text/javascript">
        document.addEventListener("DOMContentLoaded", function(){
            var myModal = new bootstrap.Modal(document.getElementById('addOrganizationModal'));
            myModal.show();
        });

    </script>

</body>
</html>
