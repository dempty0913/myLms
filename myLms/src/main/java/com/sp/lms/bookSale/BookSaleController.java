package com.sp.lms.bookSale;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("bookSale.bookSaleController")
@RequestMapping("/bookSale/*")
public class BookSaleController {
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String bookSale(Model model, HttpSession session) {

		return ".bookSale.bookSaleList";
	}
}
