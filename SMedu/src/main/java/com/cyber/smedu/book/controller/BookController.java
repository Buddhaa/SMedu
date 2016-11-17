package com.cyber.smedu.book.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cyber.smedu.book.service.BookService;

@Controller
public class BookController {
	@Autowired BookService bookService;
	
	@RequestMapping(value="/admin/curriculum/bookList")
	public String adminBookList(Model model) {
		Map<String, Object> map = bookService.bookListSelect();
		model.addAttribute("bookList", map.get("bookList"));
		return "admin/curriculum/book_list";
	}
}
