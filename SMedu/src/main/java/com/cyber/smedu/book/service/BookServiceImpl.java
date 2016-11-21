package com.cyber.smedu.book.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyber.smedu.book.domain.BookDomain;
import com.cyber.smedu.book.repository.BookDao;

@Service
public class BookServiceImpl implements BookService {
	@Autowired BookDao bookDao;
	
	@Override
	public Map<String, Object> bookListSelect(String bookName) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bookName", bookName);
		List<BookDomain> bookList = bookDao.bookListSelect(map);
		map.put("bookList", bookList);
		return map;
	}
}
