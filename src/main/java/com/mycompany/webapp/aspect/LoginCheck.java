package com.mycompany.webapp.aspect;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import lombok.extern.log4j.Log4j2;

@Component
@Aspect
@Log4j2
public class LoginCheck {
	
	@Around("@annotation(com.mycompany.webapp.aspect.mypageLoginCheck)")
	public Object loginCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		
		log.info("실행");
		ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		
		HttpServletRequest request = sra.getRequest();
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("sessionUserId");
		log.info(userId);
		if(userId == null) {
			return "redirect:/index/loginForm";
		} else {
			Object result = joinPoint.proceed();
			return result;
		}
	}
}
