package com.harunichi.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.harunichi.member.vo.MemberVo;

public interface MemberController {
	//요청 페이지 보여주는 메소드
	public ModelAndView showForms(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//로그인메소드
	public ModelAndView login (@RequestParam Map<String, String> loginMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//로그아웃메소드
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	//회원가입메소드
	public ResponseEntity addMember(@ModelAttribute("member") MemberVo member, HttpServletRequest request, HttpServletResponse response) throws Exception;
	//아이디 중복확인 메소드
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;

}
