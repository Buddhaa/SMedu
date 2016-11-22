package com.cyber.smedu.stats.listener;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.catalina.core.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.FrameworkServlet;

import com.cyber.smedu.stats.domain.StatsDomain;
import com.cyber.smedu.stats.repository.StatsDao;
import com.cyber.smedu.stats.repository.StatsDaoImpl;

@WebListener
public class StatsListener implements HttpSessionListener{
		
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		HttpSession session = arg0.getSession();
		WebApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext(), FrameworkServlet.SERVLET_CONTEXT_PREFIX + "appServlet");
		
        StatsDao statsDao = context.getBean(StatsDaoImpl.class);
        
		Calendar c = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String day = sdf.format(c.getTime());
		System.out.println(day);
		System.out.println("--------------쿼리결과값:"+statsDao.isToday(day));
		
		StatsDomain stats = statsDao.isToday(day); //현재 날짜 기준으로 데이터 값 있는지 확인
		if(stats.getStatsDate()!= null) {
			statsDao.updateStats(day); //있을경우 카운터만 +1
		} else {
			stats.setStatsDate(day); 
			stats.setStatsCount(1);
			statsDao.insertStats(stats); //없을경우 테이터 만들어주고 조회수 +1
		}
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	

	
}