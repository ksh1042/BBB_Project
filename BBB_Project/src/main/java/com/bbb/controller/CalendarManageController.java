package com.bbb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/calendar")
public class CalendarManageController {
	@RequestMapping(value="/calendar", method=RequestMethod.GET)
	public String calendarView() throws Exception {
		return "calendar/calendar";
	}
}
