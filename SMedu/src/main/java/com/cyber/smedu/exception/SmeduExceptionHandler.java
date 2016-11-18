package com.cyber.smedu.exception;

import org.springframework.web.HttpSessionRequiredException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice("com.cyber.smedu")
public class SmeduExceptionHandler {


	@ExceptionHandler(HttpSessionRequiredException.class)
	public String getExceptionHandler(){
		
		return"smedu/main/login_form";
	}	
	

}
