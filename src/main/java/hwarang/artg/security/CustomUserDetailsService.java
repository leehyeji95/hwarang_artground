package hwarang.artg.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import hwarang.artg.mapper.MemberMapper;
import hwarang.artg.member.model.CustomUser;
import hwarang.artg.member.model.MemberVO;

public class CustomUserDetailsService implements UserDetailsService {
	@Autowired
	private MemberMapper mapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println("Load User By UserName : " + username);
		MemberVO vo = mapper.selectMember(username);
		System.out.println("queried by memeber mapper : " + vo);
		return vo == null ? null : new CustomUser(vo);
	}
}
