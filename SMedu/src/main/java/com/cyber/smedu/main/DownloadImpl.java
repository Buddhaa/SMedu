package com.cyber.smedu.main;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

public class DownloadImpl extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> map, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		System.out.println("02 renderMergedOutputModel <-- DownloadImpl.java");

		File file = (File) map.get("fileName");
		String fileName = new String(file.getName());

		response.setContentType("application/download");

		int length = (int) file.length();
		response.setContentLength(length);

		// 브라우저 한글깨짐 처리
		String userAgent = request.getHeader("User-Agent");
		boolean ie = userAgent.indexOf("MSIE") > -1;

		if (ie) {
			fileName = URLEncoder.encode(fileName, "utf-8").replace("+", "%20");
			System.out.println("01 fileName : " + fileName);
		} else {
			fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
			response.setHeader("Content-Disposition", "attachment;" + " fileName=\"" + fileName + "\";");
			response.setHeader("Content-Transfer-Encoding", "binary");
			response.setContentLength((int) file.length());

			response.setHeader("Connection", "close");
			System.out.println("02 fileName : " + fileName);
		}

		OutputStream out = response.getOutputStream();
		FileInputStream fis = null;

		try {
			int temp;
			fis = new FileInputStream(file);
			while ((temp = fis.read()) != -1) {
				out.write(temp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
}
