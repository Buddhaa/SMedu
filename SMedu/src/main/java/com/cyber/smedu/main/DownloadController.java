package com.cyber.smedu.main;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DownloadController {

	
	@RequestMapping(value="/fileDownload")
	public ModelAndView download(@RequestParam(value="fileName") String fileName,
									MultipartHttpServletRequest request) {
		
		System.out.println("01 download <-- DownloadController.java");
		System.out.println("fileName : " + fileName);
		
		// download file save path 서버 배포용
		String savePath = request.getSession().getServletContext().getRealPath("/") +"resources/taskUpload/";
		
		/*// download file save path 개인 테스트용
		String savePath = "C:\\Users\\ssolt\\git\\SMedu1118\\SMedu\\src\\main\\webapp\\resources\\taskUpload\\";*/
		
		ModelAndView modelAndView = new ModelAndView();
		
		//파일 이름과 지정한 업로드 폴더를 이용하여, File 객체에 담고 File 객체를 ModelAndView의 객체로 저장
		modelAndView.addObject("fileName", new File(savePath + fileName));
		
		//ModelAndView의 View의 이름을 downloadView로 지정
		modelAndView.setViewName("downloadView");
		
		return modelAndView;
		
	}
}
