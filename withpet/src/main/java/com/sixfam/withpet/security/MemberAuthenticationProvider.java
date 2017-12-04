package com.sixfam.withpet.security;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.sixfam.withpet.model.dto.Authority;
import com.sixfam.withpet.model.dto.MemberDTO;
import com.sixfam.withpet.service.MemberService;


/*
 * Spring Security를 이용한 인증로직을 정의한 클래스 
 */

public class MemberAuthenticationProvider implements AuthenticationProvider{
	@Resource
	private MemberService memberService;
	@Resource
    private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {		
		//0.사용자가 입력한 ID 와 Password
		String id = authentication.getName();
		String password = (String)authentication.getCredentials();
		
		//1.파라미터로 전달받은 Authentication 객체에 대해 인증처리를 지원하지 않으면 null을 리턴한다.
		if(!supports(authentication.getClass()))
			return null;
		
		//2.사용자 정보를 디비로 부터 조회
		MemberDTO member = userInfoChk(id);
		
		//3.사용자가 입력한 비밀번호와 DB에 있는 비밀번호를 비교
		userPasswordChk(password, member.getPassword());
        
		//4.사용자의 권한을 토큰으로 생성하기위해 SimpleGrantedAuthority 타입으로 변경
		List<SimpleGrantedAuthority> authorities = createUserAuthToken(getUserAuth(id));
		
		//5.회원정보와 비밀번호, 권한을 넣어주면 토큰생성 됨
		Authentication auth = new UsernamePasswordAuthenticationToken(member, password, authorities);
		
		//6.ㅅㄱ!
		System.out.println("로그인 OK~"+auth);
		return auth;		
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return  UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}
	
	//ID로 사용자 정보 조회
	public MemberDTO userInfoChk(String id)  throws AuthenticationException {
		MemberDTO member = memberService.findMemberById(id);
		if(member == null)
			throw new UsernameNotFoundException("등록된 아이디가 존재하지 않습니다.");
		return member;
	}
	
	//사용자 Password 조회
	public void userPasswordChk(String inputPassword, String memberPassword) throws AuthenticationException  {
		if (!passwordEncoder.matches(inputPassword, memberPassword)) 
            throw new BadCredentialsException("비밀번호를 다시 확인해주세요.");
	}
	
	//사용자 Auth 조회
	public List<Authority> getUserAuth(String id) {
		List<Authority> list = memberService.getAuthorityListById(id);
		
		if(list.size() == 0 || list.get(0).getAuth().equals("ROLE_EXCEPT"))
			throw new UsernameNotFoundException("회원 권한이 없습니다.");
		else {
			for(int i=0;i<list.size();i++) {
				System.out.println(list.get(i));
			}
		}
		return list;
	}
	
	
	//조회한 사용자의 AuthList를 List형태로 Token생성
	public List<SimpleGrantedAuthority> createUserAuthToken(List<Authority> list) {
		List<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();
		for(Authority au : list){
			authorities.add(new SimpleGrantedAuthority(au.getAuth()));
		}
		return authorities;
	}
}
