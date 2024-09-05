<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />

    <title>부서관리</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/styles.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/department-management.css" />
    <link href="https://unpkg.com/gijgo@1.9.14/css/gijgo.min.css" rel="stylesheet" type="text/css" />
</head>

<body>
    <%@ include file="/resources/components/header.jsp" %>
    <%@ include file="/resources/components/sidebar.jsp" %>
    <div id="mainArea">
        <div class="d-flex justify-content-between m-5">
            <div class="col-3">
                <h3 class="fw-bold">부서관리</h3>
            </div>
            <div id="organization-btn-group" class="col-9 d-flex justify-content-end">
                <div class="mx-2">
                    <button id ="addDepartmentModalBtn" type="button" class="btn btn-primary"><p>+ 조직 추가하기</p></button>
                </div>

            </div>

        </div>
        <div style="margin: 0 70px; position:relative;">
            <div class="s-table-container">
                <table class="table table-hover">
                    <thead>
                    <tr style="border-bottom: 2px solid rgb(160, 160, 160);">
                        <th scope="col">조직명</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="department" items="${departments}">
                        <tr >
                            <td class = "department-element" data-dept-id="${department.id}" style="padding-left: ${department.level * 25}px;">
                                <c:choose>
                                    <c:when test="${department.level == 1}">
                                        ${department.name}
                                    </c:when>
                                    <c:otherwise>
                                        ㄴ ${department.name}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
             </div>
        </div>

    </div>

    <!-- 부서 추가 모달 -->
    <div class="modal fade" id="addDepartmentModal" tabindex="-1">
        <div class="modal-dialog modal-lg" style="margin-top:200px;">
            <div class="modal-content" >
                <div class="modal-header">
                    <h2 class="modal-title fs-5 fw-bold">부서 추가하기</h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body d-flex flex-column">
                    <div class="d-flex mb-3">
                        <div class="col-3 d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">부서명</p></div>
                        <div class="col-9 d-flex align-items-center" style="position: relative">
                            <input id="addDepartmentInput" type="text" class="form-control" style="border-radius: 2px;" >
                        </div>
                    </div>
                    <div class="d-flex ">
                        <div class="col-3 d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">상위부서</p></div>
                        <div class="col-9">
                            <select class="form-select" id="addDepartmentSelect">

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
                    <button type="button" class="btn border border-black btn-black bg-white" style="border-radius: 2px;" data-bs-dismiss="modal" aria-label="Close"><p>닫기</p></button>
                    <button id="addDepartmentBtnOfModal" type="button" class="btn btn-primary">부서 저장</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 부서 수정 모달 -->
    <div class="modal fade" id="updateDepartmentModal" tabindex="-1">
        <div class="modal-dialog modal-lg" style="margin-top:200px;">
            <div class="modal-content" >
                <div class="modal-header">
                    <h2 class="modal-title fs-5 fw-bold">부서 수정하기</h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body d-flex flex-column">
                    <div class="d-flex mb-3">
                        <div class="col-3 d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">부서명</p></div>
                        <div class="col-9 d-flex align-items-center" style="position: relative">
                            <input id="updateDepartmentInput" type="text" class="form-control" style="border-radius: 2px;" >
                        </div>
                    </div>
                    <div class="d-flex ">
                        <div class="col-3 d-flex align-items-center"><p style="margin-bottom: 0; padding-bottom: 2px;">상위부서</p></div>
                        <div class="col-9">
                            <select class="form-select" id="updateDepartmentSelect">

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
                <div class="modal-footer justify-content-between">
                    <div>
                        <button id="deleteDepartmentBtnOfModal" type="button" class="btn btn-primary">부서 삭제</button>
                    </div>
                    <div>
                        <button type="button" class="btn border border-black btn-black bg-white" style="border-radius: 2px;" data-bs-dismiss="modal" aria-label="Close"><p>닫기</p></button>
                        <button id="updateDepartmentBtnOfModal" type="button" class="btn btn-primary">부서 저장</button>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <!-- 삭제 확인 모달 -->
    <div class="modal fade" id="deleteConfirmModal" tabindex="-1" role="dialog" aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content" style="margin-top:200px;">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteConfirmModalLabel">삭제 확인</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    이 부서를 정말 삭제하시겠습니까?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" id="confirmCancelBtn" data-bs-dismiss="modal">취소</button>
                    <button type="button" class="btn btn-danger" id="confirmDeleteBtn">삭제</button>
                </div>
            </div>
        </div>
    </div>

    <script>

        const addedDepartmentId = ${addedDepartmentId};
    </script>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script src="https://unpkg.com/gijgo@1.9.14/js/gijgo.min.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    <script src="/resources/js/department-management.js"></script>



</body>
</html>
