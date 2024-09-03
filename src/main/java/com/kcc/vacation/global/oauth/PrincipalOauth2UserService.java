package com.kcc.vacation.global.oauth;


import com.kcc.vacation.domain.employee.dto.request.EmployeeCreate;
import com.kcc.vacation.domain.employee.dto.request.EmployeeSocialDataUpdate;
import com.kcc.vacation.domain.employee.dto.response.Employee;
import com.kcc.vacation.domain.employee.mapper.EmployeeMapper;
import com.kcc.vacation.global.auth.PrincipalDetail;
import lombok.RequiredArgsConstructor;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
@RequiredArgsConstructor
public class PrincipalOauth2UserService extends DefaultOAuth2UserService {

    private final EmployeeMapper employeeMapper;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {

        // 구글 로그인 버튼 클릭 -> 구글 로그인 창 -> 로그인 완료 ->  AccessToken요청
        // UserRequest정보 -> loadUser함수 호출 -> 구글로부터 회원프로필 추출 -> 회원가입 -> OAuth2User -> Authentication
        OAuth2User oAuth2User = super.loadUser(userRequest);
        String provider = userRequest.getClientRegistration().getRegistrationId(); // google
        String providerId = "";
        String username = "";
        String email = "";


        if(provider.equals("kakao")){
            providerId = userRequest.getClientRegistration().getClientId();
            Map<String, Object> attributes = oAuth2User.getAttributes();
            email = (String) ((Map<String, Object>) attributes.get("kakao_account")).get("email");
            username = (String) ((Map<String, Object>) attributes.get("properties")).get("nickname");
        }
        else if(provider.equals("google")) {
            providerId = oAuth2User.getAttribute("sub");
            username =  (String) oAuth2User.getAttributes().get("name");
            email = oAuth2User.getAttribute("email");
        }

        String oauthId = provider + "_" + providerId; // google_214124115151 user만의 고유한 ID
        String role = "ROLE_USER";


        Employee userEntity = employeeMapper.findByEmail(email);

        /**
         *  @Description
         *  사원이 없다면 -> 관리자가 직원을 추가하지 않은 상태
         *
         *  사원은 존재하지만 합류여부 'TRUE'인 상태
         *  -> 소셜회원가입을 진행한 상태
         *  -> 비밀번호 등의 계정정보를 추가로 채운다.
         *
         *  사원은 존재하지만 합류여부가 'FALSE'인 상태
         *  -> 첫 접근
         *  -> 회원가입 진행
         *
         */

        /**
         * @Description
         *  사원이 없다면 -> 관리자가 직원을 추가하지 않은 상태
         *  사원은 존재하지만 합류여부 'TRUE'인 상태
         *  -> 폼회원가입을 진행한 상태
         *  -> oauthId 등의 계정정보를 추가로 채운다.
         *
         *  사원은 존재하지만 합류여부가 'FALSE'인 상태
         *  -> 첫 접근
         *  -> userEntity저장 및 회원가입 진행
         */
        if (userEntity == null) {
            System.out.println("등록되지 않은 계정");

        }
        else {
            employeeMapper.updateSocialData(
                    EmployeeSocialDataUpdate.builder()
                            .oauthId(oauthId)
                            .id(userEntity.getId())
                            .build());
            return new PrincipalDetail(userEntity, oAuth2User.getAttributes());

        }

        return new PrincipalDetail(userEntity, oAuth2User.getAttributes());
    }
}