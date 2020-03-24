package com.spring.client.login.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.client.login.service.LoginService;
import com.spring.client.login.vo.LoginVO;

@Controller
@RequestMapping("/member")
public class LoginController {
	private Logger log = LoggerFactory.getLogger(LoginController.class);
	@Autowired
	private LoginService loginService;
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public String login() {
		log.info("login.do get 호출 성공");
		return "member/login";
	}
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public ModelAndView loginProc(@ModelAttribute("LoginVO") LoginVO lvo,
			HttpSession session, HttpServletRequest request) {
		log.info("login.do post 호출 성공");
		ModelAndView mav = new ModelAndView();
		String userId = lvo.getUserId();
		int resultData = loginService.loginHistoryInserts(lvo);
		
		if (resultData == 1) {
			mav.addObject("errCode", 1);
			mav.setViewName("member/login");
			return mav;
			
		}else {
			LoginVO vo = loginService.loginHistorySelect(userId);
			log.info("최근 로그인 일시 :" + new SimpleDateFormat("YYYY-MM-dd")
					.format(vo.getLastSuccessedLogin()));
			log.info("retry:" + vo.getRetry());
			
		if (vo.getRetry() >= 5) {
			if (new Date().getTime() - vo.getLastFailedLogin() < 30000) {
				mav.addObject("errCode", 6);
				mav.setViewName("member/login");
				return mav;
			}else {
				vo.setRetry(0);
				vo.setLastFailedLogin(0);
				loginService.loginHistoryUpdate(vo);
			}
			
		}
		LoginVO loginCheckResult
		= loginService.loginSelect(lvo.getUserId(), lvo.getUserPw());
		
		if(loginCheckResult == null) {
			vo.setRetry(vo.getRetry()+1);
			vo.setLastFailedLogin(new Date().getTime());
			loginService.loginHistoryUpdate(vo);
			
			mav.addObject("retry", vo.getRetry());
			mav.addObject("errCode", 1);
			mav.setViewName("member/login");
			return mav;
			
		}else {
			vo.setRetry(0);
			vo.setLastFailedLogin(0);
			vo.setLastSuccessedLogin(new Date().getTime());
			vo.setClientIP(request.getRemoteAddr());
			loginService.loginHistoryUpdate(vo);
		
			session.setAttribute("login", loginCheckResult);
			mav.setViewName("member/login");
			return mav;
		}
		}
	}
	@RequestMapping("/logout.do")
	public String logout(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		session = request.getSession(true);
		return "redirect:/member/login.do";
	}

}
