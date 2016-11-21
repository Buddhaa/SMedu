package com.cyber.smedu.book.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cyber.smedu.book.domain.BookDomain;

@Repository
public class BookDaoImpl implements BookDao {
	@Autowired SqlSessionTemplate sqlSession;
	String NS = "com.cyber.smedu.mapper.BookMapper";
	
	@Override
	public List<BookDomain> bookListSelect(Map<String, Object> map) {
		return sqlSession.selectList(NS+".bookListSelect", map);
	}
}