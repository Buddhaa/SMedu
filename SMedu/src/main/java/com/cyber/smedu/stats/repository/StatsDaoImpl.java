package com.cyber.smedu.stats.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cyber.smedu.stats.domain.StatsDomain;

@Repository
public class StatsDaoImpl implements StatsDao{
	@Autowired SqlSessionTemplate sqlSession;
	String NS = "com.cyber.smedu.mapper.StatsMapper";	
	
	@Override
	public int updateStats(String day) {
		return sqlSession.update(NS+".updateStats", day);
	}
	@Override
	public int insertStats(StatsDomain stats) {
		return sqlSession.insert(NS+".insertStats", stats);
	}
	@Override
	public StatsDomain isToday(String day) {		
		return sqlSession.selectOne(NS+".isToday", day);
	}
	@Override
	public int totalCount() {		
		return sqlSession.selectOne(NS+".totalCount");
	}	
	@Override
	public int monthJoinStudentCount() {		
		return sqlSession.selectOne(NS+".monthJoinStudentCount");
	}		
	
}