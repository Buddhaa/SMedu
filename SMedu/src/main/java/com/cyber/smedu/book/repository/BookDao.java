package com.cyber.smedu.book.repository;

import java.util.List;

import com.cyber.smedu.book.domain.BookDomain;

//인터페이스
public interface BookDao {

	List<BookDomain> bookListSelect();

}
