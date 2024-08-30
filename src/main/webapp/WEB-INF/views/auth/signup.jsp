<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />

    <title>회원가입</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/styles.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/signup.css" />
  </head>

  <body>
    <div id="customHeader">
      <div id="imgContainer" class= "d-flex">
        
        <div class ="me-2">       
          <img src="/resources/assets/logo.png" alt="Logo" />
        </div>
        <div>
          <h2>NeoV</h2>
        </div>
      </div>
    </div>

    <div id="mainContent" class = "container d-flex justify-content-center">
        <div class = "col-6 d-flex flex-column"> 
          <div class="d-flex justify-content-center">
            <h2 class="fw-bold">환영합니다!</h2>
          </div>
          <div class="d-flex justify-content-center">
            <h6 class= "text-color-gray1">휴가관리 솔루션 NeoV, 지금 바로 시작해보세요</h6>
          </div>
          <div class="d-flex justify-content-start"><p class="fw-bold">이메일</p></div>
          <div class="d-flex justify-content-start">
            <input type="text" class="form-control"  aria-label="Username" aria-describedby="basic-addon1">
          </div>

          <div class="d-flex justify-content-start" style="margin-top:16px;"><p class="fw-bold">비밀번호</p></div>
          <div class="d-flex justify-content-start">
            <input type="text" class="form-control"  aria-label="Username" aria-describedby="basic-addon1">
          </div>
          <div class="d-flex justify-content-start"><p class ="text-color-gray2">* 10자 이상이면서 영문, 숫자, 특수문자를 모두 포함하세요</p></div>


          <div class="d-flex justify-content-start"><p class="fw-bold">비밀번호 재확인</p></div>
          <div class="d-flex justify-content-start">
            <input type="text" class="form-control"  aria-label="Username" aria-describedby="basic-addon1">
          </div>
          <div class="d-flex justify-content-start"><p class ="text-color-gray2">* 비밀번호를 다시 입력해주세요</p></div>

          <div class = "d-flex">
            <div class = "col-6 pe-3">
              <div class="d-flex justify-content-start"><p class="fw-bold">이름<p></div>
              <div class="d-flex justify-content-start">
                <input type="text" class="form-control"  aria-label="Username" aria-describedby="basic-addon1">
              </div>
            </div>

            <div class = "col-6 ps-3">
              <div class="d-flex justify-content-start"><p class="fw-bold">전화번호(선택)<p></div>
              <div class="d-flex justify-content-start">
                <input type="text" class="form-control"  aria-label="Username" aria-describedby="basic-addon1">
              </div>
            </div>
          </div>

          <hr>
          <button class="d-flex justify-content-center btn border text-color-white" style="background-color:#3391FF;" type="button">
            <div class ="d-flex  login-img">       
              <p style="margin:0px;">이메일로 가입하기</p>
            </div>
          </button>


          <div style="position:relative;">
            <hr style ="margin: 30px 0px;">
            <div style = "position:absolute; left:48%; top:17px; height:50px; margin: 0px 5px; background-color:white;"><p> OR </p></div>
          </div>

          <button class="d-flex btn btn-white mb-4 border text-color-gray1" type="button">
            <div class ="col-4 d-flex justify-content-end ms-4 me-2 google-login-img">       
              <img src="/resources/assets/google.PNG" alt="Logo" />
            </div>
            <p style="margin:0px;">Google 계정으로 가입하기</p>
          </button>
          <button class="d-flex  btn  mb-4 border text-color-gray1" style="background-color:#FFE812;" type="button">
            <div class ="col-4 d-flex justify-content-end ms-4  me-2 login-img">       
              <img src="/resources/assets/kakaotalk.png" alt="Logo" />
            </div>
            <p style="margin:0px;">카카오 계정으로 가입하기</p>
          </button>
          <button class="d-flex btn  mb-4 border text-color-white" style="background-color:#00BF18;" type="button">
            <div class ="col-4 d-flex justify-content-end ms-4 me-2 login-img">       
              <img src="/resources/assets/naver.png" alt="Logo" />
            </div>
            <p style="margin:0px;">네이버 계정으로 가입하기</p>
          </button>



        </div>
      </div>



  </body>
</html>
