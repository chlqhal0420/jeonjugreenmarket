package jeonju.greenmarket.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import jeonju.greenmarket.vo.SecurityUserVO;

public class UserAuthenticationService implements UserDetailsService{
   
SqlSession sqlSession;
   
   public UserAuthenticationService() {}
   
   public UserAuthenticationService(SqlSession sqlSession) {
      this.sqlSession = sqlSession;
   }
   
   @Override
   public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
      
      Map<String,Object> user 
         = sqlSession.selectOne("jeonju.greenmarket.mapper.userMapper.selectLogin",username);
      
      if(user == null) {
         System.out.println("user::"+user);
         throw new UsernameNotFoundException(username);
      }
      
      List<GrantedAuthority> authority = new ArrayList<>();
      authority.add(new SimpleGrantedAuthority(user.get("authority").toString()));
      
      
      SecurityUserVO vo = new SecurityUserVO(user.get("username").toString()
                        ,user.get("password").toString()
                        ,Integer.parseInt(user.get("created_by").toString())
                        ,user.get("phone").toString()
                        ,user.get("email").toString()
                        ,(Integer)Integer.valueOf(user.get("enabled").toString()) == 1
                        ,true
                        ,true
                        ,true
                        ,authority
                        ,user.get("authority").toString()
                        ,user.get("name").toString());
      
      return vo;
   }
}