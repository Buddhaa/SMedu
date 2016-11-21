package com.cyber.smedu.book.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cyber.smedu.book.service.BookService;

@Controller
public class BookController {
	@Autowired BookService bookService;
	
	@RequestMapping(value="/admin/curriculum/bookList")
	public String adminBookList(Model model,
										@RequestParam(value="bookName", defaultValue="") String bookName) {
		Map<String, Object> map = bookService.bookListSelect(bookName);
		model.addAttribute("bookName", bookName);
		model.addAttribute("bookList", map.get("bookList"));
		return "admin/curriculum/book_list";
	}
}
