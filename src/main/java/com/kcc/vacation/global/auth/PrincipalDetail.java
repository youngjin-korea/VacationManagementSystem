package com.kcc.vacation.global.auth;

import com.kcc.vacation.domain.employee.dto.response.Employee;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

@Data
public class PrincipalDetail implements UserDetails, OAuth2User {

    private Employee employee;
    private Map<String, Object> attributes;

    public PrincipalDetail(Employee employee) {
        this.employee = employee;
    }
    public PrincipalDetail(Employee employee, Map<String, Object> attributes) {
        this.employee = employee;
        this.attributes = attributes;
    }

    @Override
    public Map<String, Object> getAttributes() {
        return attributes;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        ArrayList<GrantedAuthority> collect = new ArrayList<>();
        collect.add(new GrantedAuthority(){

            @Override
            public String getAuthority() {
                return employee.getAuthority();
            }
        });


        return collect;
    }

    @Override
    public String getPassword() {
        return employee.getPassword();
    }

    @Override
    public String getUsername() {
        return employee.getEmail();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Override
    public String getName() {
        return "";
    }
}
